// Claw Code — AssemblyScript core library
// Re-exports all modules for the public API surface.

// JSON value types and parser
export {
  JsonValue,
  JsonError,
  JSON_NULL,
  JSON_BOOL,
  JSON_NUMBER,
  JSON_STRING,
  JSON_ARRAY,
  JSON_OBJECT,
} from "./json";

// Token usage and cost tracking
export {
  TokenUsage,
  UsageTracker,
  UsageCostEstimate,
  ModelPricing,
  pricingForModel,
  formatUsd,
} from "./usage";

// Session types
export {
  MessageRole,
  ContentBlock,
  ConversationMessage,
  Session,
  messageRoleToString,
  messageRoleFromString,
  BLOCK_TEXT,
  BLOCK_TOOL_USE,
  BLOCK_TOOL_RESULT,
} from "./session";

// Permission system
export {
  PermissionMode,
  PermissionRequest,
  PermissionPromptDecision,
  PermissionPrompter,
  PermissionOutcome,
  PermissionPolicy,
  permissionModeAsStr,
} from "./permissions";

// Sandbox configuration
export {
  FilesystemIsolationMode,
  SandboxConfig,
  SandboxRequest,
  SandboxStatus,
  filesystemIsolationModeAsStr,
  filesystemIsolationModeFromStr,
} from "./sandbox";

// Runtime configuration
export {
  ConfigSource,
  ResolvedPermissionMode,
  ConfigEntry,
  ConfigLoader,
  RuntimeConfig,
  RuntimeFeatureConfig,
  RuntimeHookConfig,
  McpTransport,
  McpServerConfig,
  McpStdioServerConfig,
  McpRemoteServerConfig,
  McpWebSocketServerConfig,
  McpSdkServerConfig,
  McpClaudeAiProxyServerConfig,
  McpOAuthConfig,
  McpConfigCollection,
  ScopedMcpServerConfig,
  OAuthConfig,
  CLAUDE_CODE_SETTINGS_SCHEMA_NAME,
} from "./config";

// Session compaction
export {
  CompactionConfig,
  CompactionResult,
  compactSession,
  estimateSessionTokens,
  shouldCompact,
  formatCompactSummary,
  getCompactContinuationMessage,
} from "./compact";

// Hook system
export {
  HookEvent,
  HookRunResult,
  HookRunner,
  HookCommandHandler,
  HookCommandResult,
  NoOpHookCommandHandler,
  hookEventAsStr,
} from "./hooks";

// Conversation runtime
export {
  ApiRequest,
  AssistantEvent,
  ApiClient,
  ToolExecutor,
  ToolExecuteResult,
  ToolError,
  RuntimeError,
  TurnSummary,
  AutoCompactionEvent,
  StaticToolExecutor,
  ConversationRuntime,
  EVENT_TEXT_DELTA,
  EVENT_TOOL_USE,
  EVENT_USAGE,
  EVENT_MESSAGE_STOP,
} from "./conversation";

// Slash commands
export {
  CommandManifestEntry,
  CommandSource,
  CommandRegistry,
  SlashCommandSpec,
  SlashCommand,
  SlashCommandResult,
  slashCommandSpecs,
  resumeSupportedSlashCommands,
  renderSlashCommandHelp,
  handleSlashCommand,
} from "./commands";

// Bootstrap phases
export {
  BootstrapPhase,
  BootstrapPlan,
} from "./bootstrap";

// I/O stubs
export {
  ReadFileOutput,
  WriteFileOutput,
  EditFileOutput,
  GlobSearchOutput,
  GrepSearchOutput,
  GrepSearchInput,
  StructuredPatchHunk,
  TextFilePayload,
  FileSystem,
  BashCommandInput,
  BashCommandOutput,
  BashExecutor,
  McpTool,
  McpToolCallParams,
  McpToolCallResult,
  McpResource,
  McpResourceContents,
  JsonRpcRequest,
  JsonRpcResponse,
  JsonRpcError,
  McpServerManager,
  OAuthTokenSet,
  PkceCodePair,
  OAuthHandler,
  ContextFile,
  ProjectContext,
  SystemPromptBuilder,
} from "./stubs";
