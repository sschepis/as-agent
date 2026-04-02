export interface ReadFileOutput {
    content: string;
    lineCount: number;
    truncated: boolean;
}
export interface WriteFileOutput {
    bytesWritten: number;
}
export interface EditFileOutput {
    patchedContent: string;
    hunksApplied: number;
}
export interface GlobSearchOutput {
    matches: string[];
}
export interface GrepSearchOutput {
    matchingFiles: string[];
    matchCount: number;
}
export interface GrepSearchInput {
    pattern: string;
    path: string;
    glob: string;
    caseSensitive: boolean;
}
export interface StructuredPatchHunk {
    oldString: string;
    newString: string;
}
export interface BashCommandInput {
    command: string;
    timeoutMs: number;
    workingDirectory: string;
}
export interface BashCommandOutput {
    stdout: string;
    stderr: string;
    exitCode: number;
    timedOut: boolean;
}
export interface McpTool {
    name: string;
    description: string;
    inputSchema: string;
}
export interface McpToolCallParams {
    serverName: string;
    toolName: string;
    arguments: string;
}
export interface McpToolCallResult {
    content: string;
    isError: boolean;
}
export interface McpResource {
    uri: string;
    name: string;
    mimeType: string;
}
export interface McpResourceContents {
    uri: string;
    mimeType: string;
    text: string;
}
export interface JsonRpcRequest {
    id: number;
    method: string;
    params: string;
}
export interface JsonRpcResponse {
    id: number;
    result: string;
    error?: JsonRpcError;
}
export interface JsonRpcError {
    code: number;
    message: string;
    data: string;
}
export interface OAuthTokenSet {
    accessToken: string;
    refreshToken: string;
    expiresAtEpochSecs: number;
}
export interface ContextFile {
    path: string;
    content: string;
}
export interface ProjectContext {
    cwd: string;
    currentDate: string;
    gitStatus: string;
    gitDiff: string;
    instructionFiles: ContextFile[];
}
//# sourceMappingURL=stubs.d.ts.map