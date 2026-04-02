# Type Reference

All types are importable from `@sschepis/as-agent`:

```typescript
import type { Session, ConversationMessage, ... } from "@sschepis/as-agent";
```

---

## Session Module

### `MessageRole` (enum)

| Value | Name |
|---|---|
| 0 | `System` |
| 1 | `User` |
| 2 | `Assistant` |
| 3 | `Tool` |

### `ContentBlock` (discriminated union)

```typescript
type ContentBlock = TextBlock | ToolUseBlock | ToolResultBlock;

interface TextBlock {
  kind: "text";
  text: string;
}

interface ToolUseBlock {
  kind: "tool_use";
  toolUseId: string;
  toolName: string;
  toolInput: string; // JSON string
}

interface ToolResultBlock {
  kind: "tool_result";
  toolUseId: string;
  content: string;
  isError: boolean;
}
```

### `ConversationMessage`

```typescript
interface ConversationMessage {
  role: MessageRole;
  blocks: ContentBlock[];
  timestamp: number; // epoch ms
}
```

### `Session`

```typescript
interface Session {
  id: string;
  messages: ConversationMessage[];
  createdAt: number;
  updatedAt: number;
}
```

---

## Usage Module

### `TokenUsage`

```typescript
interface TokenUsage {
  inputTokens: number;
  outputTokens: number;
  cacheCreationInputTokens: number;
  cacheReadInputTokens: number;
}
```

### `UsageCostEstimate`

```typescript
interface UsageCostEstimate {
  inputCost: number;
  outputCost: number;
  totalCost: number;
}
```

### `ModelPricing`

```typescript
interface ModelPricing {
  modelId: string;
  inputPricePerMToken: number;
  outputPricePerMToken: number;
  cacheWritePricePerMToken: number;
  cacheReadPricePerMToken: number;
}
```

### `UsageTracker`

```typescript
interface UsageTracker {
  totalUsage: TokenUsage;
  turnUsages: TokenUsage[];
  addTurn(usage: TokenUsage): void;
  estimateCost(pricing: ModelPricing): UsageCostEstimate;
  reset(): void;
}
```

---

## Permissions Module

### `PermissionMode` (enum)

| Value | Name | Description |
|---|---|---|
| 0 | `ReadOnly` | No write operations allowed |
| 1 | `WorkspaceWrite` | Can write within workspace |
| 2 | `DangerFullAccess` | Full system access |
| 3 | `ScopedApproval` | Per-tool approval with persistence |
| 4 | `AutoApprove` | Auto-approve all operations |

### `PermissionRequest`

```typescript
interface PermissionRequest {
  toolName: string;
  description: string;
  readOnly: boolean;
  workspacePath: string | null;
}
```

### `PermissionPromptDecision`

```typescript
interface PermissionPromptDecision {
  allowed: boolean;
  persistForSession: boolean;
  persistForWorkspace: boolean;
}
```

### `PermissionOutcome`

```typescript
interface PermissionOutcome {
  allowed: boolean;
  reason: string;
}
```

### `PermissionPrompter` (abstract)

```typescript
interface PermissionPrompter {
  prompt(request: PermissionRequest): PermissionPromptDecision;
}
```

### `PermissionPolicy`

```typescript
interface PermissionPolicy {
  mode: PermissionMode;
  prompter: PermissionPrompter | null;
  authorize(request: PermissionRequest): PermissionOutcome;
}
```

---

## Compaction Module

### `CompactionConfig`

```typescript
interface CompactionConfig {
  maxTokens: number;          // trigger threshold (default: 200000)
  preserveRecentTurns: number; // turns to keep uncompacted (default: 4)
  summaryMaxTokens: number;    // max summary length (default: 8000)
}
```

### `CompactionResult`

```typescript
interface CompactionResult {
  compacted: boolean;
  summary: string;
  messagesRemoved: number;
  messagesKept: number;
}
```

---

## Hooks Module

### `HookEvent` (enum)

| Value | Name |
|---|---|
| 0 | `PreToolUse` |
| 1 | `PostToolUse` |
| 2 | `Notification` |
| 3 | `Stop` |
| 4 | `SubagentStop` |

### `HookRunResult`

```typescript
interface HookRunResult {
  allowed: boolean;
  message: string;
  warnings: string[];
}
```

### `HookCommandHandler` (abstract)

```typescript
interface HookCommandHandler {
  run(command: string, env: Map<string, string>): HookCommandResult;
}
```

### `HookCommandResult`

```typescript
interface HookCommandResult {
  exitCode: number;
  stdout: string;
  stderr: string;
}
```

### Exit Code Protocol

| Code | Meaning |
|---|---|
| 0 | Allow — tool execution proceeds |
| 2 | Deny — tool execution blocked, stderr shown as reason |
| Other | Warn — tool proceeds but stderr logged as warning |

---

## Conversation Module

### `ApiRequest`

```typescript
interface ApiRequest {
  model: string;
  messages: ConversationMessage[];
  systemPrompt: string;
  maxTokens: number;
  temperature: number;
}
```

### `AssistantEvent` (discriminated union)

```typescript
type AssistantEvent =
  | { kind: "text_delta"; text: string }
  | { kind: "tool_use"; toolUseId: string; toolName: string; toolInput: string }
  | { kind: "usage"; usage: TokenUsage }
  | { kind: "message_stop" };
```

### `ApiClient` (abstract)

```typescript
interface ApiClient {
  stream(request: ApiRequest): AssistantEvent[];
}
```

### `ToolExecutor` (abstract)

```typescript
interface ToolExecutor {
  execute(toolName: string, toolInput: string, toolUseId: string): ToolExecuteResult;
}
```

### `TurnSummary`

```typescript
interface TurnSummary {
  assistantText: string;
  toolCalls: number;
  inputTokens: number;
  outputTokens: number;
}
```

### `ConversationRuntime`

```typescript
interface ConversationRuntime {
  session: Session;
  usageTracker: UsageTracker;
  runTurn(userMessage: string): TurnSummary;
}
```

---

## Commands Module

### `SlashCommandSpec`

```typescript
interface SlashCommandSpec {
  name: string;
  description: string;
  argPlaceholder: string;
  supportsResume: boolean;
}
```

### `CommandSource` (enum)

| Value | Name |
|---|---|
| 0 | `User` |
| 1 | `Headless` |
| 2 | `Resume` |
| 3 | `Api` |

---

## Config Module

### `ConfigSource` (enum)

| Value | Name |
|---|---|
| 0 | `Default` |
| 1 | `Project` |
| 2 | `User` |
| 3 | `Env` |

### `McpTransport` (enum)

| Value | Name |
|---|---|
| 0 | `Stdio` |
| 1 | `Sse` |
| 2 | `Http` |
| 3 | `Ws` |
| 4 | `Sdk` |
| 5 | `ClaudeAiProxy` |

### MCP Server Configs

Six transport-specific config types, all sharing a `transport` discriminator:

- `McpStdioConfig` — command, args, env, cwd
- `McpSseConfig` — url, headers
- `McpHttpConfig` — url, headers
- `McpWsConfig` — url, headers
- `McpSdkConfig` — moduleUrl, initArgs
- `McpClaudeAiProxyConfig` — proxyId

### `RuntimeConfig`

```typescript
interface RuntimeConfig {
  model: string;
  maxTokens: number;
  systemPrompt: string;
  permissionMode: PermissionMode;
  compaction: CompactionConfig;
  hooks: RuntimeHookConfig;
  features: RuntimeFeatureConfig;
  mcpServers: McpConfigCollection;
  sandbox: SandboxConfig;
  oauth: OAuthConfig | null;
}
```

---

## Sandbox Module

### `FilesystemIsolationMode` (enum)

| Value | Name |
|---|---|
| 0 | `None` |
| 1 | `ReadOnlyRoot` |
| 2 | `WorkspaceOnly` |

### `SandboxConfig`

```typescript
interface SandboxConfig {
  enabled: boolean;
  isolationMode: FilesystemIsolationMode;
  allowedPaths: string[];
  deniedPaths: string[];
}
```

---

## Bootstrap Module

### `BootstrapPhase` (enum)

| Value | Name |
|---|---|
| 0 | `Init` |
| 1 | `LoadConfig` |
| 2 | `ValidateAuth` |
| 3 | `LoadMcpServers` |
| 4 | `InitSandbox` |
| 5 | `LoadSession` |
| 6 | `BuildSystemPrompt` |
| 7 | `InitTools` |
| 8 | `InitHooks` |
| 9 | `RunBootstrapHooks` |
| 10 | `InitConversation` |
| 11 | `MainRuntime` |
