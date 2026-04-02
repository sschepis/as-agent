/** Exported memory */
export declare const memory: WebAssembly.Memory;
/** assembly/json/JSON_NULL */
export declare const JSON_NULL: {
  /** @type `u8` */
  get value(): number
};
/** assembly/json/JSON_BOOL */
export declare const JSON_BOOL: {
  /** @type `u8` */
  get value(): number
};
/** assembly/json/JSON_NUMBER */
export declare const JSON_NUMBER: {
  /** @type `u8` */
  get value(): number
};
/** assembly/json/JSON_STRING */
export declare const JSON_STRING: {
  /** @type `u8` */
  get value(): number
};
/** assembly/json/JSON_ARRAY */
export declare const JSON_ARRAY: {
  /** @type `u8` */
  get value(): number
};
/** assembly/json/JSON_OBJECT */
export declare const JSON_OBJECT: {
  /** @type `u8` */
  get value(): number
};
/**
 * assembly/usage/pricingForModel
 * @param model `~lib/string/String`
 * @returns `assembly/usage/ModelPricing | null`
 */
export declare function pricingForModel(model: string): __Internref8 | null;
/**
 * assembly/usage/formatUsd
 * @param amount `f64`
 * @returns `~lib/string/String`
 */
export declare function formatUsd(amount: number): string;
/** assembly/session/MessageRole */
export declare enum MessageRole {
  /** @type `i32` */
  System,
  /** @type `i32` */
  User,
  /** @type `i32` */
  Assistant,
  /** @type `i32` */
  Tool,
}
/**
 * assembly/session/messageRoleToString
 * @param role `i32`
 * @returns `~lib/string/String`
 */
export declare function messageRoleToString(role: number): string;
/**
 * assembly/session/messageRoleFromString
 * @param s `~lib/string/String`
 * @returns `i32`
 */
export declare function messageRoleFromString(s: string): number;
/** assembly/session/BLOCK_TEXT */
export declare const BLOCK_TEXT: {
  /** @type `u8` */
  get value(): number
};
/** assembly/session/BLOCK_TOOL_USE */
export declare const BLOCK_TOOL_USE: {
  /** @type `u8` */
  get value(): number
};
/** assembly/session/BLOCK_TOOL_RESULT */
export declare const BLOCK_TOOL_RESULT: {
  /** @type `u8` */
  get value(): number
};
/** assembly/permissions/PermissionMode */
export declare enum PermissionMode {
  /** @type `i32` */
  ReadOnly,
  /** @type `i32` */
  WorkspaceWrite,
  /** @type `i32` */
  DangerFullAccess,
  /** @type `i32` */
  Prompt,
  /** @type `i32` */
  Allow,
}
/**
 * assembly/permissions/permissionModeAsStr
 * @param mode `i32`
 * @returns `~lib/string/String`
 */
export declare function permissionModeAsStr(mode: number): string;
/** assembly/sandbox/FilesystemIsolationMode */
export declare enum FilesystemIsolationMode {
  /** @type `i32` */
  Off,
  /** @type `i32` */
  WorkspaceOnly,
  /** @type `i32` */
  AllowList,
}
/**
 * assembly/sandbox/filesystemIsolationModeAsStr
 * @param mode `i32`
 * @returns `~lib/string/String`
 */
export declare function filesystemIsolationModeAsStr(mode: number): string;
/**
 * assembly/sandbox/filesystemIsolationModeFromStr
 * @param s `~lib/string/String`
 * @returns `i32`
 */
export declare function filesystemIsolationModeFromStr(s: string): number;
/** assembly/config/ConfigSource */
export declare enum ConfigSource {
  /** @type `i32` */
  User,
  /** @type `i32` */
  Project,
  /** @type `i32` */
  Local,
}
/** assembly/config/ResolvedPermissionMode */
export declare enum ResolvedPermissionMode {
  /** @type `i32` */
  ReadOnly,
  /** @type `i32` */
  WorkspaceWrite,
  /** @type `i32` */
  DangerFullAccess,
}
/** assembly/config/McpTransport */
export declare enum McpTransport {
  /** @type `i32` */
  Stdio,
  /** @type `i32` */
  Sse,
  /** @type `i32` */
  Http,
  /** @type `i32` */
  Ws,
  /** @type `i32` */
  Sdk,
  /** @type `i32` */
  ClaudeAiProxy,
}
/** assembly/config/CLAUDE_CODE_SETTINGS_SCHEMA_NAME */
export declare const CLAUDE_CODE_SETTINGS_SCHEMA_NAME: {
  /** @type `~lib/string/String` */
  get value(): string
};
/**
 * assembly/compact/compactSession
 * @param session `assembly/session/Session`
 * @param config `assembly/compact/CompactionConfig`
 * @returns `assembly/compact/CompactionResult`
 */
export declare function compactSession(session: __Internref9, config: __Internref15): __Internref16;
/**
 * assembly/compact/estimateSessionTokens
 * @param session `assembly/session/Session`
 * @returns `i32`
 */
export declare function estimateSessionTokens(session: __Internref9): number;
/**
 * assembly/compact/shouldCompact
 * @param session `assembly/session/Session`
 * @param config `assembly/compact/CompactionConfig`
 * @returns `bool`
 */
export declare function shouldCompact(session: __Internref9, config: __Internref15): boolean;
/**
 * assembly/compact/formatCompactSummary
 * @param summary `~lib/string/String`
 * @returns `~lib/string/String`
 */
export declare function formatCompactSummary(summary: string): string;
/**
 * assembly/compact/getCompactContinuationMessage
 * @param summary `~lib/string/String`
 * @param suppressFollowUpQuestions `bool`
 * @param recentMessagesPreserved `bool`
 * @returns `~lib/string/String`
 */
export declare function getCompactContinuationMessage(summary: string, suppressFollowUpQuestions: boolean, recentMessagesPreserved: boolean): string;
/** assembly/hooks/HookEvent */
export declare enum HookEvent {
  /** @type `i32` */
  PreToolUse,
  /** @type `i32` */
  PostToolUse,
}
/**
 * assembly/hooks/hookEventAsStr
 * @param event `i32`
 * @returns `~lib/string/String`
 */
export declare function hookEventAsStr(event: number): string;
/** assembly/conversation/EVENT_TEXT_DELTA */
export declare const EVENT_TEXT_DELTA: {
  /** @type `u8` */
  get value(): number
};
/** assembly/conversation/EVENT_TOOL_USE */
export declare const EVENT_TOOL_USE: {
  /** @type `u8` */
  get value(): number
};
/** assembly/conversation/EVENT_USAGE */
export declare const EVENT_USAGE: {
  /** @type `u8` */
  get value(): number
};
/** assembly/conversation/EVENT_MESSAGE_STOP */
export declare const EVENT_MESSAGE_STOP: {
  /** @type `u8` */
  get value(): number
};
/** assembly/commands/CommandSource */
export declare enum CommandSource {
  /** @type `i32` */
  Builtin,
  /** @type `i32` */
  InternalOnly,
  /** @type `i32` */
  FeatureGated,
}
/**
 * assembly/commands/slashCommandSpecs
 * @returns `~lib/array/Array<assembly/commands/SlashCommandSpec>`
 */
export declare function slashCommandSpecs(): Array<__Internref5>;
/**
 * assembly/commands/resumeSupportedSlashCommands
 * @returns `~lib/array/Array<assembly/commands/SlashCommandSpec>`
 */
export declare function resumeSupportedSlashCommands(): Array<__Internref5>;
/**
 * assembly/commands/renderSlashCommandHelp
 * @returns `~lib/string/String`
 */
export declare function renderSlashCommandHelp(): string;
/**
 * assembly/commands/handleSlashCommand
 * @param input `~lib/string/String`
 * @param session `assembly/session/Session`
 * @param compaction `assembly/compact/CompactionConfig`
 * @returns `assembly/commands/SlashCommandResult | null`
 */
export declare function handleSlashCommand(input: string, session: __Internref9, compaction: __Internref15): __Internref18 | null;
/** assembly/bootstrap/BootstrapPhase */
export declare enum BootstrapPhase {
  /** @type `i32` */
  CliEntry,
  /** @type `i32` */
  FastPathVersion,
  /** @type `i32` */
  StartupProfiler,
  /** @type `i32` */
  SystemPromptFastPath,
  /** @type `i32` */
  ChromeMcpFastPath,
  /** @type `i32` */
  DaemonWorkerFastPath,
  /** @type `i32` */
  BridgeFastPath,
  /** @type `i32` */
  DaemonFastPath,
  /** @type `i32` */
  BackgroundSessionFastPath,
  /** @type `i32` */
  TemplateFastPath,
  /** @type `i32` */
  EnvironmentRunnerFastPath,
  /** @type `i32` */
  MainRuntime,
}
/** assembly/usage/ModelPricing */
declare class __Internref8 extends Number {
  private __nominal8: symbol;
  private __nominal0: symbol;
}
/** assembly/session/Session */
declare class __Internref9 extends Number {
  private __nominal9: symbol;
  private __nominal0: symbol;
}
/** assembly/compact/CompactionConfig */
declare class __Internref15 extends Number {
  private __nominal15: symbol;
  private __nominal0: symbol;
}
/** assembly/compact/CompactionResult */
declare class __Internref16 extends Number {
  private __nominal16: symbol;
  private __nominal0: symbol;
}
/** assembly/commands/SlashCommandSpec */
declare class __Internref5 extends Number {
  private __nominal5: symbol;
  private __nominal0: symbol;
}
/** assembly/commands/SlashCommandResult */
declare class __Internref18 extends Number {
  private __nominal18: symbol;
  private __nominal0: symbol;
}
