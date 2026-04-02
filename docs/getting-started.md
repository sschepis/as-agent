# Getting Started

## Installation

```bash
npm install @sschepis/as-agent
```

Requires Node.js 18+.

## Basic Usage (JavaScript/TypeScript)

```typescript
import { createRuntime } from "@sschepis/as-agent";

const rt = await createRuntime();

// Format costs
console.log(rt.formatUsd(0.0042)); // "$0.0042"

// Model pricing
const pricing = rt.pricingForModel("sonnet");
console.log(pricing);

// Message roles
console.log(rt.messageRoleToString(rt.MessageRole.Assistant)); // "assistant"
console.log(rt.messageRoleFromString("user")); // 1

// Permission modes
console.log(rt.permissionModeAsStr(rt.PermissionMode.WorkspaceWrite)); // "workspace-write"

// Slash commands
const help = rt.renderSlashCommandHelp();
console.log(help);

const specs = rt.slashCommandSpecs();
console.log(`${specs.length} commands available`); // "22 commands available"

// Compaction
const summary = rt.formatCompactSummary(
  "<analysis>internal notes</analysis>\n<summary>User asked about auth flow</summary>"
);
console.log(summary); // "Summary:\nUser asked about auth flow"
```

## Using Raw Wasm Bindings

For direct access to Wasm exports without the wrapper:

```typescript
import { formatUsd, renderSlashCommandHelp } from "@sschepis/as-agent/wasm";

console.log(formatUsd(1.5));
console.log(renderSlashCommandHelp());
```

## Using from AssemblyScript

For AS-to-AS projects, import source files directly:

```typescript
import { Session, ConversationMessage } from "@sschepis/as-agent/assembly";
import { TokenUsage, pricingForModel } from "@sschepis/as-agent/assembly";
```

## Type-Only Imports

Use type imports for your own code without pulling in runtime dependencies:

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
} from "@sschepis/as-agent";
```

## Building from Source

```bash
cd assembly
npm install
npm run build          # Wasm + TypeScript
npm test               # Smoke tests
```

Individual build steps:

```bash
npm run asbuild:release   # Wasm only
npm run asbuild:debug     # Wasm debug build (larger, with debug info)
npm run build:ts          # TypeScript wrapper only
```

## Project Structure

```
assembly/
├── assembly/           # AssemblyScript source (compiles to Wasm)
│   ├── index.ts        # Re-exports all public API
│   ├── json.ts         # JSON parser (zero deps)
│   ├── session.ts      # Messages, sessions
│   ├── usage.ts        # Token tracking, pricing
│   ├── permissions.ts  # Authorization system
│   ├── compact.ts      # Session compaction
│   ├── conversation.ts # Turn loop engine
│   ├── commands.ts     # 22 slash commands
│   ├── config.ts       # Configuration system
│   ├── hooks.ts        # Pre/post tool hooks
│   ├── sandbox.ts      # Filesystem isolation
│   ├── bootstrap.ts    # Startup phases
│   └── stubs.ts        # I/O interfaces
├── src/                # TypeScript wrapper
│   ├── index.ts        # Package entry point
│   ├── runtime.ts      # createRuntime() factory
│   └── types/          # TS interface definitions
├── build/              # Compiled Wasm output
├── dist/               # Compiled TS output
├── docs/               # This documentation
└── package.json
```

## Next Steps

- [Architecture](architecture.md) — How the layers fit together
- [API Reference](api-reference.md) — Full runtime API
- [Type Reference](types.md) — All TypeScript interfaces
- [Module Guide](modules.md) — AS module details
- [Implementing Stubs](stubs.md) — Build your own I/O layer
- [Conversation Lifecycle](conversation-lifecycle.md) — Turn loop internals
