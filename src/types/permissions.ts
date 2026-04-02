export enum PermissionMode {
  ReadOnly = 0,
  WorkspaceWrite = 1,
  DangerFullAccess = 2,
  Prompt = 3,
  Allow = 4,
}

export interface PermissionRequest {
  toolName: string;
  input: string;
  currentMode: PermissionMode;
  requiredMode: PermissionMode;
}

export interface PermissionPromptDecision {
  kind: "allow" | "deny";
  reason?: string;
}

export interface PermissionOutcome {
  kind: "allow" | "deny";
  reason?: string;
}

export interface PermissionPrompter {
  decide(request: PermissionRequest): PermissionPromptDecision;
}

export interface PermissionPolicy {
  activeMode: PermissionMode;
  requiredModeFor(toolName: string): PermissionMode;
  authorize(
    toolName: string,
    input: string,
    prompter?: PermissionPrompter | null,
  ): PermissionOutcome;
}
