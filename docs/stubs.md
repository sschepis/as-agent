# Implementing I/O Stubs

The Wasm core is pure computation. All I/O is performed by the host environment through abstract classes defined in `assembly/stubs.ts`. This guide explains each stub interface and how to implement them.

---

## FileSystem

Provides file operations for tools like Read, Write, Edit, Glob, and Grep.

```typescript
abstract class FileSystem {
  abstract readFile(path: string, offset: i32, limit: i32): ReadFileOutput;
  abstract writeFile(path: string, content: string): WriteFileOutput;
  abstract editFile(path: string, hunks: StructuredPatchHunk[]): EditFileOutput;
  abstract globSearch(pattern: string, path: string): GlobSearchOutput;
  abstract grepSearch(input: GrepSearchInput): GrepSearchOutput;
}
```

### Data Types

```typescript
class ReadFileOutput {
  content: string;
  totalLines: i32;
  truncated: bool;
}

class WriteFileOutput {
  success: bool;
  bytesWritten: i32;
}

class EditFileOutput {
  success: bool;
  content: string;  // resulting file content
}

class GlobSearchOutput {
  files: string[];   // matched file paths
}

class GrepSearchInput {
  pattern: string;
  path: string;
  glob: string;
  outputMode: string;  // "content", "files_with_matches", "count"
  contextLines: i32;
}

class GrepSearchOutput {
  lines: string[];     // matching lines or file paths
  matchCount: i32;
}

class StructuredPatchHunk {
  oldStart: i32;
  oldLines: i32;
  newStart: i32;
  newLines: i32;
  content: string;
}
```

### Example: Node.js Implementation

```typescript
import { readFileSync, writeFileSync } from "node:fs";
import { globSync } from "node:fs";

class NodeFileSystem extends FileSystem {
  readFile(path: string, offset: i32, limit: i32): ReadFileOutput {
    const content = readFileSync(path, "utf-8");
    const lines = content.split("\n");
    const sliced = lines.slice(offset, offset + limit).join("\n");
    return {
      content: sliced,
      totalLines: lines.length,
      truncated: offset + limit < lines.length,
    };
  }

  writeFile(path: string, content: string): WriteFileOutput {
    writeFileSync(path, content, "utf-8");
    return { success: true, bytesWritten: content.length };
  }

  // ... editFile, globSearch, grepSearch
}
```

---

## BashExecutor

Executes shell commands for the Bash tool.

```typescript
abstract class BashExecutor {
  abstract execute(input: BashCommandInput): BashCommandOutput;
}
```

### Data Types

```typescript
class BashCommandInput {
  command: string;
  timeout: i32;         // milliseconds
  workingDir: string;
}

class BashCommandOutput {
  stdout: string;
  stderr: string;
  exitCode: i32;
  timedOut: bool;
}
```

### Example

```typescript
import { execSync } from "node:child_process";

class NodeBashExecutor extends BashExecutor {
  execute(input: BashCommandInput): BashCommandOutput {
    try {
      const result = execSync(input.command, {
        cwd: input.workingDir,
        timeout: input.timeout,
        encoding: "utf-8",
      });
      return { stdout: result, stderr: "", exitCode: 0, timedOut: false };
    } catch (e) {
      return {
        stdout: e.stdout ?? "",
        stderr: e.stderr ?? "",
        exitCode: e.status ?? 1,
        timedOut: e.killed ?? false,
      };
    }
  }
}
```

---

## McpServerManager

Manages MCP (Model Context Protocol) server connections and tool/resource operations.

```typescript
abstract class McpServerManager {
  abstract listTools(serverName: string): McpTool[];
  abstract callTool(params: McpToolCallParams): McpToolCallResult;
  abstract listResources(serverName: string): McpResource[];
  abstract readResource(serverName: string, uri: string): McpResourceContents;
  abstract sendJsonRpc(serverName: string, request: JsonRpcRequest): JsonRpcResponse;
}
```

### Data Types

```typescript
class McpTool {
  name: string;
  description: string;
  inputSchema: string;  // JSON schema string
}

class McpToolCallParams {
  serverName: string;
  toolName: string;
  arguments: string;    // JSON string
}

class McpToolCallResult {
  content: string;
  isError: bool;
}

class McpResource {
  uri: string;
  name: string;
  mimeType: string;
}

class McpResourceContents {
  uri: string;
  content: string;
  mimeType: string;
}

class JsonRpcRequest {
  method: string;
  params: string;       // JSON string
  id: string;
}

class JsonRpcResponse {
  result: string;       // JSON string
  error: JsonRpcError | null;
}

class JsonRpcError {
  code: i32;
  message: string;
  data: string;
}
```

---

## OAuthHandler

Handles OAuth PKCE flows and credential persistence.

```typescript
abstract class OAuthHandler {
  abstract generatePkce(): PkceCodePair;
  abstract exchangeCode(code: string, verifier: string, redirectUri: string): OAuthTokenSet;
  abstract refreshToken(refreshToken: string): OAuthTokenSet;
  abstract loadCredentials(key: string): OAuthTokenSet | null;
  abstract saveCredentials(key: string, tokens: OAuthTokenSet): void;
  abstract deleteCredentials(key: string): void;
}
```

### Data Types

```typescript
class PkceCodePair {
  verifier: string;
  challenge: string;
}

class OAuthTokenSet {
  accessToken: string;
  refreshToken: string;
  expiresAt: i64;       // epoch ms
  tokenType: string;
  scope: string;
}
```

---

## HookCommandHandler

Used by `HookRunner` to execute hook shell commands. Already has a built-in `NoOpHookCommandHandler`.

```typescript
abstract class HookCommandHandler {
  abstract run(command: string, env: Map<string, string>): HookCommandResult;
}
```

### Data Types

```typescript
class HookCommandResult {
  exitCode: i32;
  stdout: string;
  stderr: string;
}
```

### Example

```typescript
import { execSync } from "node:child_process";

class ShellHookHandler extends HookCommandHandler {
  run(command: string, env: Map<string, string>): HookCommandResult {
    const envObj: Record<string, string> = { ...process.env };
    for (const [k, v] of env) envObj[k] = v;

    try {
      const stdout = execSync(command, { env: envObj, encoding: "utf-8" });
      return { exitCode: 0, stdout, stderr: "" };
    } catch (e) {
      return { exitCode: e.status ?? 1, stdout: e.stdout ?? "", stderr: e.stderr ?? "" };
    }
  }
}
```

---

## Wiring Stubs Together

When building a complete runtime host, wire all stubs into the `ConversationRuntime`:

```typescript
const fs = new NodeFileSystem();
const bash = new NodeBashExecutor();
const mcp = new MyMcpManager();
const hooks = new ShellHookHandler();

const hookRunner = new HookRunner(hooks, runtimeHookConfig);
const policy = new PermissionPolicy(PermissionMode.WorkspaceWrite, myPrompter);

const executor = new ToolExecutorImpl(fs, bash, mcp);
const client = new MyApiClient(apiKey);

const runtime = new ConversationRuntime(
  client,
  executor,
  policy,
  hookRunner,
  compactionConfig,
);
```
