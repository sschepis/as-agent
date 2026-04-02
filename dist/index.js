/**
 * @sschepis/as-agent — AssemblyScript agent runtime
 *
 * Provides a conversation engine, session management, tool execution,
 * permission system, and slash commands. Core logic runs in WebAssembly;
 * this module re-exports ergonomic TypeScript types and the Wasm bindings.
 */
// ── Pure TypeScript types (no Wasm dependency) ─────────────────────
export { MessageRole } from "./types/session.js";
export { PermissionMode } from "./types/permissions.js";
export { HookEvent } from "./types/hooks.js";
export { AssistantEventKind } from "./types/conversation.js";
export { CommandSource, BootstrapPhase } from "./types/commands.js";
export { ConfigSource, ResolvedPermissionMode, McpTransport } from "./types/config.js";
export { FilesystemIsolationMode } from "./types/sandbox.js";
// ── Runtime (creates instances, loads Wasm) ────────────────────────
export { createRuntime } from "./runtime.js";
//# sourceMappingURL=index.js.map