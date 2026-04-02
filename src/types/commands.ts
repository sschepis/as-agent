import type { Session } from "./session.js";

export enum CommandSource {
  Builtin = 0,
  InternalOnly = 1,
  FeatureGated = 2,
}

export interface CommandManifestEntry {
  name: string;
  source: CommandSource;
}

export interface CommandRegistry {
  entries: CommandManifestEntry[];
}

export interface SlashCommandSpec {
  name: string;
  summary: string;
  argumentHint: string;
  resumeSupported: boolean;
}

export interface SlashCommand {
  kind: number;
  arg1: string;
  arg2: string;
  confirm: boolean;
}

export interface SlashCommandResult {
  message: string;
  session: Session;
}

export enum BootstrapPhase {
  CliEntry = 0,
  FastPathVersion = 1,
  StartupProfiler = 2,
  SystemPromptFastPath = 3,
  ChromeMcpFastPath = 4,
  DaemonWorkerFastPath = 5,
  BridgeFastPath = 6,
  DaemonFastPath = 7,
  BackgroundSessionFastPath = 8,
  TemplateFastPath = 9,
  EnvironmentRunnerFastPath = 10,
  MainRuntime = 11,
}

export interface BootstrapPlan {
  phases: BootstrapPhase[];
}
