// Slash commands — ported from rust/crates/commands/src/lib.rs

import { CompactionConfig, compactSession } from "./compact";
import { Session, MessageRole } from "./session";

export class CommandManifestEntry {
  constructor(public name: string, public source: CommandSource) {}
}

export const enum CommandSource {
  Builtin = 0,
  InternalOnly = 1,
  FeatureGated = 2,
}

export class CommandRegistry {
  private entries: Array<CommandManifestEntry>;

  constructor(entries: Array<CommandManifestEntry> = []) {
    this.entries = entries;
  }

  getEntries(): Array<CommandManifestEntry> {
    return this.entries;
  }
}

export class SlashCommandSpec {
  constructor(
    public name: string,
    public summary: string,
    public argumentHint: string,
    public resumeSupported: bool
  ) {}
}

const SLASH_COMMAND_SPECS: Array<SlashCommandSpec> = [
  new SlashCommandSpec("help", "Show available slash commands", "", true),
  new SlashCommandSpec("status", "Show current session status", "", true),
  new SlashCommandSpec("compact", "Compact local session history", "", true),
  new SlashCommandSpec("model", "Show or switch the active model", "[model]", false),
  new SlashCommandSpec("permissions", "Show or switch the active permission mode", "[read-only|workspace-write|danger-full-access]", false),
  new SlashCommandSpec("clear", "Start a fresh local session", "[--confirm]", true),
  new SlashCommandSpec("cost", "Show cumulative token usage for this session", "", true),
  new SlashCommandSpec("resume", "Load a saved session into the REPL", "<session-path>", false),
  new SlashCommandSpec("config", "Inspect Claude config files or merged sections", "[env|hooks|model]", true),
  new SlashCommandSpec("memory", "Inspect loaded Claude instruction memory files", "", true),
  new SlashCommandSpec("init", "Create a starter CLAUDE.md for this repo", "", true),
  new SlashCommandSpec("diff", "Show git diff for current workspace changes", "", true),
  new SlashCommandSpec("version", "Show CLI version and build information", "", true),
  new SlashCommandSpec("bughunter", "Inspect the codebase for likely bugs", "[scope]", false),
  new SlashCommandSpec("commit", "Generate a commit message and create a git commit", "", false),
  new SlashCommandSpec("pr", "Draft or create a pull request from the conversation", "[context]", false),
  new SlashCommandSpec("issue", "Draft or create a GitHub issue from the conversation", "[context]", false),
  new SlashCommandSpec("ultraplan", "Run a deep planning prompt with multi-step reasoning", "[task]", false),
  new SlashCommandSpec("teleport", "Jump to a file or symbol by searching the workspace", "<symbol-or-path>", false),
  new SlashCommandSpec("debug-tool-call", "Replay the last tool call with debug details", "", false),
  new SlashCommandSpec("export", "Export the current conversation to a file", "[file]", true),
  new SlashCommandSpec("session", "List or switch managed local sessions", "[list|switch <session-id>]", false),
];

export function slashCommandSpecs(): Array<SlashCommandSpec> {
  return SLASH_COMMAND_SPECS;
}

export function resumeSupportedSlashCommands(): Array<SlashCommandSpec> {
  const result = new Array<SlashCommandSpec>();
  for (let i = 0; i < SLASH_COMMAND_SPECS.length; i++) {
    if (SLASH_COMMAND_SPECS[i].resumeSupported) {
      result.push(SLASH_COMMAND_SPECS[i]);
    }
  }
  return result;
}

export function renderSlashCommandHelp(): string {
  const lines = new Array<string>();
  lines.push("Slash commands");
  lines.push("  [resume] means the command also works with --resume SESSION.json");

  for (let i = 0; i < SLASH_COMMAND_SPECS.length; i++) {
    const spec = SLASH_COMMAND_SPECS[i];
    let name: string;
    if (spec.argumentHint.length > 0) {
      name = "/" + spec.name + " " + spec.argumentHint;
    } else {
      name = "/" + spec.name;
    }
    const resume = spec.resumeSupported ? " [resume]" : "";
    lines.push("  " + padRight(name, 20) + " " + spec.summary + resume);
  }
  return lines.join("\n");
}

// --- SlashCommand parsed representation ---

export const CMD_HELP: u8 = 0;
export const CMD_STATUS: u8 = 1;
export const CMD_COMPACT: u8 = 2;
export const CMD_BUGHUNTER: u8 = 3;
export const CMD_COMMIT: u8 = 4;
export const CMD_PR: u8 = 5;
export const CMD_ISSUE: u8 = 6;
export const CMD_ULTRAPLAN: u8 = 7;
export const CMD_TELEPORT: u8 = 8;
export const CMD_DEBUG_TOOL_CALL: u8 = 9;
export const CMD_MODEL: u8 = 10;
export const CMD_PERMISSIONS: u8 = 11;
export const CMD_CLEAR: u8 = 12;
export const CMD_COST: u8 = 13;
export const CMD_RESUME: u8 = 14;
export const CMD_CONFIG: u8 = 15;
export const CMD_MEMORY: u8 = 16;
export const CMD_INIT: u8 = 17;
export const CMD_DIFF: u8 = 18;
export const CMD_VERSION: u8 = 19;
export const CMD_EXPORT: u8 = 20;
export const CMD_SESSION: u8 = 21;
export const CMD_UNKNOWN: u8 = 255;

export class SlashCommand {
  kind: u8;
  // Optional argument fields
  arg1: string;  // scope, context, task, target, model, mode, section, path, action
  arg2: string;  // target (for /session switch <id>)
  confirm: bool; // for /clear --confirm

  private constructor(kind: u8) {
    this.kind = kind;
    this.arg1 = "";
    this.arg2 = "";
    this.confirm = false;
  }

  static parse(input: string): SlashCommand | null {
    const trimmed = input.trim();
    if (!trimmed.startsWith("/")) return null;

    const withoutSlash = trimmed.substring(1);
    const parts = splitWhitespace(withoutSlash);
    if (parts.length == 0) return null;

    const command = parts[0];
    const rest = remainderAfterCommand(trimmed, command);

    if (command == "help") return new SlashCommand(CMD_HELP);
    if (command == "status") return new SlashCommand(CMD_STATUS);
    if (command == "compact") return new SlashCommand(CMD_COMPACT);
    if (command == "cost") return new SlashCommand(CMD_COST);
    if (command == "memory") return new SlashCommand(CMD_MEMORY);
    if (command == "init") return new SlashCommand(CMD_INIT);
    if (command == "diff") return new SlashCommand(CMD_DIFF);
    if (command == "version") return new SlashCommand(CMD_VERSION);
    if (command == "commit") return new SlashCommand(CMD_COMMIT);
    if (command == "debug-tool-call") return new SlashCommand(CMD_DEBUG_TOOL_CALL);

    if (command == "bughunter") {
      const cmd = new SlashCommand(CMD_BUGHUNTER);
      cmd.arg1 = rest;
      return cmd;
    }
    if (command == "pr") {
      const cmd = new SlashCommand(CMD_PR);
      cmd.arg1 = rest;
      return cmd;
    }
    if (command == "issue") {
      const cmd = new SlashCommand(CMD_ISSUE);
      cmd.arg1 = rest;
      return cmd;
    }
    if (command == "ultraplan") {
      const cmd = new SlashCommand(CMD_ULTRAPLAN);
      cmd.arg1 = rest;
      return cmd;
    }
    if (command == "teleport") {
      const cmd = new SlashCommand(CMD_TELEPORT);
      cmd.arg1 = rest;
      return cmd;
    }
    if (command == "model") {
      const cmd = new SlashCommand(CMD_MODEL);
      if (parts.length > 1) cmd.arg1 = parts[1];
      return cmd;
    }
    if (command == "permissions") {
      const cmd = new SlashCommand(CMD_PERMISSIONS);
      if (parts.length > 1) cmd.arg1 = parts[1];
      return cmd;
    }
    if (command == "clear") {
      const cmd = new SlashCommand(CMD_CLEAR);
      cmd.confirm = parts.length > 1 && parts[1] == "--confirm";
      return cmd;
    }
    if (command == "resume") {
      const cmd = new SlashCommand(CMD_RESUME);
      if (parts.length > 1) cmd.arg1 = parts[1];
      return cmd;
    }
    if (command == "config") {
      const cmd = new SlashCommand(CMD_CONFIG);
      if (parts.length > 1) cmd.arg1 = parts[1];
      return cmd;
    }
    if (command == "export") {
      const cmd = new SlashCommand(CMD_EXPORT);
      if (parts.length > 1) cmd.arg1 = parts[1];
      return cmd;
    }
    if (command == "session") {
      const cmd = new SlashCommand(CMD_SESSION);
      if (parts.length > 1) cmd.arg1 = parts[1];
      if (parts.length > 2) cmd.arg2 = parts[2];
      return cmd;
    }

    const cmd = new SlashCommand(CMD_UNKNOWN);
    cmd.arg1 = command;
    return cmd;
  }
}

export class SlashCommandResult {
  constructor(public message: string, public session: Session) {}
}

export function handleSlashCommand(
  input: string,
  session: Session,
  compaction: CompactionConfig
): SlashCommandResult | null {
  const cmd = SlashCommand.parse(input);
  if (cmd == null) return null;

  if (cmd!.kind == CMD_COMPACT) {
    const result = compactSession(session, compaction);
    let message: string;
    if (result.removedMessageCount == 0) {
      message = "Compaction skipped: session is below the compaction threshold.";
    } else {
      message =
        "Compacted " +
        result.removedMessageCount.toString() +
        " messages into a resumable system summary.";
    }
    return new SlashCommandResult(message, result.compactedSession);
  }

  if (cmd!.kind == CMD_HELP) {
    return new SlashCommandResult(renderSlashCommandHelp(), session.clone());
  }

  // All other commands require runtime context — return null
  return null;
}

// --- Helpers ---

function splitWhitespace(s: string): Array<string> {
  const result = new Array<string>();
  let current = "";
  for (let i = 0; i < s.length; i++) {
    const ch = s.charCodeAt(i);
    if (ch == 0x20 || ch == 0x09 || ch == 0x0a || ch == 0x0d) {
      if (current.length > 0) {
        result.push(current);
        current = "";
      }
    } else {
      current += String.fromCharCode(ch);
    }
  }
  if (current.length > 0) result.push(current);
  return result;
}

function remainderAfterCommand(input: string, command: string): string {
  const prefix = "/" + command;
  const trimmed = input.trim();
  if (!trimmed.startsWith(prefix)) return "";
  const rest = trimmed.substring(prefix.length).trim();
  return rest;
}

function padRight(s: string, width: i32): string {
  let result = s;
  while (result.length < width) {
    result += " ";
  }
  return result;
}
