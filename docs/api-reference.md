# API Reference

## Quick Start

```typescript
import { createRuntime } from "@sschepis/as-agent";

const rt = await createRuntime();
```

## `createRuntime(wasmPath?: string): Promise<AgentRuntime>`

Loads the Wasm module and returns a high-level `AgentRuntime` object. Optionally accepts a custom path to the `.wasm` file (defaults to the bundled `build/release.wasm`).

---

## AgentRuntime

The main interface returned by `createRuntime()`.

### Properties

| Property | Type | Description |
|---|---|---|
| `wasm` | `WasmExports` | Raw Wasm exports for advanced usage |
| `MessageRole` | `Record<string, number>` | Enum: `System=0, User=1, Assistant=2, Tool=3` |
| `PermissionMode` | `Record<string, number>` | Enum: `ReadOnly=0, WorkspaceWrite=1, DangerFullAccess=2, ScopedApproval=3, AutoApprove=4` |
| `BootstrapPhase` | `Record<string, number>` | Enum: 12 phases from `Init=0` to `MainRuntime=11` |
| `ConfigSource` | `Record<string, number>` | Enum: `Default=0, Project=1, User=2, Env=3` |
| `McpTransport` | `Record<string, number>` | Enum: `Stdio=0, Sse=1, Http=2, Ws=3, Sdk=4, ClaudeAiProxy=5` |
| `HookEvent` | `Record<string, number>` | Enum: `PreToolUse=0, PostToolUse=1, Notification=2, Stop=3, SubagentStop=4` |
| `CommandSource` | `Record<string, number>` | Enum: `User=0, Headless=1, Resume=2, Api=3` |
| `CLAUDE_CODE_SETTINGS_SCHEMA_NAME` | `string` | Constant: `"SettingsSchema"` |

### Methods

#### `formatUsd(amount: number): string`

Formats a USD amount to 4 decimal places.

```typescript
rt.formatUsd(15.0);    // "$15.0000"
rt.formatUsd(0.0015);  // "$0.0015"
```

#### `pricingForModel(model: string): unknown | null`

Returns pricing info for a model name (`"haiku"`, `"sonnet"`, `"opus"`), or `null` if unknown.

#### `messageRoleToString(role: number): string`

Converts a `MessageRole` enum value to its string name.

```typescript
rt.messageRoleToString(0); // "system"
rt.messageRoleToString(1); // "user"
rt.messageRoleToString(2); // "assistant"
```

#### `messageRoleFromString(s: string): number`

Parses a role string to its enum value.

```typescript
rt.messageRoleFromString("user");      // 1
rt.messageRoleFromString("assistant"); // 2
```

#### `permissionModeAsStr(mode: number): string`

Converts a `PermissionMode` enum to its string label.

```typescript
rt.permissionModeAsStr(0); // "read-only"
rt.permissionModeAsStr(1); // "workspace-write"
rt.permissionModeAsStr(2); // "danger-full-access"
```

#### `formatCompactSummary(summary: string): string`

Strips `<analysis>` tags and formats a compaction summary.

```typescript
rt.formatCompactSummary("<analysis>scratch</analysis>\n<summary>Work done</summary>");
// "Summary:\nWork done"
```

#### `getCompactContinuationMessage(summary: string, suppressFollowUpQuestions: boolean, recentMessagesPreserved: boolean): string`

Builds the continuation message sent after session compaction.

#### `hookEventAsStr(event: number): string`

Converts a `HookEvent` to its string name.

```typescript
rt.hookEventAsStr(0); // "PreToolUse"
rt.hookEventAsStr(1); // "PostToolUse"
```

#### `renderSlashCommandHelp(): string`

Returns the full slash command help text listing all 22 commands.

#### `slashCommandSpecs(): unknown[]`

Returns all 22 slash command specification objects.

#### `resumeSupportedSlashCommands(): unknown[]`

Returns the 11 slash commands that support session resume.

---

## TypeScript Type Interfaces

Import types for your own code:

```typescript
import type {
  Session,
  ConversationMessage,
  ContentBlock,
  TokenUsage,
  PermissionPolicy,
  CompactionConfig,
  SlashCommandSpec,
  RuntimeConfig,
  SandboxConfig,
} from "@sschepis/as-agent";
```

See [types.md](types.md) for the full type reference.
