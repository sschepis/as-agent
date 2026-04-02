// Sandbox configuration types — ported from rust/crates/runtime/src/sandbox.rs

export const enum FilesystemIsolationMode {
  Off = 0,
  WorkspaceOnly = 1,
  AllowList = 2,
}

export function filesystemIsolationModeAsStr(mode: FilesystemIsolationMode): string {
  switch (mode) {
    case FilesystemIsolationMode.Off:
      return "off";
    case FilesystemIsolationMode.WorkspaceOnly:
      return "workspace-only";
    case FilesystemIsolationMode.AllowList:
      return "allow-list";
    default:
      return "off";
  }
}

export function filesystemIsolationModeFromStr(s: string): FilesystemIsolationMode {
  if (s == "off") return FilesystemIsolationMode.Off;
  if (s == "workspace-only") return FilesystemIsolationMode.WorkspaceOnly;
  if (s == "allow-list") return FilesystemIsolationMode.AllowList;
  throw new Error("unsupported filesystem mode: " + s);
}

export class SandboxConfig {
  enabled: bool | null;
  namespaceRestrictions: bool | null;
  networkIsolation: bool | null;
  filesystemMode: FilesystemIsolationMode | null;
  allowedMounts: Array<string>;

  constructor() {
    this.enabled = null;
    this.namespaceRestrictions = null;
    this.networkIsolation = null;
    this.filesystemMode = null;
    this.allowedMounts = new Array<string>();
  }

  static default(): SandboxConfig {
    return new SandboxConfig();
  }

  resolveRequest(
    enabledOverride: bool | null,
    namespaceOverride: bool | null,
    networkOverride: bool | null,
    filesystemModeOverride: FilesystemIsolationMode | null,
    allowedMountsOverride: Array<string> | null
  ): SandboxRequest {
    const enabled =
      enabledOverride != null ? enabledOverride! : this.enabled != null ? this.enabled! : true;
    const namespace =
      namespaceOverride != null
        ? namespaceOverride!
        : this.namespaceRestrictions != null
          ? this.namespaceRestrictions!
          : true;
    const network =
      networkOverride != null
        ? networkOverride!
        : this.networkIsolation != null
          ? this.networkIsolation!
          : false;
    const fsMode =
      filesystemModeOverride != null
        ? filesystemModeOverride!
        : this.filesystemMode != null
          ? this.filesystemMode!
          : FilesystemIsolationMode.WorkspaceOnly;
    const mounts =
      allowedMountsOverride != null ? allowedMountsOverride! : this.allowedMounts.slice(0);

    return new SandboxRequest(enabled, namespace, network, fsMode, mounts);
  }

  equals(other: SandboxConfig): bool {
    return (
      this.enabled == other.enabled &&
      this.namespaceRestrictions == other.namespaceRestrictions &&
      this.networkIsolation == other.networkIsolation &&
      this.filesystemMode == other.filesystemMode &&
      arraysEqual(this.allowedMounts, other.allowedMounts)
    );
  }
}

export class SandboxRequest {
  constructor(
    public enabled: bool,
    public namespaceRestrictions: bool,
    public networkIsolation: bool,
    public filesystemMode: FilesystemIsolationMode,
    public allowedMounts: Array<string>
  ) {}
}

export class SandboxStatus {
  enabled: bool = false;
  supported: bool = false;
  active: bool = false;
  namespaceSupported: bool = false;
  namespaceActive: bool = false;
  networkSupported: bool = false;
  networkActive: bool = false;
  filesystemMode: FilesystemIsolationMode = FilesystemIsolationMode.WorkspaceOnly;
  filesystemActive: bool = false;
  allowedMounts: Array<string> = [];
  inContainer: bool = false;
  containerMarkers: Array<string> = [];
  fallbackReason: string = "";
}

function arraysEqual(a: Array<string>, b: Array<string>): bool {
  if (a.length != b.length) return false;
  for (let i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
