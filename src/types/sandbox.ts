export enum FilesystemIsolationMode {
  Off = 0,
  WorkspaceOnly = 1,
  AllowList = 2,
}

export interface SandboxConfig {
  enabled?: boolean;
  namespaceRestrictions?: boolean;
  networkIsolation?: boolean;
  filesystemMode?: FilesystemIsolationMode;
  allowedMounts: string[];
}

export interface SandboxRequest {
  enabled: boolean;
  namespaceRestrictions: boolean;
  networkIsolation: boolean;
  filesystemMode: FilesystemIsolationMode;
  allowedMounts: string[];
}

export interface SandboxStatus {
  enabled: boolean;
  supported: boolean;
  active: boolean;
  namespaceSupported: boolean;
  namespaceActive: boolean;
  networkSupported: boolean;
  networkActive: boolean;
  filesystemMode: FilesystemIsolationMode;
  filesystemActive: boolean;
  allowedMounts: string[];
  inContainer: boolean;
  containerMarkers: string[];
  fallbackReason?: string;
}
