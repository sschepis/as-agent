export declare enum HookEvent {
    PreToolUse = 0,
    PostToolUse = 1
}
export interface HookRunResult {
    denied: boolean;
    messages: string[];
}
export interface HookCommandResult {
    exitCode: number;
    stdout: string;
    stderr: string;
}
export interface HookCommandHandler {
    execute(command: string, env: Map<string, string>, stdinPayload: string): HookCommandResult;
}
export interface HookRunner {
    runPreToolUse(toolName: string, toolInput: string): HookRunResult;
    runPostToolUse(toolName: string, toolInput: string, toolOutput: string, isError: boolean): HookRunResult;
}
//# sourceMappingURL=hooks.d.ts.map