/**
 * Runtime factory — loads the Wasm module and provides a high-level API.
 *
 * Usage:
 *   import { createRuntime } from "@sschepis/as-agent";
 *   const rt = await createRuntime();
 *   const help = rt.renderSlashCommandHelp();
 */
/** The low-level Wasm exports after instantiation. */
export interface WasmExports {
    memory: WebAssembly.Memory;
    formatUsd(amount: number): string;
    pricingForModel(model: string): unknown | null;
    messageRoleToString(role: number): string;
    messageRoleFromString(s: string): number;
    permissionModeAsStr(mode: number): string;
    filesystemIsolationModeAsStr(mode: number): string;
    filesystemIsolationModeFromStr(s: string): number;
    formatCompactSummary(summary: string): string;
    getCompactContinuationMessage(summary: string, suppressFollowUpQuestions: boolean, recentMessagesPreserved: boolean): string;
    hookEventAsStr(event: number): string;
    renderSlashCommandHelp(): string;
    slashCommandSpecs(): unknown[];
    resumeSupportedSlashCommands(): unknown[];
    MessageRole: Record<string, number>;
    PermissionMode: Record<string, number>;
    FilesystemIsolationMode: Record<string, number>;
    ConfigSource: Record<string, number>;
    ResolvedPermissionMode: Record<string, number>;
    McpTransport: Record<string, number>;
    HookEvent: Record<string, number>;
    CommandSource: Record<string, number>;
    BootstrapPhase: Record<string, number>;
    CLAUDE_CODE_SETTINGS_SCHEMA_NAME: {
        readonly value: string;
    };
    JSON_NULL: {
        readonly value: number;
    };
    JSON_BOOL: {
        readonly value: number;
    };
    JSON_NUMBER: {
        readonly value: number;
    };
    JSON_STRING: {
        readonly value: number;
    };
    JSON_ARRAY: {
        readonly value: number;
    };
    JSON_OBJECT: {
        readonly value: number;
    };
    BLOCK_TEXT: {
        readonly value: number;
    };
    BLOCK_TOOL_USE: {
        readonly value: number;
    };
    BLOCK_TOOL_RESULT: {
        readonly value: number;
    };
    EVENT_TEXT_DELTA: {
        readonly value: number;
    };
    EVENT_TOOL_USE: {
        readonly value: number;
    };
    EVENT_USAGE: {
        readonly value: number;
    };
    EVENT_MESSAGE_STOP: {
        readonly value: number;
    };
}
/**
 * High-level runtime API wrapping the Wasm module.
 */
export interface AgentRuntime {
    /** Raw Wasm exports for advanced usage. */
    readonly wasm: WasmExports;
    /** Format a USD amount to 4 decimal places. */
    formatUsd(amount: number): string;
    /** Get pricing for a model name (haiku/sonnet/opus), or null if unknown. */
    pricingForModel(model: string): unknown | null;
    /** Convert a MessageRole enum value to its string name. */
    messageRoleToString(role: number): string;
    /** Parse a role string ("user", "assistant", etc.) to its enum value. */
    messageRoleFromString(s: string): number;
    /** Convert a PermissionMode enum to its string label. */
    permissionModeAsStr(mode: number): string;
    /** Format a compaction summary (strips analysis tags, formats summary). */
    formatCompactSummary(summary: string): string;
    /** Build a continuation message from a compaction summary. */
    getCompactContinuationMessage(summary: string, suppressFollowUpQuestions: boolean, recentMessagesPreserved: boolean): string;
    /** Convert a HookEvent to its string name. */
    hookEventAsStr(event: number): string;
    /** Render the full slash command help text. */
    renderSlashCommandHelp(): string;
    /** Get all slash command specs. */
    slashCommandSpecs(): unknown[];
    /** Get only resume-supported slash command specs. */
    resumeSupportedSlashCommands(): unknown[];
    readonly MessageRole: Record<string, number>;
    readonly PermissionMode: Record<string, number>;
    readonly BootstrapPhase: Record<string, number>;
    readonly ConfigSource: Record<string, number>;
    readonly McpTransport: Record<string, number>;
    readonly HookEvent: Record<string, number>;
    readonly CommandSource: Record<string, number>;
    readonly CLAUDE_CODE_SETTINGS_SCHEMA_NAME: string;
}
/**
 * Load the Wasm module and return a high-level AgentRuntime.
 *
 * @param wasmPath - Optional custom path to the .wasm file.
 *                   Defaults to the bundled release.wasm.
 */
export declare function createRuntime(wasmPath?: string): Promise<AgentRuntime>;
//# sourceMappingURL=runtime.d.ts.map