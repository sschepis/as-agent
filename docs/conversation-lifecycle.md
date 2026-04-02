# Conversation Lifecycle

This document describes the full turn loop in `ConversationRuntime`, from user input to response.

## Turn Flow

```
User message
    │
    ▼
┌─────────────────────┐
│ 1. Add to session   │  ConversationMessage with role=User
└─────────┬───────────┘
          │
          ▼
┌─────────────────────┐
│ 2. Build ApiRequest  │  model, system prompt, full message history, max tokens
└─────────┬───────────┘
          │
          ▼
┌─────────────────────┐
│ 3. Stream response   │  ApiClient.stream() → AssistantEvent[]
└─────────┬───────────┘
          │
          ▼
    ┌─────┴─────┐
    │ For each  │
    │  event    │
    └─────┬─────┘
          │
    ┌─────┼──────────────────────┐
    │     │                      │
    ▼     ▼                      ▼
 text   tool_use              usage / stop
 delta  │
        ▼
┌─────────────────────┐
│ 4. Permission check  │  PermissionPolicy.authorize()
└─────────┬───────────┘
          │ denied → add error result, continue
          │ allowed ↓
┌─────────────────────┐
│ 5. Pre-tool hooks    │  HookRunner.runPreToolUse()
└─────────┬───────────┘
          │ denied → add error result, continue
          │ allowed ↓
┌─────────────────────┐
│ 6. Execute tool      │  ToolExecutor.execute()
└─────────┬───────────┘
          │
┌─────────────────────┐
│ 7. Post-tool hooks   │  HookRunner.runPostToolUse()
└─────────┬───────────┘
          │
┌─────────────────────┐
│ 8. Add tool result   │  ContentBlock(BLOCK_TOOL_RESULT)
└─────────┬───────────┘
          │
          ▼
┌─────────────────────┐
│ 9. Auto-compaction?  │  Check token threshold
└─────────┬───────────┘
          │ yes → compactSession(), emit AutoCompactionEvent
          │ no ↓
┌─────────────────────┐
│ 10. Return summary   │  TurnSummary with stats
└─────────────────────┘
```

## Step Details

### 1. Add User Message

The user's text is wrapped in a `ConversationMessage` with `role=User` and a single `ContentBlock` of kind `BLOCK_TEXT`. It's appended to `session.messages`.

### 2. Build API Request

An `ApiRequest` is constructed with:
- `model` — from runtime config
- `messages` — full `session.messages` array
- `systemPrompt` — from runtime config
- `maxTokens` — from runtime config
- `temperature` — from runtime config (default 1.0)

### 3. Stream Response

The `ApiClient.stream()` method is called with the request. It returns an array of `AssistantEvent` objects (the AS runtime processes them synchronously; actual streaming is handled by the host's `ApiClient` implementation).

Event types:
- **`EVENT_TEXT_DELTA`** — Partial text from the assistant
- **`EVENT_TOOL_USE`** — Tool call request (name, input JSON, ID)
- **`EVENT_USAGE`** — Token usage update
- **`EVENT_MESSAGE_STOP`** — End of response

### 4. Permission Check

For each tool use event, the runtime calls `PermissionPolicy.authorize()` with a `PermissionRequest`:

```typescript
const request = new PermissionRequest();
request.toolName = event.toolName;
request.description = `Execute ${event.toolName}`;
request.readOnly = isReadOnlyTool(event.toolName);
```

If denied, a `BLOCK_TOOL_RESULT` with `isError=true` is added containing the denial reason.

### 5. Pre-Tool Hooks

If permissions pass, `HookRunner.runPreToolUse()` executes any matching hook commands. The exit code protocol:

| Exit Code | Action |
|---|---|
| 0 | Allow — proceed with tool execution |
| 2 | Deny — block tool, use stderr as reason |
| Other | Warn — proceed but log stderr as warning |

### 6. Tool Execution

`ToolExecutor.execute(toolName, toolInput, toolUseId)` is called. Returns a `ToolExecuteResult` with the output content and success/error status.

### 7. Post-Tool Hooks

`HookRunner.runPostToolUse()` runs after execution. Post-tool hooks are informational — they cannot block the result.

### 8. Add Tool Result

The tool's output is wrapped in a `ContentBlock` of kind `BLOCK_TOOL_RESULT` and added to the session.

### 9. Auto-Compaction

After processing all events, the runtime checks if session tokens exceed the compaction threshold:

```typescript
if (shouldCompact(session, compactionConfig)) {
  const result = compactSession(session, compactionConfig);
  // Emit AutoCompactionEvent
}
```

Compaction preserves the most recent N turns (configurable) and replaces older messages with a summary.

### 10. Return Summary

A `TurnSummary` is returned with:
- `assistantText` — concatenated text deltas
- `toolCalls` — number of tool executions
- `inputTokens` / `outputTokens` — from usage events

## Multi-Turn Tool Use

When the assistant makes tool calls, the response typically ends after receiving tool results. The runtime does **not** automatically loop — the host is responsible for calling `runTurn()` again if the assistant's response indicates more work is needed.

A common host-side pattern:

```typescript
let summary = runtime.runTurn(userMessage);

while (summary.toolCalls > 0) {
  // The session already contains the tool results
  // Run another turn so the assistant can respond to them
  summary = runtime.runTurn("");  // empty message = continue
}
```

## Error Handling

- **Permission denied** → Tool result with `isError=true`, denial reason as content
- **Hook denied (exit 2)** → Same as permission denied
- **Tool execution error** → `ToolError` with error message, added as error result
- **API error** → `RuntimeError` propagated to caller
- **Compaction failure** → Logged as warning, session unchanged
