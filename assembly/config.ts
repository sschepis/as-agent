// Runtime configuration — ported from rust/crates/runtime/src/config.rs
// Note: File I/O (ConfigLoader.load) is stubbed — config parsing logic is fully ported.

import { JsonValue } from "./json";
import { SandboxConfig, FilesystemIsolationMode, filesystemIsolationModeFromStr } from "./sandbox";

export const CLAUDE_CODE_SETTINGS_SCHEMA_NAME: string = "SettingsSchema";

export const enum ConfigSource {
  User = 0,
  Project = 1,
  Local = 2,
}

export const enum ResolvedPermissionMode {
  ReadOnly = 0,
  WorkspaceWrite = 1,
  DangerFullAccess = 2,
}

export class ConfigEntry {
  constructor(public source: ConfigSource, public path: string) {}
}

// --- MCP server configuration types ---

export const enum McpTransport {
  Stdio = 0,
  Sse = 1,
  Http = 2,
  Ws = 3,
  Sdk = 4,
  ClaudeAiProxy = 5,
}

export class McpStdioServerConfig {
  constructor(
    public command: string,
    public args: Array<string>,
    public env: Map<string, string>
  ) {}
}

export class McpRemoteServerConfig {
  constructor(
    public url: string,
    public headers: Map<string, string>,
    public headersHelper: string,
    public oauth: McpOAuthConfig | null
  ) {}
}

export class McpWebSocketServerConfig {
  constructor(
    public url: string,
    public headers: Map<string, string>,
    public headersHelper: string
  ) {}
}

export class McpSdkServerConfig {
  constructor(public name: string) {}
}

export class McpClaudeAiProxyServerConfig {
  constructor(public url: string, public id: string) {}
}

export class McpOAuthConfig {
  constructor(
    public clientId: string,
    public callbackPort: u16,
    public authServerMetadataUrl: string,
    public xaa: bool
  ) {}
}

export const MCP_STDIO: u8 = 0;
export const MCP_SSE: u8 = 1;
export const MCP_HTTP: u8 = 2;
export const MCP_WS: u8 = 3;
export const MCP_SDK: u8 = 4;
export const MCP_CLAUDEAI_PROXY: u8 = 5;

export class McpServerConfig {
  kind: u8;
  stdioConfig: McpStdioServerConfig | null;
  remoteConfig: McpRemoteServerConfig | null;
  wsConfig: McpWebSocketServerConfig | null;
  sdkConfig: McpSdkServerConfig | null;
  proxyConfig: McpClaudeAiProxyServerConfig | null;

  private constructor(kind: u8) {
    this.kind = kind;
    this.stdioConfig = null;
    this.remoteConfig = null;
    this.wsConfig = null;
    this.sdkConfig = null;
    this.proxyConfig = null;
  }

  static Stdio(config: McpStdioServerConfig): McpServerConfig {
    const c = new McpServerConfig(MCP_STDIO);
    c.stdioConfig = config;
    return c;
  }

  static Sse(config: McpRemoteServerConfig): McpServerConfig {
    const c = new McpServerConfig(MCP_SSE);
    c.remoteConfig = config;
    return c;
  }

  static Http(config: McpRemoteServerConfig): McpServerConfig {
    const c = new McpServerConfig(MCP_HTTP);
    c.remoteConfig = config;
    return c;
  }

  static Ws(config: McpWebSocketServerConfig): McpServerConfig {
    const c = new McpServerConfig(MCP_WS);
    c.wsConfig = config;
    return c;
  }

  static Sdk(config: McpSdkServerConfig): McpServerConfig {
    const c = new McpServerConfig(MCP_SDK);
    c.sdkConfig = config;
    return c;
  }

  static ClaudeAiProxy(config: McpClaudeAiProxyServerConfig): McpServerConfig {
    const c = new McpServerConfig(MCP_CLAUDEAI_PROXY);
    c.proxyConfig = config;
    return c;
  }

  transport(): McpTransport {
    switch (this.kind) {
      case MCP_STDIO:
        return McpTransport.Stdio;
      case MCP_SSE:
        return McpTransport.Sse;
      case MCP_HTTP:
        return McpTransport.Http;
      case MCP_WS:
        return McpTransport.Ws;
      case MCP_SDK:
        return McpTransport.Sdk;
      case MCP_CLAUDEAI_PROXY:
        return McpTransport.ClaudeAiProxy;
      default:
        return McpTransport.Stdio;
    }
  }
}

export class ScopedMcpServerConfig {
  constructor(public scope: ConfigSource, public config: McpServerConfig) {}

  transport(): McpTransport {
    return this.config.transport();
  }
}

export class McpConfigCollection {
  private servers: Map<string, ScopedMcpServerConfig>;

  constructor() {
    this.servers = new Map<string, ScopedMcpServerConfig>();
  }

  getServers(): Map<string, ScopedMcpServerConfig> {
    return this.servers;
  }

  get(name: string): ScopedMcpServerConfig | null {
    if (this.servers.has(name)) {
      return this.servers.get(name);
    }
    return null;
  }

  set(name: string, config: ScopedMcpServerConfig): void {
    this.servers.set(name, config);
  }
}

// --- OAuth configuration ---

export class OAuthConfig {
  constructor(
    public clientId: string,
    public authorizeUrl: string,
    public tokenUrl: string,
    public callbackPort: u16,
    public manualRedirectUrl: string,
    public scopes: Array<string>
  ) {}
}

// --- Hook configuration ---

export class RuntimeHookConfig {
  preToolUse: Array<string>;
  postToolUse: Array<string>;

  constructor(preToolUse: Array<string> = [], postToolUse: Array<string> = []) {
    this.preToolUse = preToolUse;
    this.postToolUse = postToolUse;
  }

  getPreToolUse(): Array<string> {
    return this.preToolUse;
  }

  getPostToolUse(): Array<string> {
    return this.postToolUse;
  }
}

// --- Feature configuration ---

export class RuntimeFeatureConfig {
  hooks: RuntimeHookConfig;
  mcp: McpConfigCollection;
  oauth: OAuthConfig | null;
  model: string;
  permissionMode: ResolvedPermissionMode | null;
  sandbox: SandboxConfig;

  constructor() {
    this.hooks = new RuntimeHookConfig();
    this.mcp = new McpConfigCollection();
    this.oauth = null;
    this.model = "";
    this.permissionMode = null;
    this.sandbox = SandboxConfig.default();
  }

  static default(): RuntimeFeatureConfig {
    return new RuntimeFeatureConfig();
  }

  withHooks(hooks: RuntimeHookConfig): RuntimeFeatureConfig {
    this.hooks = hooks;
    return this;
  }

  getHooks(): RuntimeHookConfig {
    return this.hooks;
  }

  getMcp(): McpConfigCollection {
    return this.mcp;
  }

  getOAuth(): OAuthConfig | null {
    return this.oauth;
  }

  getModel(): string {
    return this.model;
  }

  getPermissionMode(): ResolvedPermissionMode | null {
    return this.permissionMode;
  }

  getSandbox(): SandboxConfig {
    return this.sandbox;
  }
}

// --- Runtime config ---

export class RuntimeConfig {
  private merged: Map<string, JsonValue>;
  private loadedEntries: Array<ConfigEntry>;
  private featureConfig: RuntimeFeatureConfig;

  constructor() {
    this.merged = new Map<string, JsonValue>();
    this.loadedEntries = new Array<ConfigEntry>();
    this.featureConfig = RuntimeFeatureConfig.default();
  }

  static empty(): RuntimeConfig {
    return new RuntimeConfig();
  }

  getMerged(): Map<string, JsonValue> {
    return this.merged;
  }

  getLoadedEntries(): Array<ConfigEntry> {
    return this.loadedEntries;
  }

  get(key: string): JsonValue | null {
    if (this.merged.has(key)) {
      return this.merged.get(key);
    }
    return null;
  }

  getFeatureConfig(): RuntimeFeatureConfig {
    return this.featureConfig;
  }

  getMcp(): McpConfigCollection {
    return this.featureConfig.mcp;
  }

  getHooks(): RuntimeHookConfig {
    return this.featureConfig.hooks;
  }

  getOAuth(): OAuthConfig | null {
    return this.featureConfig.oauth;
  }

  getModel(): string {
    return this.featureConfig.model;
  }

  getPermissionMode(): ResolvedPermissionMode | null {
    return this.featureConfig.permissionMode;
  }

  getSandbox(): SandboxConfig {
    return this.featureConfig.sandbox;
  }
}

// --- Config loading from JSON values (no file I/O) ---

export class ConfigLoader {
  private cwd: string;
  private configHome: string;

  constructor(cwd: string, configHome: string) {
    this.cwd = cwd;
    this.configHome = configHome;
  }

  /** Returns the list of config file paths that would be checked. */
  discover(): Array<ConfigEntry> {
    // Derive the legacy path (parent of configHome + .claude.json)
    const parentEnd = this.configHome.lastIndexOf("/");
    const legacyPath =
      parentEnd >= 0
        ? this.configHome.substring(0, parentEnd) + "/.claude.json"
        : ".claude.json";

    return [
      new ConfigEntry(ConfigSource.User, legacyPath),
      new ConfigEntry(ConfigSource.User, this.configHome + "/settings.json"),
      new ConfigEntry(ConfigSource.Project, this.cwd + "/.claude.json"),
      new ConfigEntry(ConfigSource.Project, this.cwd + "/.claude/settings.json"),
      new ConfigEntry(ConfigSource.Local, this.cwd + "/.claude/settings.local.json"),
    ];
  }

  /**
   * Load and merge config from pre-parsed JSON values.
   * This replaces file I/O with an array of (ConfigEntry, JsonValue | null) pairs.
   * Pass null for entries whose files don't exist.
   */
  loadFromValues(entries: Array<ConfigEntry>, values: Array<JsonValue | null>): RuntimeConfig {
    const config = new RuntimeConfig();
    const mcpServers = new Map<string, ScopedMcpServerConfig>();

    for (let i = 0; i < entries.length; i++) {
      const value = values[i];
      if (value == null) continue;
      if (!value!.isObject()) {
        throw new Error(entries[i].path + ": top-level settings value must be a JSON object");
      }

      mergeMcpServers(mcpServers, entries[i].source, value!, entries[i].path);
      deepMergeObjects(config.getMerged(), value!);
      config.getLoadedEntries().push(entries[i]);
    }

    // Parse feature config from merged values
    const fc = config.getFeatureConfig();

    // Hooks
    const mergedObj = mapToJsonObject(config.getMerged());
    fc.hooks = parseOptionalHooksConfig(mergedObj);

    // MCP
    fc.mcp = new McpConfigCollection();
    const mcpKeys = mcpServers.keys();
    for (let i = 0; i < mcpKeys.length; i++) {
      fc.mcp.set(mcpKeys[i], mcpServers.get(mcpKeys[i]));
    }

    // OAuth
    fc.oauth = parseOptionalOAuthConfig(mergedObj);

    // Model
    const modelVal = mergedObj.objectGet("model");
    if (modelVal != null && modelVal.isString()) {
      fc.model = modelVal.asStr();
    }

    // Permission mode
    fc.permissionMode = parseOptionalPermissionMode(mergedObj);

    // Sandbox
    fc.sandbox = parseOptionalSandboxConfig(mergedObj);

    return config;
  }
}

// --- Parsing helpers ---

function mapToJsonObject(map: Map<string, JsonValue>): JsonValue {
  const keys = map.keys();
  const vals = new Array<JsonValue>(keys.length);
  for (let i = 0; i < keys.length; i++) {
    vals[i] = map.get(keys[i]);
  }
  return JsonValue.Object(keys, vals);
}

function deepMergeObjects(target: Map<string, JsonValue>, source: JsonValue): void {
  if (!source.isObject()) return;
  const srcKeys = source.objectKeys;
  const srcVals = source.objectValues;
  for (let i = 0; i < srcKeys.length; i++) {
    const key = srcKeys[i];
    const srcVal = srcVals[i];
    if (target.has(key) && target.get(key).isObject() && srcVal.isObject()) {
      // Recursive merge: convert existing to map, merge, convert back
      const existing = target.get(key);
      const subMap = jsonObjectToMap(existing);
      deepMergeObjects(subMap, srcVal);
      target.set(key, mapToJsonObject(subMap));
    } else {
      target.set(key, srcVal);
    }
  }
}

function jsonObjectToMap(value: JsonValue): Map<string, JsonValue> {
  const map = new Map<string, JsonValue>();
  if (!value.isObject()) return map;
  for (let i = 0; i < value.objectKeys.length; i++) {
    map.set(value.objectKeys[i], value.objectValues[i]);
  }
  return map;
}

function mergeMcpServers(
  target: Map<string, ScopedMcpServerConfig>,
  source: ConfigSource,
  root: JsonValue,
  path: string
): void {
  const mcpServersVal = root.objectGet("mcpServers");
  if (mcpServersVal == null || !mcpServersVal.isObject()) return;

  for (let i = 0; i < mcpServersVal.objectKeys.length; i++) {
    const name = mcpServersVal.objectKeys[i];
    const value = mcpServersVal.objectValues[i];
    const parsed = parseMcpServerConfig(name, value, path + ": mcpServers." + name);
    target.set(name, new ScopedMcpServerConfig(source, parsed));
  }
}

function parseMcpServerConfig(serverName: string, value: JsonValue, context: string): McpServerConfig {
  if (!value.isObject()) throw new Error(context + ": expected JSON object");

  const typeVal = value.objectGet("type");
  const serverType = typeVal != null && typeVal.isString() ? typeVal.asStr() : "stdio";

  if (serverType == "stdio") {
    return McpServerConfig.Stdio(
      new McpStdioServerConfig(
        expectString(value, "command", context),
        optionalStringArray(value, "args"),
        optionalStringMap(value, "env")
      )
    );
  }
  if (serverType == "sse") {
    return McpServerConfig.Sse(parseRemoteConfig(value, context));
  }
  if (serverType == "http") {
    return McpServerConfig.Http(parseRemoteConfig(value, context));
  }
  if (serverType == "ws") {
    const headersHelperVal = value.objectGet("headersHelper");
    return McpServerConfig.Ws(
      new McpWebSocketServerConfig(
        expectString(value, "url", context),
        optionalStringMap(value, "headers"),
        headersHelperVal != null && headersHelperVal.isString() ? headersHelperVal.asStr() : ""
      )
    );
  }
  if (serverType == "sdk") {
    return McpServerConfig.Sdk(new McpSdkServerConfig(expectString(value, "name", context)));
  }
  if (serverType == "claudeai-proxy") {
    return McpServerConfig.ClaudeAiProxy(
      new McpClaudeAiProxyServerConfig(
        expectString(value, "url", context),
        expectString(value, "id", context)
      )
    );
  }

  throw new Error(context + ": unsupported MCP server type for " + serverName + ": " + serverType);
}

function parseRemoteConfig(value: JsonValue, context: string): McpRemoteServerConfig {
  const headersHelperVal = value.objectGet("headersHelper");
  let oauth: McpOAuthConfig | null = null;
  const oauthVal = value.objectGet("oauth");
  if (oauthVal != null && oauthVal.isObject()) {
    const clientIdVal = oauthVal.objectGet("clientId");
    const callbackPortVal = oauthVal.objectGet("callbackPort");
    const authUrlVal = oauthVal.objectGet("authServerMetadataUrl");
    const xaaVal = oauthVal.objectGet("xaa");
    oauth = new McpOAuthConfig(
      clientIdVal != null && clientIdVal.isString() ? clientIdVal.asStr() : "",
      callbackPortVal != null && callbackPortVal.isNumber() ? u16(callbackPortVal.asI64()) : 0,
      authUrlVal != null && authUrlVal.isString() ? authUrlVal.asStr() : "",
      xaaVal != null && xaaVal.isBool() ? xaaVal.asBool() : false
    );
  }
  return new McpRemoteServerConfig(
    expectString(value, "url", context),
    optionalStringMap(value, "headers"),
    headersHelperVal != null && headersHelperVal.isString() ? headersHelperVal.asStr() : "",
    oauth
  );
}

function parseOptionalHooksConfig(root: JsonValue): RuntimeHookConfig {
  const hooksVal = root.objectGet("hooks");
  if (hooksVal == null || !hooksVal.isObject()) return new RuntimeHookConfig();
  return new RuntimeHookConfig(
    optionalStringArray(hooksVal, "PreToolUse"),
    optionalStringArray(hooksVal, "PostToolUse")
  );
}

function parseOptionalOAuthConfig(root: JsonValue): OAuthConfig | null {
  const oauthVal = root.objectGet("oauth");
  if (oauthVal == null || !oauthVal.isObject()) return null;
  const callbackPortVal = oauthVal.objectGet("callbackPort");
  const manualRedirectVal = oauthVal.objectGet("manualRedirectUrl");
  return new OAuthConfig(
    expectString(oauthVal, "clientId", "oauth"),
    expectString(oauthVal, "authorizeUrl", "oauth"),
    expectString(oauthVal, "tokenUrl", "oauth"),
    callbackPortVal != null && callbackPortVal.isNumber() ? u16(callbackPortVal.asI64()) : 0,
    manualRedirectVal != null && manualRedirectVal.isString() ? manualRedirectVal.asStr() : "",
    optionalStringArray(oauthVal, "scopes")
  );
}

function parseOptionalPermissionMode(root: JsonValue): ResolvedPermissionMode | null {
  const modeVal = root.objectGet("permissionMode");
  if (modeVal != null && modeVal.isString()) {
    return parsePermissionModeLabel(modeVal.asStr());
  }
  const permissionsVal = root.objectGet("permissions");
  if (permissionsVal != null && permissionsVal.isObject()) {
    const defaultModeVal = permissionsVal.objectGet("defaultMode");
    if (defaultModeVal != null && defaultModeVal.isString()) {
      return parsePermissionModeLabel(defaultModeVal.asStr());
    }
  }
  return null;
}

function parsePermissionModeLabel(mode: string): ResolvedPermissionMode {
  if (mode == "default" || mode == "plan" || mode == "read-only") {
    return ResolvedPermissionMode.ReadOnly;
  }
  if (mode == "acceptEdits" || mode == "auto" || mode == "workspace-write") {
    return ResolvedPermissionMode.WorkspaceWrite;
  }
  if (mode == "dontAsk" || mode == "danger-full-access") {
    return ResolvedPermissionMode.DangerFullAccess;
  }
  throw new Error("unsupported permission mode: " + mode);
}

function parseOptionalSandboxConfig(root: JsonValue): SandboxConfig {
  const sandboxVal = root.objectGet("sandbox");
  if (sandboxVal == null || !sandboxVal.isObject()) return SandboxConfig.default();

  const config = new SandboxConfig();
  const enabledVal = sandboxVal.objectGet("enabled");
  if (enabledVal != null && enabledVal.isBool()) config.enabled = enabledVal.asBool();
  const nsVal = sandboxVal.objectGet("namespaceRestrictions");
  if (nsVal != null && nsVal.isBool()) config.namespaceRestrictions = nsVal.asBool();
  const netVal = sandboxVal.objectGet("networkIsolation");
  if (netVal != null && netVal.isBool()) config.networkIsolation = netVal.asBool();
  const fsModeVal = sandboxVal.objectGet("filesystemMode");
  if (fsModeVal != null && fsModeVal.isString()) {
    config.filesystemMode = filesystemIsolationModeFromStr(fsModeVal.asStr());
  }
  config.allowedMounts = optionalStringArray(sandboxVal, "allowedMounts");
  return config;
}

// --- JSON access helpers ---

function expectString(obj: JsonValue, key: string, context: string): string {
  const val = obj.objectGet(key);
  if (val == null || !val.isString()) {
    throw new Error(context + ": missing string field " + key);
  }
  return val.asStr();
}

function optionalStringArray(obj: JsonValue, key: string): Array<string> {
  const val = obj.objectGet(key);
  if (val == null) return new Array<string>();
  if (!val.isArray()) return new Array<string>();
  const arr = val.asArray();
  const result = new Array<string>(arr.length);
  for (let i = 0; i < arr.length; i++) {
    if (!arr[i].isString()) throw new Error("array element must be a string");
    result[i] = arr[i].asStr();
  }
  return result;
}

function optionalStringMap(obj: JsonValue, key: string): Map<string, string> {
  const result = new Map<string, string>();
  const val = obj.objectGet(key);
  if (val == null || !val.isObject()) return result;
  for (let i = 0; i < val.objectKeys.length; i++) {
    if (val.objectValues[i].isString()) {
      result.set(val.objectKeys[i], val.objectValues[i].asStr());
    }
  }
  return result;
}
