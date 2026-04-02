// Hook runner — ported from rust/crates/runtime/src/hooks.rs
// Note: Actual shell execution is stubbed. The hook protocol (events, results) is fully ported.

import { RuntimeHookConfig, RuntimeFeatureConfig } from "./config";

export const enum HookEvent {
  PreToolUse = 0,
  PostToolUse = 1,
}

export function hookEventAsStr(event: HookEvent): string {
  switch (event) {
    case HookEvent.PreToolUse:
      return "PreToolUse";
    case HookEvent.PostToolUse:
      return "PostToolUse";
    default:
      return "Unknown";
  }
}

export class HookRunResult {
  private _denied: bool;
  private _messages: Array<string>;

  constructor(denied: bool, messages: Array<string>) {
    this._denied = denied;
    this._messages = messages;
  }

  static allow(messages: Array<string>): HookRunResult {
    return new HookRunResult(false, messages);
  }

  static deny(messages: Array<string>): HookRunResult {
    return new HookRunResult(true, messages);
  }

  isDenied(): bool {
    return this._denied;
  }

  messages(): Array<string> {
    return this._messages;
  }
}

/**
 * HookCommandHandler — abstract class for executing hook commands.
 * In a WASI environment, implement this to call out to shell processes.
 * The default NoOpHookCommandHandler always allows.
 */
export abstract class HookCommandHandler {
  /**
   * Execute a hook command and return (exitCode, stdout, stderr).
   * Exit code 0 = allow, 2 = deny, anything else = warn.
   */
  abstract execute(
    command: string,
    env: Map<string, string>,
    stdinPayload: string
  ): HookCommandResult;
}

export class HookCommandResult {
  constructor(
    public exitCode: i32,
    public stdout: string,
    public stderr: string
  ) {}
}

/** Default no-op handler that always allows (returns exit code 0, no output). */
export class NoOpHookCommandHandler extends HookCommandHandler {
  execute(
    _command: string,
    _env: Map<string, string>,
    _stdinPayload: string
  ): HookCommandResult {
    return new HookCommandResult(0, "", "");
  }
}

export class HookRunner {
  private config: RuntimeHookConfig;
  private handler: HookCommandHandler;

  constructor(
    config: RuntimeHookConfig = new RuntimeHookConfig(),
    handler: HookCommandHandler | null = null
  ) {
    this.config = config;
    this.handler = handler != null ? handler! : new NoOpHookCommandHandler();
  }

  static fromFeatureConfig(
    featureConfig: RuntimeFeatureConfig,
    handler: HookCommandHandler | null = null
  ): HookRunner {
    return new HookRunner(featureConfig.getHooks(), handler);
  }

  runPreToolUse(toolName: string, toolInput: string): HookRunResult {
    return this.runCommands(
      HookEvent.PreToolUse,
      this.config.getPreToolUse(),
      toolName,
      toolInput,
      "",
      false
    );
  }

  runPostToolUse(
    toolName: string,
    toolInput: string,
    toolOutput: string,
    isError: bool
  ): HookRunResult {
    return this.runCommands(
      HookEvent.PostToolUse,
      this.config.getPostToolUse(),
      toolName,
      toolInput,
      toolOutput,
      isError
    );
  }

  private runCommands(
    event: HookEvent,
    commands: Array<string>,
    toolName: string,
    toolInput: string,
    toolOutput: string,
    isError: bool
  ): HookRunResult {
    if (commands.length == 0) {
      return HookRunResult.allow([]);
    }

    const payload =
      '{"hook_event_name":"' +
      hookEventAsStr(event) +
      '","tool_name":"' +
      toolName +
      '","tool_input_json":' +
      JSON.stringify(toolInput) +
      ',"tool_output":' +
      JSON.stringify(toolOutput) +
      ',"tool_result_is_error":' +
      (isError ? "true" : "false") +
      "}";

    const messages = new Array<string>();

    for (let i = 0; i < commands.length; i++) {
      const env = new Map<string, string>();
      env.set("HOOK_EVENT", hookEventAsStr(event));
      env.set("HOOK_TOOL_NAME", toolName);
      env.set("HOOK_TOOL_INPUT", toolInput);
      env.set("HOOK_TOOL_IS_ERROR", isError ? "1" : "0");
      if (toolOutput.length > 0) {
        env.set("HOOK_TOOL_OUTPUT", toolOutput);
      }

      const result = this.handler.execute(commands[i], env, payload);
      const stdout = result.stdout.trim();
      const message = stdout.length > 0 ? stdout : "";

      if (result.exitCode == 0) {
        if (message.length > 0) messages.push(message);
      } else if (result.exitCode == 2) {
        const denyMsg =
          message.length > 0
            ? message
            : hookEventAsStr(event) + " hook denied tool `" + toolName + "`";
        messages.push(denyMsg);
        return HookRunResult.deny(messages);
      } else {
        // Warn — non-zero non-deny exit code
        let warnMsg =
          "Hook `" +
          commands[i] +
          "` exited with status " +
          result.exitCode.toString() +
          "; allowing tool execution to continue";
        if (message.length > 0) {
          warnMsg += ": " + message;
        } else if (result.stderr.trim().length > 0) {
          warnMsg += ": " + result.stderr.trim();
        }
        messages.push(warnMsg);
      }
    }

    return HookRunResult.allow(messages);
  }
}
