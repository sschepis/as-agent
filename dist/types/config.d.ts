import type { SandboxConfig } from "./sandbox.js";
export declare enum ConfigSource {
    User = 0,
    Project = 1,
    Local = 2
}
export declare enum ResolvedPermissionMode {
    ReadOnly = 0,
    WorkspaceWrite = 1,
    DangerFullAccess = 2
}
export declare enum McpTransport {
    Stdio = 0,
    Sse = 1,
    Http = 2,
    Ws = 3,
    Sdk = 4,
    ClaudeAiProxy = 5
}
export interface ConfigEntry {
    source: ConfigSource;
    path: string;
}
export interface McpStdioServerConfig {
    kind: "stdio";
    command: string;
    args: string[];
    env: Record<string, string>;
}
export interface McpRemoteServerConfig {
    kind: "sse" | "http";
    url: string;
    headers: Record<string, string>;
    headersHelper?: string;
    oauth?: McpOAuthConfig;
}
export interface McpWebSocketServerConfig {
    kind: "ws";
    url: string;
    headers: Record<string, string>;
    headersHelper?: string;
}
export interface McpSdkServerConfig {
    kind: "sdk";
    name: string;
}
export interface McpClaudeAiProxyServerConfig {
    kind: "claudeai-proxy";
    url: string;
    id: string;
}
export type McpServerConfig = McpStdioServerConfig | McpRemoteServerConfig | McpWebSocketServerConfig | McpSdkServerConfig | McpClaudeAiProxyServerConfig;
export interface McpOAuthConfig {
    clientId?: string;
    callbackPort?: number;
    authServerMetadataUrl?: string;
    xaa?: boolean;
}
export interface ScopedMcpServerConfig {
    scope: ConfigSource;
    config: McpServerConfig;
}
export interface McpConfigCollection {
    servers: Record<string, ScopedMcpServerConfig>;
}
export interface OAuthConfig {
    clientId: string;
    authorizeUrl: string;
    tokenUrl: string;
    callbackPort?: number;
    manualRedirectUrl?: string;
    scopes: string[];
}
export interface RuntimeHookConfig {
    preToolUse: string[];
    postToolUse: string[];
}
export interface RuntimeFeatureConfig {
    hooks: RuntimeHookConfig;
    mcp: McpConfigCollection;
    oauth?: OAuthConfig;
    model?: string;
    permissionMode?: ResolvedPermissionMode;
    sandbox: SandboxConfig;
}
export interface RuntimeConfig {
    merged: Record<string, unknown>;
    loadedEntries: ConfigEntry[];
    featureConfig: RuntimeFeatureConfig;
}
//# sourceMappingURL=config.d.ts.map