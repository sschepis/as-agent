async function instantiate(module, imports = {}) {
  const adaptedImports = {
    env: Object.assign(Object.create(globalThis), imports.env || {}, {
      abort(message, fileName, lineNumber, columnNumber) {
        // ~lib/builtins/abort(~lib/string/String | null?, ~lib/string/String | null?, u32?, u32?) => void
        message = __liftString(message >>> 0);
        fileName = __liftString(fileName >>> 0);
        lineNumber = lineNumber >>> 0;
        columnNumber = columnNumber >>> 0;
        (() => {
          // @external.js
          throw Error(`${message} in ${fileName}:${lineNumber}:${columnNumber}`);
        })();
      },
    }),
  };
  const { exports } = await WebAssembly.instantiate(module, adaptedImports);
  const memory = exports.memory || imports.env.memory;
  const adaptedExports = Object.setPrototypeOf({
    pricingForModel(model) {
      // assembly/usage/pricingForModel(~lib/string/String) => assembly/usage/ModelPricing | null
      model = __lowerString(model) || __notnull();
      return __liftInternref(exports.pricingForModel(model) >>> 0);
    },
    formatUsd(amount) {
      // assembly/usage/formatUsd(f64) => ~lib/string/String
      return __liftString(exports.formatUsd(amount) >>> 0);
    },
    MessageRole: (values => (
      // assembly/session/MessageRole
      values[values.System = 0] = "System",
      values[values.User = 1] = "User",
      values[values.Assistant = 2] = "Assistant",
      values[values.Tool = 3] = "Tool",
      values
    ))({}),
    messageRoleToString(role) {
      // assembly/session/messageRoleToString(i32) => ~lib/string/String
      return __liftString(exports.messageRoleToString(role) >>> 0);
    },
    messageRoleFromString(s) {
      // assembly/session/messageRoleFromString(~lib/string/String) => i32
      s = __lowerString(s) || __notnull();
      return exports.messageRoleFromString(s);
    },
    PermissionMode: (values => (
      // assembly/permissions/PermissionMode
      values[values.ReadOnly = 0] = "ReadOnly",
      values[values.WorkspaceWrite = 1] = "WorkspaceWrite",
      values[values.DangerFullAccess = 2] = "DangerFullAccess",
      values[values.Prompt = 3] = "Prompt",
      values[values.Allow = 4] = "Allow",
      values
    ))({}),
    permissionModeAsStr(mode) {
      // assembly/permissions/permissionModeAsStr(i32) => ~lib/string/String
      return __liftString(exports.permissionModeAsStr(mode) >>> 0);
    },
    FilesystemIsolationMode: (values => (
      // assembly/sandbox/FilesystemIsolationMode
      values[values.Off = 0] = "Off",
      values[values.WorkspaceOnly = 1] = "WorkspaceOnly",
      values[values.AllowList = 2] = "AllowList",
      values
    ))({}),
    filesystemIsolationModeAsStr(mode) {
      // assembly/sandbox/filesystemIsolationModeAsStr(i32) => ~lib/string/String
      return __liftString(exports.filesystemIsolationModeAsStr(mode) >>> 0);
    },
    filesystemIsolationModeFromStr(s) {
      // assembly/sandbox/filesystemIsolationModeFromStr(~lib/string/String) => i32
      s = __lowerString(s) || __notnull();
      return exports.filesystemIsolationModeFromStr(s);
    },
    ConfigSource: (values => (
      // assembly/config/ConfigSource
      values[values.User = 0] = "User",
      values[values.Project = 1] = "Project",
      values[values.Local = 2] = "Local",
      values
    ))({}),
    ResolvedPermissionMode: (values => (
      // assembly/config/ResolvedPermissionMode
      values[values.ReadOnly = 0] = "ReadOnly",
      values[values.WorkspaceWrite = 1] = "WorkspaceWrite",
      values[values.DangerFullAccess = 2] = "DangerFullAccess",
      values
    ))({}),
    McpTransport: (values => (
      // assembly/config/McpTransport
      values[values.Stdio = 0] = "Stdio",
      values[values.Sse = 1] = "Sse",
      values[values.Http = 2] = "Http",
      values[values.Ws = 3] = "Ws",
      values[values.Sdk = 4] = "Sdk",
      values[values.ClaudeAiProxy = 5] = "ClaudeAiProxy",
      values
    ))({}),
    CLAUDE_CODE_SETTINGS_SCHEMA_NAME: {
      // assembly/config/CLAUDE_CODE_SETTINGS_SCHEMA_NAME: ~lib/string/String
      valueOf() { return this.value; },
      get value() {
        return __liftString(exports.CLAUDE_CODE_SETTINGS_SCHEMA_NAME.value >>> 0);
      }
    },
    compactSession(session, config) {
      // assembly/compact/compactSession(assembly/session/Session, assembly/compact/CompactionConfig) => assembly/compact/CompactionResult
      session = __retain(__lowerInternref(session) || __notnull());
      config = __lowerInternref(config) || __notnull();
      try {
        return __liftInternref(exports.compactSession(session, config) >>> 0);
      } finally {
        __release(session);
      }
    },
    estimateSessionTokens(session) {
      // assembly/compact/estimateSessionTokens(assembly/session/Session) => i32
      session = __lowerInternref(session) || __notnull();
      return exports.estimateSessionTokens(session);
    },
    shouldCompact(session, config) {
      // assembly/compact/shouldCompact(assembly/session/Session, assembly/compact/CompactionConfig) => bool
      session = __retain(__lowerInternref(session) || __notnull());
      config = __lowerInternref(config) || __notnull();
      try {
        return exports.shouldCompact(session, config) != 0;
      } finally {
        __release(session);
      }
    },
    formatCompactSummary(summary) {
      // assembly/compact/formatCompactSummary(~lib/string/String) => ~lib/string/String
      summary = __lowerString(summary) || __notnull();
      return __liftString(exports.formatCompactSummary(summary) >>> 0);
    },
    getCompactContinuationMessage(summary, suppressFollowUpQuestions, recentMessagesPreserved) {
      // assembly/compact/getCompactContinuationMessage(~lib/string/String, bool, bool) => ~lib/string/String
      summary = __lowerString(summary) || __notnull();
      suppressFollowUpQuestions = suppressFollowUpQuestions ? 1 : 0;
      recentMessagesPreserved = recentMessagesPreserved ? 1 : 0;
      return __liftString(exports.getCompactContinuationMessage(summary, suppressFollowUpQuestions, recentMessagesPreserved) >>> 0);
    },
    HookEvent: (values => (
      // assembly/hooks/HookEvent
      values[values.PreToolUse = 0] = "PreToolUse",
      values[values.PostToolUse = 1] = "PostToolUse",
      values
    ))({}),
    hookEventAsStr(event) {
      // assembly/hooks/hookEventAsStr(i32) => ~lib/string/String
      return __liftString(exports.hookEventAsStr(event) >>> 0);
    },
    CommandSource: (values => (
      // assembly/commands/CommandSource
      values[values.Builtin = 0] = "Builtin",
      values[values.InternalOnly = 1] = "InternalOnly",
      values[values.FeatureGated = 2] = "FeatureGated",
      values
    ))({}),
    slashCommandSpecs() {
      // assembly/commands/slashCommandSpecs() => ~lib/array/Array<assembly/commands/SlashCommandSpec>
      return __liftArray(pointer => __liftInternref(__getU32(pointer)), 2, exports.slashCommandSpecs() >>> 0);
    },
    resumeSupportedSlashCommands() {
      // assembly/commands/resumeSupportedSlashCommands() => ~lib/array/Array<assembly/commands/SlashCommandSpec>
      return __liftArray(pointer => __liftInternref(__getU32(pointer)), 2, exports.resumeSupportedSlashCommands() >>> 0);
    },
    renderSlashCommandHelp() {
      // assembly/commands/renderSlashCommandHelp() => ~lib/string/String
      return __liftString(exports.renderSlashCommandHelp() >>> 0);
    },
    handleSlashCommand(input, session, compaction) {
      // assembly/commands/handleSlashCommand(~lib/string/String, assembly/session/Session, assembly/compact/CompactionConfig) => assembly/commands/SlashCommandResult | null
      input = __retain(__lowerString(input) || __notnull());
      session = __retain(__lowerInternref(session) || __notnull());
      compaction = __lowerInternref(compaction) || __notnull();
      try {
        return __liftInternref(exports.handleSlashCommand(input, session, compaction) >>> 0);
      } finally {
        __release(input);
        __release(session);
      }
    },
    BootstrapPhase: (values => (
      // assembly/bootstrap/BootstrapPhase
      values[values.CliEntry = 0] = "CliEntry",
      values[values.FastPathVersion = 1] = "FastPathVersion",
      values[values.StartupProfiler = 2] = "StartupProfiler",
      values[values.SystemPromptFastPath = 3] = "SystemPromptFastPath",
      values[values.ChromeMcpFastPath = 4] = "ChromeMcpFastPath",
      values[values.DaemonWorkerFastPath = 5] = "DaemonWorkerFastPath",
      values[values.BridgeFastPath = 6] = "BridgeFastPath",
      values[values.DaemonFastPath = 7] = "DaemonFastPath",
      values[values.BackgroundSessionFastPath = 8] = "BackgroundSessionFastPath",
      values[values.TemplateFastPath = 9] = "TemplateFastPath",
      values[values.EnvironmentRunnerFastPath = 10] = "EnvironmentRunnerFastPath",
      values[values.MainRuntime = 11] = "MainRuntime",
      values
    ))({}),
  }, exports);
  function __liftString(pointer) {
    if (!pointer) return null;
    const
      end = pointer + new Uint32Array(memory.buffer)[pointer - 4 >>> 2] >>> 1,
      memoryU16 = new Uint16Array(memory.buffer);
    let
      start = pointer >>> 1,
      string = "";
    while (end - start > 1024) string += String.fromCharCode(...memoryU16.subarray(start, start += 1024));
    return string + String.fromCharCode(...memoryU16.subarray(start, end));
  }
  function __lowerString(value) {
    if (value == null) return 0;
    const
      length = value.length,
      pointer = exports.__new(length << 1, 2) >>> 0,
      memoryU16 = new Uint16Array(memory.buffer);
    for (let i = 0; i < length; ++i) memoryU16[(pointer >>> 1) + i] = value.charCodeAt(i);
    return pointer;
  }
  function __liftArray(liftElement, align, pointer) {
    if (!pointer) return null;
    const
      dataStart = __getU32(pointer + 4),
      length = __dataview.getUint32(pointer + 12, true),
      values = new Array(length);
    for (let i = 0; i < length; ++i) values[i] = liftElement(dataStart + (i << align >>> 0));
    return values;
  }
  class Internref extends Number {}
  const registry = new FinalizationRegistry(__release);
  function __liftInternref(pointer) {
    if (!pointer) return null;
    const sentinel = new Internref(__retain(pointer));
    registry.register(sentinel, pointer);
    return sentinel;
  }
  function __lowerInternref(value) {
    if (value == null) return 0;
    if (value instanceof Internref) return value.valueOf();
    throw TypeError("internref expected");
  }
  const refcounts = new Map();
  function __retain(pointer) {
    if (pointer) {
      const refcount = refcounts.get(pointer);
      if (refcount) refcounts.set(pointer, refcount + 1);
      else refcounts.set(exports.__pin(pointer), 1);
    }
    return pointer;
  }
  function __release(pointer) {
    if (pointer) {
      const refcount = refcounts.get(pointer);
      if (refcount === 1) exports.__unpin(pointer), refcounts.delete(pointer);
      else if (refcount) refcounts.set(pointer, refcount - 1);
      else throw Error(`invalid refcount '${refcount}' for reference '${pointer}'`);
    }
  }
  function __notnull() {
    throw TypeError("value must not be null");
  }
  let __dataview = new DataView(memory.buffer);
  function __getU32(pointer) {
    try {
      return __dataview.getUint32(pointer, true);
    } catch {
      __dataview = new DataView(memory.buffer);
      return __dataview.getUint32(pointer, true);
    }
  }
  return adaptedExports;
}
export const {
  memory,
  JSON_NULL,
  JSON_BOOL,
  JSON_NUMBER,
  JSON_STRING,
  JSON_ARRAY,
  JSON_OBJECT,
  pricingForModel,
  formatUsd,
  MessageRole,
  messageRoleToString,
  messageRoleFromString,
  BLOCK_TEXT,
  BLOCK_TOOL_USE,
  BLOCK_TOOL_RESULT,
  PermissionMode,
  permissionModeAsStr,
  FilesystemIsolationMode,
  filesystemIsolationModeAsStr,
  filesystemIsolationModeFromStr,
  ConfigSource,
  ResolvedPermissionMode,
  McpTransport,
  CLAUDE_CODE_SETTINGS_SCHEMA_NAME,
  compactSession,
  estimateSessionTokens,
  shouldCompact,
  formatCompactSummary,
  getCompactContinuationMessage,
  HookEvent,
  hookEventAsStr,
  EVENT_TEXT_DELTA,
  EVENT_TOOL_USE,
  EVENT_USAGE,
  EVENT_MESSAGE_STOP,
  CommandSource,
  slashCommandSpecs,
  resumeSupportedSlashCommands,
  renderSlashCommandHelp,
  handleSlashCommand,
  BootstrapPhase,
} = await (async url => instantiate(
  await (async () => {
    const isNodeOrBun = typeof process != "undefined" && process.versions != null && (process.versions.node != null || process.versions.bun != null);
    if (isNodeOrBun) { return globalThis.WebAssembly.compile(await (await import("node:fs/promises")).readFile(url)); }
    else { return await globalThis.WebAssembly.compileStreaming(globalThis.fetch(url)); }
  })(), {
  }
))(new URL("release.wasm", import.meta.url));
