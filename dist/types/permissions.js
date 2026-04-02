export var PermissionMode;
(function (PermissionMode) {
    PermissionMode[PermissionMode["ReadOnly"] = 0] = "ReadOnly";
    PermissionMode[PermissionMode["WorkspaceWrite"] = 1] = "WorkspaceWrite";
    PermissionMode[PermissionMode["DangerFullAccess"] = 2] = "DangerFullAccess";
    PermissionMode[PermissionMode["Prompt"] = 3] = "Prompt";
    PermissionMode[PermissionMode["Allow"] = 4] = "Allow";
})(PermissionMode || (PermissionMode = {}));
//# sourceMappingURL=permissions.js.map