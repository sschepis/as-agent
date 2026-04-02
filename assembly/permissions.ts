// Permission system — ported from rust/crates/runtime/src/permissions.rs

export const enum PermissionMode {
  ReadOnly = 0,
  WorkspaceWrite = 1,
  DangerFullAccess = 2,
  Prompt = 3,
  Allow = 4,
}

export function permissionModeAsStr(mode: PermissionMode): string {
  switch (mode) {
    case PermissionMode.ReadOnly:
      return "read-only";
    case PermissionMode.WorkspaceWrite:
      return "workspace-write";
    case PermissionMode.DangerFullAccess:
      return "danger-full-access";
    case PermissionMode.Prompt:
      return "prompt";
    case PermissionMode.Allow:
      return "allow";
    default:
      return "unknown";
  }
}

export class PermissionRequest {
  constructor(
    public toolName: string,
    public input: string,
    public currentMode: PermissionMode,
    public requiredMode: PermissionMode
  ) {}
}

export const enum PermissionPromptDecisionKind {
  Allow = 0,
  Deny = 1,
}

export class PermissionPromptDecision {
  kind: PermissionPromptDecisionKind;
  reason: string;

  private constructor(kind: PermissionPromptDecisionKind, reason: string) {
    this.kind = kind;
    this.reason = reason;
  }

  static Allow(): PermissionPromptDecision {
    return new PermissionPromptDecision(PermissionPromptDecisionKind.Allow, "");
  }

  static Deny(reason: string): PermissionPromptDecision {
    return new PermissionPromptDecision(PermissionPromptDecisionKind.Deny, reason);
  }

  isAllow(): bool {
    return this.kind == PermissionPromptDecisionKind.Allow;
  }
}

// PermissionPrompter interface — implemented by host to prompt user
export abstract class PermissionPrompter {
  abstract decide(request: PermissionRequest): PermissionPromptDecision;
}

export const enum PermissionOutcomeKind {
  Allow = 0,
  Deny = 1,
}

export class PermissionOutcome {
  kind: PermissionOutcomeKind;
  reason: string;

  private constructor(kind: PermissionOutcomeKind, reason: string) {
    this.kind = kind;
    this.reason = reason;
  }

  static Allow(): PermissionOutcome {
    return new PermissionOutcome(PermissionOutcomeKind.Allow, "");
  }

  static Deny(reason: string): PermissionOutcome {
    return new PermissionOutcome(PermissionOutcomeKind.Deny, reason);
  }

  isAllow(): bool {
    return this.kind == PermissionOutcomeKind.Allow;
  }

  isDeny(): bool {
    return this.kind == PermissionOutcomeKind.Deny;
  }
}

export class PermissionPolicy {
  private activeMode: PermissionMode;
  private toolRequirements: Map<string, PermissionMode>;

  constructor(activeMode: PermissionMode) {
    this.activeMode = activeMode;
    this.toolRequirements = new Map<string, PermissionMode>();
  }

  withToolRequirement(toolName: string, requiredMode: PermissionMode): PermissionPolicy {
    this.toolRequirements.set(toolName, requiredMode);
    return this;
  }

  getActiveMode(): PermissionMode {
    return this.activeMode;
  }

  requiredModeFor(toolName: string): PermissionMode {
    if (this.toolRequirements.has(toolName)) {
      return this.toolRequirements.get(toolName);
    }
    return PermissionMode.DangerFullAccess;
  }

  authorize(
    toolName: string,
    input: string,
    prompter: PermissionPrompter | null
  ): PermissionOutcome {
    const currentMode = this.activeMode;
    const requiredMode = this.requiredModeFor(toolName);

    if (currentMode == PermissionMode.Allow || currentMode >= requiredMode) {
      return PermissionOutcome.Allow();
    }

    const request = new PermissionRequest(toolName, input, currentMode, requiredMode);

    if (
      currentMode == PermissionMode.Prompt ||
      (currentMode == PermissionMode.WorkspaceWrite &&
        requiredMode == PermissionMode.DangerFullAccess)
    ) {
      if (prompter != null) {
        const decision = prompter!.decide(request);
        if (decision.isAllow()) {
          return PermissionOutcome.Allow();
        }
        return PermissionOutcome.Deny(decision.reason);
      }
      return PermissionOutcome.Deny(
        "tool '" +
          toolName +
          "' requires approval to escalate from " +
          permissionModeAsStr(currentMode) +
          " to " +
          permissionModeAsStr(requiredMode)
      );
    }

    return PermissionOutcome.Deny(
      "tool '" +
        toolName +
        "' requires " +
        permissionModeAsStr(requiredMode) +
        " permission; current mode is " +
        permissionModeAsStr(currentMode)
    );
  }
}
