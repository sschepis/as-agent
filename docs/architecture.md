# Architecture

## Overview

`@sschepis/as-agent` is a conversation engine compiled from AssemblyScript to WebAssembly. The architecture separates **pure computation** (Wasm) from **I/O** (host-provided implementations), making it portable across Node.js, browsers, and edge runtimes.

```
┌─────────────────────────────────────┐
│         Your Application            │
│  (imports @sschepis/as-agent)       │
├─────────────────────────────────────┤
│       TypeScript Wrapper            │
│  AgentRuntime / createRuntime()     │
│  Type-safe interfaces & enums       │
├─────────────────────────────────────┤
│        WebAssembly Core             │
│  JSON parser, session management,   │
│  conversation loop, permissions,    │
│  compaction, slash commands, hooks   │
├─────────────────────────────────────┤
│        I/O Stubs (abstract)         │
│  FileSystem, BashExecutor,          │
│  McpServerManager, OAuthHandler     │
└─────────────────────────────────────┘
```

## Three Entry Points

The package exposes three import paths for different consumers:

| Import path | Target | Use case |
|---|---|---|
| `@sschepis/as-agent` | JS/TS | High-level `AgentRuntime` API with auto-loaded Wasm |
| `@sschepis/as-agent/wasm` | JS/TS | Raw Wasm bindings for advanced/custom usage |
| `@sschepis/as-agent/assembly` | AS | Direct AS source imports for AS-to-AS projects |

## Module Dependency Graph

```
json (zero deps)
 └── session
      ├── usage
      ├── permissions
      │    └── hooks
      ├── compact
      └── conversation (depends on all above)
           └── commands

config (depends on json)
sandbox (standalone)
bootstrap (standalone)
stubs (standalone — abstract interfaces)
```

## Key Design Decisions

### Tagged Classes Instead of Union Types

AssemblyScript lacks union types and Rust-style enums with data. The codebase uses a **tagged class** pattern:

```typescript
class ContentBlock {
  kind: u8;  // BLOCK_TEXT, BLOCK_TOOL_USE, BLOCK_TOOL_RESULT
  text: string;
  toolName: string;
  toolInput: string;
  toolUseId: string;
  // ...
}
```

Static factory methods create instances with the correct `kind` tag, and consumers switch on `kind` to determine the variant.

### Const Enums for Simple Variants

Simple enumerations (no associated data) use `const enum`:

```typescript
const enum MessageRole { System = 0, User = 1, Assistant = 2, Tool = 3 }
const enum PermissionMode { ReadOnly = 0, WorkspaceWrite = 1, ... }
```

These compile to inline integer constants in Wasm.

### Abstract Classes for I/O Boundaries

All I/O is defined as abstract classes in the AS source. The Wasm module contains the logic but cannot perform I/O directly — the host environment must provide implementations:

- `FileSystem` — file read/write/edit, glob, grep
- `BashExecutor` — shell command execution
- `McpServerManager` — MCP tool/resource operations
- `OAuthHandler` — PKCE flow + credential persistence
- `HookCommandHandler` — hook shell execution

### Pure Computation in Wasm

Functions exported from Wasm are pure: they take data in and return data out. Examples:

- `formatUsd(amount)` → formatted string
- `pricingForModel(model)` → pricing object or null
- `renderSlashCommandHelp()` → help text
- `formatCompactSummary(summary)` → cleaned summary

The `ConversationRuntime` class orchestrates the turn loop but delegates all I/O through the abstract stub interfaces.

## Build Pipeline

```
assembly/*.ts  →  asc (AssemblyScript compiler)  →  build/release.wasm
                                                     build/release.js
                                                     build/release.d.ts

src/*.ts       →  tsc (TypeScript compiler)       →  dist/*.js
                                                     dist/*.d.ts
```

The `npm run build` script runs both steps in sequence.
