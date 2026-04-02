# @sschepis/as-agent

AssemblyScript agent runtime — conversation engine, session management, tool execution, permission system, and slash commands.

## Install

```bash
npm install @sschepis/as-agent
```

## Quick start

```typescript
import { createRuntime } from "@sschepis/as-agent";

const rt = await createRuntime();

// Slash command help
console.log(rt.renderSlashCommandHelp());

// Model pricing
const pricing = rt.pricingForModel("claude-opus-4-6");

// Format costs
console.log(rt.formatUsd(15.0)); // "$15.0000"

// Enums
console.log(rt.MessageRole.Assistant); // 2
console.log(rt.PermissionMode.WorkspaceWrite); // 1
```

## Package structure

### JavaScript/TypeScript consumers

```typescript
// High-level API (loads Wasm automatically)
import { createRuntime } from "@sschepis/as-agent";

// Type-only imports for your own code
import type {
  Session,
  ConversationMessage,
  ContentBlock,
  TokenUsage,
  PermissionPolicy,
  CompactionConfig,
  SlashCommandSpec,
} from "@sschepis/as-agent";
```

### Raw Wasm bindings

```typescript
// Direct access to the auto-generated Wasm bindings
import { renderSlashCommandHelp, formatUsd } from "@sschepis/as-agent/wasm";
```

### AssemblyScript consumers

```typescript
// Import AS source files directly for AS-to-AS projects
import { Session, ConversationMessage } from "@sschepis/as-agent/assembly";
```

## Modules

| Module | Description |
|--------|-------------|
| `json` | JSON value type and parser (zero dependencies) |
| `session` | `MessageRole`, `ContentBlock`, `ConversationMessage`, `Session` with JSON serialization |
| `usage` | `TokenUsage`, `UsageTracker`, `ModelPricing`, cost estimation |
| `permissions` | `PermissionMode`, `PermissionPolicy`, authorization logic |
| `compact` | Session compaction with summary generation |
| `conversation` | `ConversationRuntime` with turn loop, `ApiClient`/`ToolExecutor` interfaces |
| `commands` | 22 slash commands, parsing, help rendering |
| `config` | `RuntimeConfig`, MCP server configs, config parsing |
| `hooks` | Hook runner with pluggable command handler |
| `sandbox` | `SandboxConfig`, filesystem isolation modes |
| `bootstrap` | Bootstrap phase definitions |
| `stubs` | Abstract interfaces for host I/O (file system, bash, MCP, OAuth) |

## I/O stubs

The core logic is pure computation. I/O operations are defined as abstract classes in the AssemblyScript source, meant to be implemented by the host environment:

- **`FileSystem`** — `readFile`, `writeFile`, `editFile`, `globSearch`, `grepSearch`
- **`BashExecutor`** — Shell command execution
- **`McpServerManager`** — MCP tool/resource operations
- **`OAuthHandler`** — PKCE + credential persistence
- **`HookCommandHandler`** — Hook shell execution

## Building from source

```bash
cd assembly
npm install
npm run build          # builds Wasm + TypeScript
npm test               # runs smoke tests
```

## License

MIT
