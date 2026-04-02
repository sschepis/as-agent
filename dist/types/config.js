export var ConfigSource;
(function (ConfigSource) {
    ConfigSource[ConfigSource["User"] = 0] = "User";
    ConfigSource[ConfigSource["Project"] = 1] = "Project";
    ConfigSource[ConfigSource["Local"] = 2] = "Local";
})(ConfigSource || (ConfigSource = {}));
export var ResolvedPermissionMode;
(function (ResolvedPermissionMode) {
    ResolvedPermissionMode[ResolvedPermissionMode["ReadOnly"] = 0] = "ReadOnly";
    ResolvedPermissionMode[ResolvedPermissionMode["WorkspaceWrite"] = 1] = "WorkspaceWrite";
    ResolvedPermissionMode[ResolvedPermissionMode["DangerFullAccess"] = 2] = "DangerFullAccess";
})(ResolvedPermissionMode || (ResolvedPermissionMode = {}));
export var McpTransport;
(function (McpTransport) {
    McpTransport[McpTransport["Stdio"] = 0] = "Stdio";
    McpTransport[McpTransport["Sse"] = 1] = "Sse";
    McpTransport[McpTransport["Http"] = 2] = "Http";
    McpTransport[McpTransport["Ws"] = 3] = "Ws";
    McpTransport[McpTransport["Sdk"] = 4] = "Sdk";
    McpTransport[McpTransport["ClaudeAiProxy"] = 5] = "ClaudeAiProxy";
})(McpTransport || (McpTransport = {}));
//# sourceMappingURL=config.js.map