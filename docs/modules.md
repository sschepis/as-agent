# Module Guide

This document describes each module in the AssemblyScript source, its purpose, and key exports.

---

## `json` — JSON Parser

**File:** `assembly/json.ts`

Zero-dependency JSON parser and renderer. All other modules use this for serialization.

**Key exports:**
- `JsonValue` — Tagged class with variants: `Null`, `Bool`, `Number`, `String`, `Array`, `Object`
- `Parser` — Streaming JSON parser with `parse(input: string): JsonValue`
- `renderString(s: string): string` — JSON-escapes a string with proper unicode handling

**Design notes:**
- Hand-rolled recursive descent parser (no external dependencies)
- Handles unicode escapes (`\uXXXX`), all standard escape sequences
- `JsonValue.getStr()`, `.getNum()`, `.getBool()`, `.getArr()`, `.getObj()` for type-safe access
- `JsonValue.toJson()` for serialization back to JSON strings

---

## `session` — Session Management

**File:** `assembly/session.ts`

Core data model for conversations.

**Key exports:**
- `MessageRole` — const enum: System, User, Assistant, Tool
- `ContentBlock` — Tagged class with `kind` discriminator (BLOCK_TEXT, BLOCK_TOOL_USE, BLOCK_TOOL_RESULT)
- `ConversationMessage` — Role + blocks + timestamp
- `Session` — ID + messages + timestamps, with `toJson()`, `fromJson()`, `serialize()`, `deserialize()`, `clone()`, `equals()`

---

## `usage` — Token Tracking & Pricing

**File:** `assembly/usage.ts`

Token counting, cost estimation, and model pricing.

**Key exports:**
- `TokenUsage` — Input/output/cache token counts with `add()` and `clone()`
- `UsageTracker` — Accumulates per-turn usage, computes totals
- `ModelPricing` — Per-million-token prices for input, output, cache write, cache read
- `UsageCostEstimate` — Computed cost breakdown
- `pricingForModel(name: string): ModelPricing | null` — Built-in pricing for haiku, sonnet, opus
- `formatUsd(amount: f64): string` — Format to 4 decimal places with `$` prefix

---

## `permissions` — Authorization System

**File:** `assembly/permissions.ts`

Permission modes and authorization logic.

**Key exports:**
- `PermissionMode` — 5 modes from ReadOnly to AutoApprove
- `PermissionRequest` — Tool name, description, read-only flag, workspace path
- `PermissionPrompter` — Abstract class for interactive prompting
- `PermissionPolicy` — Combines mode + optional prompter, provides `authorize(request): PermissionOutcome`

**Authorization logic:**
1. `AutoApprove` / `DangerFullAccess` → always allowed
2. `ReadOnly` → only if request is read-only
3. `WorkspaceWrite` → allowed if read-only or within workspace path
4. `ScopedApproval` → delegates to `PermissionPrompter`

---

## `compact` — Session Compaction

**File:** `assembly/compact.ts`

Reduces session size by summarizing older messages while preserving recent context.

**Key exports:**
- `CompactionConfig` — Thresholds: max tokens, preserved turns, summary max tokens
- `compactSession(session, config): CompactionResult` — Main entry point
- `estimateSessionTokens(session): i32` — Rough token count (chars / 4)
- `shouldCompact(session, config): bool` — Check if compaction is needed
- `formatCompactSummary(summary): string` — Strip analysis tags, format summary
- `getCompactContinuationMessage(summary, suppress, preserved): string` — Build the continuation message

**Internal helpers:**
- `summarizeMessages()` — Generate summary text from message blocks
- `collectRecentRoleSummaries()` — Summarize recent user/assistant activity
- `inferPendingWork()` — Detect incomplete tasks from tool use patterns
- `collectKeyFiles()` — Extract file references from messages
- `extractFileCandidates()` — Regex-like path extraction from text

---

## `conversation` — Turn Loop Engine

**File:** `assembly/conversation.ts`

The core conversation runtime with tool execution, permission checks, and hooks.

**Key exports:**
- `ApiClient` — Abstract: `stream(request): AssistantEvent[]`
- `ToolExecutor` — Abstract: `execute(name, input, id): ToolExecuteResult`
- `AssistantEvent` — Tagged class: text delta, tool use, usage, message stop
- `ConversationRuntime` — Full turn loop orchestrator
- `StaticToolExecutor` — Map-based tool executor for testing
- `TurnSummary` — Per-turn statistics

**Turn loop flow:**
1. Add user message to session
2. Build `ApiRequest` with system prompt and full message history
3. Stream response from `ApiClient`
4. For each tool use event:
   a. Check permissions via `PermissionPolicy.authorize()`
   b. Run pre-tool hooks via `HookRunner`
   c. Execute tool via `ToolExecutor`
   d. Run post-tool hooks
   e. Add tool result to session
5. Check auto-compaction threshold
6. Return `TurnSummary`

---

## `commands` — Slash Commands

**File:** `assembly/commands.ts`

22 slash commands with parsing, help rendering, and execution for stateless commands.

**Key exports:**
- `SlashCommandSpec` — Name, description, arg placeholder, resume support flag
- `SlashCommand` — Tagged class with `parse(input): SlashCommand`
- `renderSlashCommandHelp(): string` — Full help text
- `handleSlashCommand(cmd, session, config): string | null` — Handles /compact and /help directly; returns null for commands requiring runtime context

**All 22 commands:**
`/help`, `/compact`, `/model`, `/commit`, `/review`, `/pr`, `/plan`, `/ultraplan`, `/session`, `/clear`, `/config`, `/status`, `/cost`, `/login`, `/logout`, `/mcp`, `/doctor`, `/bug`, `/init`, `/memory`, `/terminal-setup`, `/vim`

---

## `config` — Configuration System

**File:** `assembly/config.ts`

Runtime configuration with multi-source loading and MCP server configs.

**Key exports:**
- `RuntimeConfig` — Top-level configuration object
- `ConfigEntry<T>` — Value + source tracking
- `ConfigLoader` — `loadFromValues(json: JsonValue): RuntimeConfig` and `discover(): RuntimeConfig`
- `McpServerConfig` — Tagged class with 6 transport variants
- `McpConfigCollection` — Named server collection
- `OAuthConfig`, `RuntimeHookConfig`, `RuntimeFeatureConfig`

**Config sources (by priority):** Default < Project < User < Env

---

## `hooks` — Hook System

**File:** `assembly/hooks.ts`

Pre/post tool execution hooks with shell command integration.

**Key exports:**
- `HookEvent` — const enum: PreToolUse, PostToolUse, Notification, Stop, SubagentStop
- `HookRunner` — Runs hooks matching tool patterns, interprets exit codes
- `HookCommandHandler` — Abstract class for shell execution
- `NoOpHookCommandHandler` — Default no-op implementation

---

## `sandbox` — Filesystem Isolation

**File:** `assembly/sandbox.ts`

Sandboxing configuration for filesystem access control.

**Key exports:**
- `FilesystemIsolationMode` — None, ReadOnlyRoot, WorkspaceOnly
- `SandboxConfig` — Enabled flag, isolation mode, allowed/denied path lists
- `SandboxRequest`, `SandboxStatus`

---

## `bootstrap` — Startup Phases

**File:** `assembly/bootstrap.ts`

Defines the 12-phase bootstrap sequence.

**Key exports:**
- `BootstrapPhase` — const enum: Init → MainRuntime
- `BootstrapPlan` — Ordered phase list with deduplication

---

## `stubs` — I/O Interfaces

**File:** `assembly/stubs.ts`

Abstract classes defining all I/O boundaries. See [stubs.md](stubs.md) for implementation guide.

**Key exports:**
- `FileSystem` — readFile, writeFile, editFile, globSearch, grepSearch
- `BashExecutor` — Shell command execution
- `McpServerManager` — MCP tool/resource operations
- `OAuthHandler` — PKCE + credential persistence
- Data types for all I/O operations
