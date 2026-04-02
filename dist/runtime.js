/**
 * Runtime factory — loads the Wasm module and provides a high-level API.
 *
 * Usage:
 *   import { createRuntime } from "@sschepis/as-agent";
 *   const rt = await createRuntime();
 *   const help = rt.renderSlashCommandHelp();
 */
import { readFile } from "node:fs/promises";
import { fileURLToPath } from "node:url";
import { dirname, join } from "node:path";
/**
 * Load the Wasm module and return a high-level AgentRuntime.
 *
 * @param wasmPath - Optional custom path to the .wasm file.
 *                   Defaults to the bundled release.wasm.
 */
export async function createRuntime(wasmPath) {
    const resolvedPath = wasmPath ??
        join(dirname(fileURLToPath(import.meta.url)), "..", "build", "release.wasm");
    const wasmBuffer = await readFile(resolvedPath);
    const arrayBuffer = new Uint8Array(wasmBuffer).buffer;
    const wasmModule = await WebAssembly.compile(arrayBuffer);
    // Dynamic import of the generated bindings
    const bindingsPath = join(dirname(fileURLToPath(import.meta.url)), "..", "build", "release.js");
    const bindings = await import(bindingsPath);
    // The generated release.js auto-instantiates. We use its exports directly.
    const wasm = bindings;
    return {
        wasm,
        formatUsd: (amount) => wasm.formatUsd(amount),
        pricingForModel: (model) => wasm.pricingForModel(model),
        messageRoleToString: (role) => wasm.messageRoleToString(role),
        messageRoleFromString: (s) => wasm.messageRoleFromString(s),
        permissionModeAsStr: (mode) => wasm.permissionModeAsStr(mode),
        formatCompactSummary: (summary) => wasm.formatCompactSummary(summary),
        getCompactContinuationMessage: (summary, suppress, preserved) => wasm.getCompactContinuationMessage(summary, suppress, preserved),
        hookEventAsStr: (event) => wasm.hookEventAsStr(event),
        renderSlashCommandHelp: () => wasm.renderSlashCommandHelp(),
        slashCommandSpecs: () => wasm.slashCommandSpecs(),
        resumeSupportedSlashCommands: () => wasm.resumeSupportedSlashCommands(),
        MessageRole: wasm.MessageRole,
        PermissionMode: wasm.PermissionMode,
        BootstrapPhase: wasm.BootstrapPhase,
        ConfigSource: wasm.ConfigSource,
        McpTransport: wasm.McpTransport,
        HookEvent: wasm.HookEvent,
        CommandSource: wasm.CommandSource,
        get CLAUDE_CODE_SETTINGS_SCHEMA_NAME() {
            return wasm.CLAUDE_CODE_SETTINGS_SCHEMA_NAME.value;
        },
    };
}
//# sourceMappingURL=runtime.js.map