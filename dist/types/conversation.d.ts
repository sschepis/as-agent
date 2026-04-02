import type { ConversationMessage, Session } from "./session.js";
import type { TokenUsage } from "./usage.js";
import type { CompactionConfig, CompactionResult } from "./compact.js";
import type { PermissionPrompter } from "./permissions.js";
import type { UsageTracker } from "./usage.js";
export interface ApiRequest {
    systemPrompt: string[];
    messages: ConversationMessage[];
}
export declare enum AssistantEventKind {
    TextDelta = 0,
    ToolUse = 1,
    Usage = 2,
    MessageStop = 3
}
export interface AssistantEvent {
    kind: AssistantEventKind;
    text?: string;
    id?: string;
    name?: string;
    input?: string;
    usage?: TokenUsage;
}
export interface ApiClient {
    stream(request: ApiRequest): AssistantEvent[];
}
export interface ToolExecuteResult {
    output: string;
    isError: boolean;
}
export interface ToolExecutor {
    execute(toolName: string, input: string): ToolExecuteResult;
}
export interface AutoCompactionEvent {
    removedMessageCount: number;
}
export interface TurnSummary {
    assistantMessages: ConversationMessage[];
    toolResults: ConversationMessage[];
    iterations: number;
    usage: TokenUsage;
    autoCompaction: AutoCompactionEvent | null;
}
export interface ConversationRuntime {
    runTurn(userInput: string, prompter?: PermissionPrompter | null): TurnSummary;
    compact(config: CompactionConfig): CompactionResult;
    usage(): UsageTracker;
    session(): Session;
}
//# sourceMappingURL=conversation.d.ts.map