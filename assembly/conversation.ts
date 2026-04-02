// Conversation runtime — ported from rust/crates/runtime/src/conversation.rs

import {
  ContentBlock,
  ConversationMessage,
  MessageRole,
  Session,
  BLOCK_TEXT,
  BLOCK_TOOL_USE,
  BLOCK_TOOL_RESULT,
} from "./session";
import { TokenUsage, UsageTracker } from "./usage";
import { CompactionConfig, compactSession } from "./compact";
import { RuntimeFeatureConfig, RuntimeHookConfig } from "./config";
import { HookRunner, HookRunResult, HookCommandHandler } from "./hooks";
import {
  PermissionOutcome,
  PermissionPolicy,
  PermissionPrompter,
} from "./permissions";

const DEFAULT_AUTO_COMPACTION_INPUT_TOKENS_THRESHOLD: u32 = 200_000;

export class ApiRequest {
  constructor(
    public systemPrompt: Array<string>,
    public messages: Array<ConversationMessage>
  ) {}
}

// --- AssistantEvent discriminated union ---

export const EVENT_TEXT_DELTA: u8 = 0;
export const EVENT_TOOL_USE: u8 = 1;
export const EVENT_USAGE: u8 = 2;
export const EVENT_MESSAGE_STOP: u8 = 3;

export class AssistantEvent {
  kind: u8;
  text: string;
  id: string;
  name: string;
  input: string;
  usage: TokenUsage | null;

  private constructor(kind: u8) {
    this.kind = kind;
    this.text = "";
    this.id = "";
    this.name = "";
    this.input = "";
    this.usage = null;
  }

  static TextDelta(text: string): AssistantEvent {
    const e = new AssistantEvent(EVENT_TEXT_DELTA);
    e.text = text;
    return e;
  }

  static ToolUse(id: string, name: string, input: string): AssistantEvent {
    const e = new AssistantEvent(EVENT_TOOL_USE);
    e.id = id;
    e.name = name;
    e.input = input;
    return e;
  }

  static Usage(usage: TokenUsage): AssistantEvent {
    const e = new AssistantEvent(EVENT_USAGE);
    e.usage = usage;
    return e;
  }

  static MessageStop(): AssistantEvent {
    return new AssistantEvent(EVENT_MESSAGE_STOP);
  }
}

// --- Abstract interfaces (implemented by host) ---

export abstract class ApiClient {
  abstract stream(request: ApiRequest): Array<AssistantEvent>;
}

export abstract class ToolExecutor {
  abstract execute(toolName: string, input: string): ToolExecuteResult;
}

export class ToolExecuteResult {
  constructor(public output: string, public isError: bool) {}

  static ok(output: string): ToolExecuteResult {
    return new ToolExecuteResult(output, false);
  }

  static error(message: string): ToolExecuteResult {
    return new ToolExecuteResult(message, true);
  }
}

export class ToolError {
  constructor(public message: string) {}
  toString(): string {
    return this.message;
  }
}

export class RuntimeError {
  constructor(public message: string) {}
  toString(): string {
    return this.message;
  }
}

export class TurnSummary {
  constructor(
    public assistantMessages: Array<ConversationMessage>,
    public toolResults: Array<ConversationMessage>,
    public iterations: i32,
    public usage: TokenUsage,
    public autoCompaction: AutoCompactionEvent | null
  ) {}
}

export class AutoCompactionEvent {
  constructor(public removedMessageCount: i32) {}
}

// --- Static tool executor (for testing / simple usage) ---

export class StaticToolExecutor extends ToolExecutor {
  private handlers: Map<string, (input: string) => ToolExecuteResult>;

  constructor() {
    super();
    this.handlers = new Map<string, (input: string) => ToolExecuteResult>();
  }

  register(
    toolName: string,
    handler: (input: string) => ToolExecuteResult
  ): StaticToolExecutor {
    this.handlers.set(toolName, handler);
    return this;
  }

  execute(toolName: string, input: string): ToolExecuteResult {
    if (!this.handlers.has(toolName)) {
      return ToolExecuteResult.error("unknown tool: " + toolName);
    }
    return this.handlers.get(toolName)(input);
  }
}

// --- Conversation Runtime ---

export class ConversationRuntime {
  private session: Session;
  private apiClient: ApiClient;
  private toolExecutor: ToolExecutor;
  private permissionPolicy: PermissionPolicy;
  private systemPrompt: Array<string>;
  private maxIterations: i32;
  private usageTracker: UsageTracker;
  private hookRunner: HookRunner;
  private autoCompactionInputTokensThreshold: u32;

  constructor(
    session: Session,
    apiClient: ApiClient,
    toolExecutor: ToolExecutor,
    permissionPolicy: PermissionPolicy,
    systemPrompt: Array<string>,
    featureConfig: RuntimeFeatureConfig | null = null,
    hookHandler: HookCommandHandler | null = null
  ) {
    this.session = session;
    this.apiClient = apiClient;
    this.toolExecutor = toolExecutor;
    this.permissionPolicy = permissionPolicy;
    this.systemPrompt = systemPrompt;
    this.maxIterations = I32.MAX_VALUE;
    this.usageTracker = new UsageTracker();

    // Reconstruct usage from existing session
    for (let i = 0; i < session.messages.length; i++) {
      if (session.messages[i].usage != null) {
        this.usageTracker.record(session.messages[i].usage!);
      }
    }

    const fc = featureConfig != null ? featureConfig! : RuntimeFeatureConfig.default();
    this.hookRunner = HookRunner.fromFeatureConfig(fc, hookHandler);
    this.autoCompactionInputTokensThreshold = DEFAULT_AUTO_COMPACTION_INPUT_TOKENS_THRESHOLD;
  }

  withMaxIterations(maxIterations: i32): ConversationRuntime {
    this.maxIterations = maxIterations;
    return this;
  }

  withAutoCompactionInputTokensThreshold(threshold: u32): ConversationRuntime {
    this.autoCompactionInputTokensThreshold = threshold;
    return this;
  }

  runTurn(
    userInput: string,
    prompter: PermissionPrompter | null
  ): TurnSummary {
    this.session.messages.push(ConversationMessage.userText(userInput));

    const assistantMessages = new Array<ConversationMessage>();
    const toolResults = new Array<ConversationMessage>();
    let iterations: i32 = 0;

    while (true) {
      iterations++;
      if (iterations > this.maxIterations) {
        throw new RuntimeError(
          "conversation loop exceeded the maximum number of iterations"
        );
      }

      const request = new ApiRequest(
        this.systemPrompt.slice(0),
        this.session.messages.slice(0)
      );
      const events = this.apiClient.stream(request);
      const buildResult = buildAssistantMessage(events);
      const assistantMessage = buildResult.message;
      const usage = buildResult.usage;

      if (usage != null) {
        this.usageTracker.record(usage!);
      }

      // Collect pending tool uses
      const pendingToolUses = new Array<ToolUseInfo>();
      for (let i = 0; i < assistantMessage.blocks.length; i++) {
        const block = assistantMessage.blocks[i];
        if (block.kind == BLOCK_TOOL_USE) {
          pendingToolUses.push(new ToolUseInfo(block.id, block.name, block.input));
        }
      }

      this.session.messages.push(assistantMessage.clone());
      assistantMessages.push(assistantMessage);

      if (pendingToolUses.length == 0) {
        break;
      }

      for (let i = 0; i < pendingToolUses.length; i++) {
        const toolUseId = pendingToolUses[i].id;
        const toolName = pendingToolUses[i].name;
        const input = pendingToolUses[i].input;

        const permissionOutcome = this.permissionPolicy.authorize(toolName, input, prompter);

        let resultMessage: ConversationMessage;

        if (permissionOutcome.isAllow()) {
          const preHookResult = this.hookRunner.runPreToolUse(toolName, input);
          if (preHookResult.isDenied()) {
            const denyMessage = "PreToolUse hook denied tool `" + toolName + "`";
            resultMessage = ConversationMessage.toolResult(
              toolUseId,
              toolName,
              formatHookMessage(preHookResult, denyMessage),
              true
            );
          } else {
            const execResult = this.toolExecutor.execute(toolName, input);
            let output = execResult.output;
            let isError = execResult.isError;

            output = mergeHookFeedback(preHookResult.messages(), output, false);

            const postHookResult = this.hookRunner.runPostToolUse(
              toolName,
              input,
              output,
              isError
            );
            if (postHookResult.isDenied()) {
              isError = true;
            }
            output = mergeHookFeedback(
              postHookResult.messages(),
              output,
              postHookResult.isDenied()
            );

            resultMessage = ConversationMessage.toolResult(
              toolUseId,
              toolName,
              output,
              isError
            );
          }
        } else {
          resultMessage = ConversationMessage.toolResult(
            toolUseId,
            toolName,
            permissionOutcome.reason,
            true
          );
        }

        this.session.messages.push(resultMessage.clone());
        toolResults.push(resultMessage);
      }
    }

    const autoCompaction = this.maybeAutoCompact();

    return new TurnSummary(
      assistantMessages,
      toolResults,
      iterations,
      this.usageTracker.cumulativeUsage(),
      autoCompaction
    );
  }

  compact(config: CompactionConfig): CompactionResult {
    return compactSession(this.session, config);
  }

  getUsage(): UsageTracker {
    return this.usageTracker;
  }

  getSession(): Session {
    return this.session;
  }

  private maybeAutoCompact(): AutoCompactionEvent | null {
    if (
      this.usageTracker.cumulativeUsage().inputTokens <
      this.autoCompactionInputTokensThreshold
    ) {
      return null;
    }

    const result = compactSession(
      this.session,
      new CompactionConfig(4, 0) // preserve 4 recent, max tokens 0 to force compact
    );

    if (result.removedMessageCount == 0) {
      return null;
    }

    this.session = result.compactedSession;
    return new AutoCompactionEvent(result.removedMessageCount);
  }
}

// --- Internal helpers ---

class ToolUseInfo {
  constructor(public id: string, public name: string, public input: string) {}
}

class BuildResult {
  constructor(
    public message: ConversationMessage,
    public usage: TokenUsage | null
  ) {}
}

// Need to import CompactionResult for the return type
import { CompactionResult } from "./compact";

function buildAssistantMessage(events: Array<AssistantEvent>): BuildResult {
  let text = "";
  const blocks = new Array<ContentBlock>();
  let finished = false;
  let usage: TokenUsage | null = null;

  for (let i = 0; i < events.length; i++) {
    const event = events[i];
    switch (event.kind) {
      case EVENT_TEXT_DELTA:
        text += event.text;
        break;
      case EVENT_TOOL_USE:
        if (text.length > 0) {
          blocks.push(ContentBlock.Text(text));
          text = "";
        }
        blocks.push(ContentBlock.ToolUse(event.id, event.name, event.input));
        break;
      case EVENT_USAGE:
        usage = event.usage;
        break;
      case EVENT_MESSAGE_STOP:
        finished = true;
        break;
    }
  }

  if (text.length > 0) {
    blocks.push(ContentBlock.Text(text));
  }

  if (!finished) {
    throw new RuntimeError("assistant stream ended without a message stop event");
  }
  if (blocks.length == 0) {
    throw new RuntimeError("assistant stream produced no content");
  }

  return new BuildResult(
    ConversationMessage.assistantWithUsage(blocks, usage),
    usage
  );
}

function formatHookMessage(result: HookRunResult, fallback: string): string {
  if (result.messages().length == 0) return fallback;
  return result.messages().join("\n");
}

function mergeHookFeedback(
  messages: Array<string>,
  output: string,
  denied: bool
): string {
  if (messages.length == 0) return output;

  const sections = new Array<string>();
  if (output.trim().length > 0) {
    sections.push(output);
  }
  const label = denied ? "Hook feedback (denied)" : "Hook feedback";
  sections.push(label + ":\n" + messages.join("\n"));
  return sections.join("\n\n");
}
