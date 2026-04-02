// Session compaction — ported from rust/crates/runtime/src/compact.rs

import {
  ContentBlock,
  ConversationMessage,
  MessageRole,
  Session,
  messageRoleToString,
  BLOCK_TEXT,
  BLOCK_TOOL_USE,
  BLOCK_TOOL_RESULT,
} from "./session";

export class CompactionConfig {
  preserveRecentMessages: i32;
  maxEstimatedTokens: i32;

  constructor(preserveRecentMessages: i32 = 4, maxEstimatedTokens: i32 = 10_000) {
    this.preserveRecentMessages = preserveRecentMessages;
    this.maxEstimatedTokens = maxEstimatedTokens;
  }

  static default(): CompactionConfig {
    return new CompactionConfig();
  }
}

export class CompactionResult {
  constructor(
    public summary: string,
    public formattedSummary: string,
    public compactedSession: Session,
    public removedMessageCount: i32
  ) {}
}

export function estimateSessionTokens(session: Session): i32 {
  let total: i32 = 0;
  for (let i = 0; i < session.messages.length; i++) {
    total += estimateMessageTokens(session.messages[i]);
  }
  return total;
}

export function shouldCompact(session: Session, config: CompactionConfig): bool {
  return (
    session.messages.length > config.preserveRecentMessages &&
    estimateSessionTokens(session) >= config.maxEstimatedTokens
  );
}

export function formatCompactSummary(summary: string): string {
  let withoutAnalysis = stripTagBlock(summary, "analysis");
  const content = extractTagBlock(withoutAnalysis, "summary");
  let formatted: string;
  if (content.length > 0) {
    formatted = withoutAnalysis.replace(
      "<summary>" + content + "</summary>",
      "Summary:\n" + content.trimStart()
    );
  } else {
    formatted = withoutAnalysis;
  }
  return collapseBlankLines(formatted).trim();
}

export function getCompactContinuationMessage(
  summary: string,
  suppressFollowUpQuestions: bool,
  recentMessagesPreserved: bool
): string {
  let base =
    "This session is being continued from a previous conversation that ran out of context. The summary below covers the earlier portion of the conversation.\n\n" +
    formatCompactSummary(summary);

  if (recentMessagesPreserved) {
    base += "\n\nRecent messages are preserved verbatim.";
  }

  if (suppressFollowUpQuestions) {
    base +=
      "\nContinue the conversation from where it left off without asking the user any further questions. Resume directly — do not acknowledge the summary, do not recap what was happening, and do not preface with continuation text.";
  }

  return base;
}

export function compactSession(session: Session, config: CompactionConfig): CompactionResult {
  if (!shouldCompact(session, config)) {
    return new CompactionResult("", "", session.clone(), 0);
  }

  const keepFrom = Math.max(0, session.messages.length - config.preserveRecentMessages) as i32;
  const removed = session.messages.slice(0, keepFrom);
  const preserved = session.messages.slice(keepFrom);
  const summary = summarizeMessages(removed);
  const formattedSummary = formatCompactSummary(summary);
  const continuation = getCompactContinuationMessage(summary, true, preserved.length > 0);

  const compactedMessages = new Array<ConversationMessage>();
  compactedMessages.push(
    new ConversationMessage(MessageRole.System, [ContentBlock.Text(continuation)])
  );
  for (let i = 0; i < preserved.length; i++) {
    compactedMessages.push(preserved[i]);
  }

  return new CompactionResult(
    summary,
    formattedSummary,
    new Session(session.version, compactedMessages),
    removed.length
  );
}

// --- Internal helpers ---

function summarizeMessages(messages: Array<ConversationMessage>): string {
  let userMessages: i32 = 0;
  let assistantMessages: i32 = 0;
  let toolMessages: i32 = 0;

  for (let i = 0; i < messages.length; i++) {
    if (messages[i].role == MessageRole.User) userMessages++;
    else if (messages[i].role == MessageRole.Assistant) assistantMessages++;
    else if (messages[i].role == MessageRole.Tool) toolMessages++;
  }

  // Collect unique tool names
  const toolNameSet = new Array<string>();
  for (let i = 0; i < messages.length; i++) {
    const blocks = messages[i].blocks;
    for (let j = 0; j < blocks.length; j++) {
      const block = blocks[j];
      let name = "";
      if (block.kind == BLOCK_TOOL_USE) name = block.name;
      else if (block.kind == BLOCK_TOOL_RESULT) name = block.toolName;
      if (name.length > 0 && !toolNameSet.includes(name)) {
        toolNameSet.push(name);
      }
    }
  }
  toolNameSet.sort();

  const lines = new Array<string>();
  lines.push("<summary>");
  lines.push("Conversation summary:");
  lines.push(
    "- Scope: " +
      messages.length.toString() +
      " earlier messages compacted (user=" +
      userMessages.toString() +
      ", assistant=" +
      assistantMessages.toString() +
      ", tool=" +
      toolMessages.toString() +
      ")."
  );

  if (toolNameSet.length > 0) {
    lines.push("- Tools mentioned: " + toolNameSet.join(", ") + ".");
  }

  const recentUserRequests = collectRecentRoleSummaries(messages, MessageRole.User, 3);
  if (recentUserRequests.length > 0) {
    lines.push("- Recent user requests:");
    for (let i = 0; i < recentUserRequests.length; i++) {
      lines.push("  - " + recentUserRequests[i]);
    }
  }

  const pendingWork = inferPendingWork(messages);
  if (pendingWork.length > 0) {
    lines.push("- Pending work:");
    for (let i = 0; i < pendingWork.length; i++) {
      lines.push("  - " + pendingWork[i]);
    }
  }

  const keyFiles = collectKeyFiles(messages);
  if (keyFiles.length > 0) {
    lines.push("- Key files referenced: " + keyFiles.join(", ") + ".");
  }

  const currentWork = inferCurrentWork(messages);
  if (currentWork.length > 0) {
    lines.push("- Current work: " + currentWork);
  }

  lines.push("- Key timeline:");
  for (let i = 0; i < messages.length; i++) {
    const role = messageRoleToString(messages[i].role);
    const contentParts = new Array<string>();
    for (let j = 0; j < messages[i].blocks.length; j++) {
      contentParts.push(summarizeBlock(messages[i].blocks[j]));
    }
    lines.push("  - " + role + ": " + contentParts.join(" | "));
  }
  lines.push("</summary>");
  return lines.join("\n");
}

function summarizeBlock(block: ContentBlock): string {
  let raw: string;
  switch (block.kind) {
    case BLOCK_TEXT:
      raw = block.text;
      break;
    case BLOCK_TOOL_USE:
      raw = "tool_use " + block.name + "(" + block.input + ")";
      break;
    case BLOCK_TOOL_RESULT:
      raw =
        "tool_result " +
        block.toolName +
        ": " +
        (block.isError ? "error " : "") +
        block.output;
      break;
    default:
      raw = "";
  }
  return truncateSummary(raw, 160);
}

function collectRecentRoleSummaries(
  messages: Array<ConversationMessage>,
  role: MessageRole,
  limit: i32
): Array<string> {
  const results = new Array<string>();
  for (let i = messages.length - 1; i >= 0 && results.length < limit; i--) {
    if (messages[i].role != role) continue;
    const text = firstTextBlock(messages[i]);
    if (text.length > 0) {
      results.push(truncateSummary(text, 160));
    }
  }
  results.reverse();
  return results;
}

function inferPendingWork(messages: Array<ConversationMessage>): Array<string> {
  const results = new Array<string>();
  for (let i = messages.length - 1; i >= 0 && results.length < 3; i--) {
    const text = firstTextBlock(messages[i]);
    if (text.length == 0) continue;
    const lowered = text.toLowerCase();
    if (
      lowered.includes("todo") ||
      lowered.includes("next") ||
      lowered.includes("pending") ||
      lowered.includes("follow up") ||
      lowered.includes("remaining")
    ) {
      results.push(truncateSummary(text, 160));
    }
  }
  results.reverse();
  return results;
}

function collectKeyFiles(messages: Array<ConversationMessage>): Array<string> {
  const files = new Array<string>();
  for (let i = 0; i < messages.length; i++) {
    const blocks = messages[i].blocks;
    for (let j = 0; j < blocks.length; j++) {
      let content = "";
      switch (blocks[j].kind) {
        case BLOCK_TEXT:
          content = blocks[j].text;
          break;
        case BLOCK_TOOL_USE:
          content = blocks[j].input;
          break;
        case BLOCK_TOOL_RESULT:
          content = blocks[j].output;
          break;
      }
      const candidates = extractFileCandidates(content);
      for (let k = 0; k < candidates.length; k++) {
        if (!files.includes(candidates[k])) {
          files.push(candidates[k]);
        }
      }
    }
  }
  files.sort();
  if (files.length > 8) return files.slice(0, 8);
  return files;
}

function inferCurrentWork(messages: Array<ConversationMessage>): string {
  for (let i = messages.length - 1; i >= 0; i--) {
    const text = firstTextBlock(messages[i]);
    if (text.trim().length > 0) {
      return truncateSummary(text, 200);
    }
  }
  return "";
}

function firstTextBlock(message: ConversationMessage): string {
  for (let i = 0; i < message.blocks.length; i++) {
    if (message.blocks[i].kind == BLOCK_TEXT && message.blocks[i].text.trim().length > 0) {
      return message.blocks[i].text;
    }
  }
  return "";
}

const INTERESTING_EXTENSIONS: Array<string> = ["rs", "ts", "tsx", "js", "json", "md"];

function hasInterestingExtension(candidate: string): bool {
  const dotIndex = candidate.lastIndexOf(".");
  if (dotIndex < 0) return false;
  const ext = candidate.substring(dotIndex + 1).toLowerCase();
  return INTERESTING_EXTENSIONS.includes(ext);
}

function extractFileCandidates(content: string): Array<string> {
  const results = new Array<string>();
  const tokens = content.split(" ");
  for (let i = 0; i < tokens.length; i++) {
    let candidate = tokens[i].trim();
    // Strip punctuation from edges
    while (candidate.length > 0) {
      const ch = candidate.charCodeAt(0);
      if (
        ch == 0x2c || ch == 0x2e || ch == 0x3a || ch == 0x3b ||
        ch == 0x29 || ch == 0x28 || ch == 0x22 || ch == 0x27 || ch == 0x60
      ) {
        candidate = candidate.substring(1);
      } else {
        break;
      }
    }
    while (candidate.length > 0) {
      const ch = candidate.charCodeAt(candidate.length - 1);
      if (
        ch == 0x2c || ch == 0x2e || ch == 0x3a || ch == 0x3b ||
        ch == 0x29 || ch == 0x28 || ch == 0x22 || ch == 0x27 || ch == 0x60
      ) {
        candidate = candidate.substring(0, candidate.length - 1);
      } else {
        break;
      }
    }
    if (candidate.includes("/") && hasInterestingExtension(candidate)) {
      results.push(candidate);
    }
  }
  return results;
}

function truncateSummary(content: string, maxChars: i32): string {
  if (content.length <= maxChars) return content;
  return content.substring(0, maxChars) + "…";
}

function estimateMessageTokens(message: ConversationMessage): i32 {
  let total: i32 = 0;
  for (let i = 0; i < message.blocks.length; i++) {
    const block = message.blocks[i];
    switch (block.kind) {
      case BLOCK_TEXT:
        total += (block.text.length / 4 + 1) as i32;
        break;
      case BLOCK_TOOL_USE:
        total += ((block.name.length + block.input.length) / 4 + 1) as i32;
        break;
      case BLOCK_TOOL_RESULT:
        total += ((block.toolName.length + block.output.length) / 4 + 1) as i32;
        break;
    }
  }
  return total;
}

function extractTagBlock(content: string, tag: string): string {
  const startTag = "<" + tag + ">";
  const endTag = "</" + tag + ">";
  const startIdx = content.indexOf(startTag);
  if (startIdx < 0) return "";
  const contentStart = startIdx + startTag.length;
  const endIdx = content.indexOf(endTag, contentStart);
  if (endIdx < 0) return "";
  return content.substring(contentStart, endIdx);
}

function stripTagBlock(content: string, tag: string): string {
  const startTag = "<" + tag + ">";
  const endTag = "</" + tag + ">";
  const startIdx = content.indexOf(startTag);
  const endIdx = content.indexOf(endTag);
  if (startIdx < 0 || endIdx < 0) return content;
  return content.substring(0, startIdx) + content.substring(endIdx + endTag.length);
}

function collapseBlankLines(content: string): string {
  const lines = content.split("\n");
  let result = "";
  let lastBlank = false;
  for (let i = 0; i < lines.length; i++) {
    const isBlank = lines[i].trim().length == 0;
    if (isBlank && lastBlank) continue;
    result += lines[i] + "\n";
    lastBlank = isBlank;
  }
  return result;
}
