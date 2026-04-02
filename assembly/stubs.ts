// I/O stubs — these represent operations that require host/OS integration.
// In a WASI or host-binding environment, implement these abstract classes.

// --- File operations (from rust/crates/runtime/src/file_ops.rs) ---

export class ReadFileOutput {
  constructor(
    public content: string,
    public lineCount: i32,
    public truncated: bool
  ) {}
}

export class WriteFileOutput {
  constructor(public bytesWritten: i32) {}
}

export class EditFileOutput {
  constructor(
    public patchedContent: string,
    public hunksApplied: i32
  ) {}
}

export class GlobSearchOutput {
  constructor(public matches: Array<string>) {}
}

export class GrepSearchOutput {
  constructor(
    public matchingFiles: Array<string>,
    public matchCount: i32
  ) {}
}

export class GrepSearchInput {
  constructor(
    public pattern: string,
    public path: string,
    public glob: string,
    public caseSensitive: bool
  ) {}
}

export class StructuredPatchHunk {
  constructor(
    public oldString: string,
    public newString: string
  ) {}
}

export class TextFilePayload {
  constructor(
    public filePath: string,
    public content: string
  ) {}
}

/**
 * Abstract file system interface.
 * Implement this for WASI or host bindings.
 */
export abstract class FileSystem {
  abstract readFile(path: string, offset: i32, limit: i32): ReadFileOutput;
  abstract writeFile(path: string, content: string): WriteFileOutput;
  abstract editFile(path: string, hunks: Array<StructuredPatchHunk>): EditFileOutput;
  abstract globSearch(pattern: string, path: string): GlobSearchOutput;
  abstract grepSearch(input: GrepSearchInput): GrepSearchOutput;
}

// --- Bash execution (from rust/crates/runtime/src/bash.rs) ---

export class BashCommandInput {
  constructor(
    public command: string,
    public timeoutMs: u32,
    public workingDirectory: string
  ) {}
}

export class BashCommandOutput {
  constructor(
    public stdout: string,
    public stderr: string,
    public exitCode: i32,
    public timedOut: bool
  ) {}
}

/**
 * Abstract bash executor.
 * Implement this for WASI or host bindings.
 */
export abstract class BashExecutor {
  abstract execute(input: BashCommandInput): BashCommandOutput;
}

// --- MCP types (from rust/crates/runtime/src/mcp_stdio.rs) ---

export class McpTool {
  constructor(
    public name: string,
    public description: string,
    public inputSchema: string  // JSON string
  ) {}
}

export class McpToolCallParams {
  constructor(
    public serverName: string,
    public toolName: string,
    public arguments_: string  // JSON string
  ) {}
}

export class McpToolCallResult {
  constructor(
    public content: string,
    public isError: bool
  ) {}
}

export class McpResource {
  constructor(
    public uri: string,
    public name: string,
    public mimeType: string
  ) {}
}

export class McpResourceContents {
  constructor(
    public uri: string,
    public mimeType: string,
    public text: string
  ) {}
}

export class JsonRpcRequest {
  constructor(
    public id: i64,
    public method: string,
    public params: string  // JSON string
  ) {}
}

export class JsonRpcResponse {
  constructor(
    public id: i64,
    public result: string,  // JSON string, empty if error
    public error: JsonRpcError | null
  ) {}
}

export class JsonRpcError {
  constructor(
    public code: i32,
    public message: string,
    public data: string
  ) {}
}

/**
 * Abstract MCP server manager.
 * Implement for process-based MCP servers.
 */
export abstract class McpServerManager {
  abstract listTools(serverName: string): Array<McpTool>;
  abstract callTool(params: McpToolCallParams): McpToolCallResult;
  abstract listResources(serverName: string): Array<McpResource>;
  abstract readResource(serverName: string, uri: string): McpResourceContents;
}

// --- OAuth stubs (from rust/crates/runtime/src/oauth.rs) ---

export class OAuthTokenSet {
  constructor(
    public accessToken: string,
    public refreshToken: string,
    public expiresAtEpochSecs: i64
  ) {}
}

export class PkceCodePair {
  constructor(
    public codeVerifier: string,
    public codeChallenge: string
  ) {}
}

/**
 * Abstract OAuth handler.
 * Implement for host-level HTTP + crypto.
 */
export abstract class OAuthHandler {
  abstract generatePkcePair(): PkceCodePair;
  abstract saveCredentials(path: string, tokenSet: OAuthTokenSet): void;
  abstract loadCredentials(path: string): OAuthTokenSet | null;
}

// --- System prompt (from rust/crates/runtime/src/prompt.rs) ---

export class ContextFile {
  constructor(
    public path: string,
    public content: string
  ) {}
}

export class ProjectContext {
  constructor(
    public cwd: string,
    public currentDate: string,
    public gitStatus: string,
    public gitDiff: string,
    public instructionFiles: Array<ContextFile>
  ) {}
}

/**
 * System prompt builder stub.
 * The actual prompt text construction logic can be ported here if needed.
 */
export class SystemPromptBuilder {
  private projectContext: ProjectContext | null;
  private osName: string;
  private osVersion: string;

  constructor() {
    this.projectContext = null;
    this.osName = "";
    this.osVersion = "";
  }

  withProjectContext(ctx: ProjectContext): SystemPromptBuilder {
    this.projectContext = ctx;
    return this;
  }

  withOs(name: string, version: string): SystemPromptBuilder {
    this.osName = name;
    this.osVersion = version;
    return this;
  }

  build(): Array<string> {
    // Stub: return a minimal system prompt
    const parts = new Array<string>();
    parts.push("You are Claw Code, a CLI assistant.");
    if (this.projectContext != null) {
      const ctx = this.projectContext!;
      parts.push("Working directory: " + ctx.cwd);
      parts.push("Date: " + ctx.currentDate);
    }
    if (this.osName.length > 0) {
      parts.push("OS: " + this.osName + " " + this.osVersion);
    }
    return parts;
  }
}
