// Session types — ported from rust/crates/runtime/src/session.rs

import { JsonValue } from "./json";
import { TokenUsage } from "./usage";

export const enum MessageRole {
  System = 0,
  User = 1,
  Assistant = 2,
  Tool = 3,
}

export function messageRoleToString(role: MessageRole): string {
  switch (role) {
    case MessageRole.System:
      return "system";
    case MessageRole.User:
      return "user";
    case MessageRole.Assistant:
      return "assistant";
    case MessageRole.Tool:
      return "tool";
    default:
      return "unknown";
  }
}

export function messageRoleFromString(s: string): MessageRole {
  if (s == "system") return MessageRole.System;
  if (s == "user") return MessageRole.User;
  if (s == "assistant") return MessageRole.Assistant;
  if (s == "tool") return MessageRole.Tool;
  throw new Error("unsupported message role: " + s);
}

// ContentBlock discriminated union — AS doesn't have real enums with data,
// so we use a tagged class hierarchy.

export const BLOCK_TEXT: u8 = 0;
export const BLOCK_TOOL_USE: u8 = 1;
export const BLOCK_TOOL_RESULT: u8 = 2;

export class ContentBlock {
  kind: u8;
  // Text fields
  text: string;
  // ToolUse fields
  id: string;
  name: string;
  input: string;
  // ToolResult fields
  toolUseId: string;
  toolName: string;
  output: string;
  isError: bool;

  private constructor(kind: u8) {
    this.kind = kind;
    this.text = "";
    this.id = "";
    this.name = "";
    this.input = "";
    this.toolUseId = "";
    this.toolName = "";
    this.output = "";
    this.isError = false;
  }

  static Text(text: string): ContentBlock {
    const b = new ContentBlock(BLOCK_TEXT);
    b.text = text;
    return b;
  }

  static ToolUse(id: string, name: string, input: string): ContentBlock {
    const b = new ContentBlock(BLOCK_TOOL_USE);
    b.id = id;
    b.name = name;
    b.input = input;
    return b;
  }

  static ToolResult(
    toolUseId: string,
    toolName: string,
    output: string,
    isError: bool
  ): ContentBlock {
    const b = new ContentBlock(BLOCK_TOOL_RESULT);
    b.toolUseId = toolUseId;
    b.toolName = toolName;
    b.output = output;
    b.isError = isError;
    return b;
  }

  isText(): bool {
    return this.kind == BLOCK_TEXT;
  }
  isToolUse(): bool {
    return this.kind == BLOCK_TOOL_USE;
  }
  isToolResult(): bool {
    return this.kind == BLOCK_TOOL_RESULT;
  }

  toJson(): JsonValue {
    const keys = new Array<string>();
    const values = new Array<JsonValue>();

    switch (this.kind) {
      case BLOCK_TEXT:
        keys.push("type");
        values.push(JsonValue.String("text"));
        keys.push("text");
        values.push(JsonValue.String(this.text));
        break;
      case BLOCK_TOOL_USE:
        keys.push("type");
        values.push(JsonValue.String("tool_use"));
        keys.push("id");
        values.push(JsonValue.String(this.id));
        keys.push("name");
        values.push(JsonValue.String(this.name));
        keys.push("input");
        values.push(JsonValue.String(this.input));
        break;
      case BLOCK_TOOL_RESULT:
        keys.push("type");
        values.push(JsonValue.String("tool_result"));
        keys.push("tool_use_id");
        values.push(JsonValue.String(this.toolUseId));
        keys.push("tool_name");
        values.push(JsonValue.String(this.toolName));
        keys.push("output");
        values.push(JsonValue.String(this.output));
        keys.push("is_error");
        values.push(JsonValue.Bool(this.isError));
        break;
      default:
        break;
    }
    return JsonValue.Object(keys, values);
  }

  static fromJson(value: JsonValue): ContentBlock {
    if (!value.isObject()) throw new Error("block must be an object");
    const typeVal = value.objectGet("type");
    if (typeVal == null || !typeVal.isString()) throw new Error("missing block type");
    const blockType = typeVal.asStr();

    if (blockType == "text") {
      return ContentBlock.Text(requiredString(value, "text"));
    } else if (blockType == "tool_use") {
      return ContentBlock.ToolUse(
        requiredString(value, "id"),
        requiredString(value, "name"),
        requiredString(value, "input")
      );
    } else if (blockType == "tool_result") {
      const isErrVal = value.objectGet("is_error");
      if (isErrVal == null || !isErrVal.isBool()) throw new Error("missing is_error");
      return ContentBlock.ToolResult(
        requiredString(value, "tool_use_id"),
        requiredString(value, "tool_name"),
        requiredString(value, "output"),
        isErrVal.asBool()
      );
    }
    throw new Error("unsupported block type: " + blockType);
  }

  equals(other: ContentBlock): bool {
    if (this.kind != other.kind) return false;
    switch (this.kind) {
      case BLOCK_TEXT:
        return this.text == other.text;
      case BLOCK_TOOL_USE:
        return this.id == other.id && this.name == other.name && this.input == other.input;
      case BLOCK_TOOL_RESULT:
        return (
          this.toolUseId == other.toolUseId &&
          this.toolName == other.toolName &&
          this.output == other.output &&
          this.isError == other.isError
        );
      default:
        return false;
    }
  }
}

export class ConversationMessage {
  role: MessageRole;
  blocks: Array<ContentBlock>;
  usage: TokenUsage | null;

  constructor(
    role: MessageRole,
    blocks: Array<ContentBlock>,
    usage: TokenUsage | null = null
  ) {
    this.role = role;
    this.blocks = blocks;
    this.usage = usage;
  }

  static userText(text: string): ConversationMessage {
    return new ConversationMessage(MessageRole.User, [ContentBlock.Text(text)]);
  }

  static assistant(blocks: Array<ContentBlock>): ConversationMessage {
    return new ConversationMessage(MessageRole.Assistant, blocks);
  }

  static assistantWithUsage(
    blocks: Array<ContentBlock>,
    usage: TokenUsage | null
  ): ConversationMessage {
    return new ConversationMessage(MessageRole.Assistant, blocks, usage);
  }

  static toolResult(
    toolUseId: string,
    toolName: string,
    output: string,
    isError: bool
  ): ConversationMessage {
    return new ConversationMessage(MessageRole.Tool, [
      ContentBlock.ToolResult(toolUseId, toolName, output, isError),
    ]);
  }

  toJson(): JsonValue {
    const keys = new Array<string>();
    const values = new Array<JsonValue>();

    keys.push("role");
    values.push(JsonValue.String(messageRoleToString(this.role)));

    const blockJsons = new Array<JsonValue>(this.blocks.length);
    for (let i = 0; i < this.blocks.length; i++) {
      blockJsons[i] = this.blocks[i].toJson();
    }
    keys.push("blocks");
    values.push(JsonValue.Array(blockJsons));

    if (this.usage != null) {
      keys.push("usage");
      values.push(usageToJson(this.usage!));
    }

    return JsonValue.Object(keys, values);
  }

  static fromJson(value: JsonValue): ConversationMessage {
    if (!value.isObject()) throw new Error("message must be an object");

    const roleVal = value.objectGet("role");
    if (roleVal == null || !roleVal.isString()) throw new Error("missing role");
    const role = messageRoleFromString(roleVal.asStr());

    const blocksVal = value.objectGet("blocks");
    if (blocksVal == null || !blocksVal.isArray()) throw new Error("missing blocks");
    const blocksArr = blocksVal.asArray();
    const blocks = new Array<ContentBlock>(blocksArr.length);
    for (let i = 0; i < blocksArr.length; i++) {
      blocks[i] = ContentBlock.fromJson(blocksArr[i]);
    }

    let usage: TokenUsage | null = null;
    const usageVal = value.objectGet("usage");
    if (usageVal != null) {
      usage = usageFromJson(usageVal);
    }

    return new ConversationMessage(role, blocks, usage);
  }

  equals(other: ConversationMessage): bool {
    if (this.role != other.role) return false;
    if (this.blocks.length != other.blocks.length) return false;
    for (let i = 0; i < this.blocks.length; i++) {
      if (!this.blocks[i].equals(other.blocks[i])) return false;
    }
    if (this.usage == null && other.usage == null) return true;
    if (this.usage == null || other.usage == null) return false;
    return this.usage!.equals(other.usage!);
  }

  clone(): ConversationMessage {
    const newBlocks = new Array<ContentBlock>(this.blocks.length);
    for (let i = 0; i < this.blocks.length; i++) {
      // ContentBlock is immutable by convention, shallow copy is fine
      newBlocks[i] = this.blocks[i];
    }
    return new ConversationMessage(
      this.role,
      newBlocks,
      this.usage != null ? this.usage!.clone() : null
    );
  }
}

export class Session {
  version: u32;
  messages: Array<ConversationMessage>;

  constructor(version: u32 = 1, messages: Array<ConversationMessage> | null = null) {
    this.version = version;
    this.messages = messages != null ? messages! : new Array<ConversationMessage>();
  }

  static create(): Session {
    return new Session(1);
  }

  toJson(): JsonValue {
    const keys = new Array<string>();
    const values = new Array<JsonValue>();

    keys.push("version");
    values.push(JsonValue.Number(i64(this.version)));

    const msgJsons = new Array<JsonValue>(this.messages.length);
    for (let i = 0; i < this.messages.length; i++) {
      msgJsons[i] = this.messages[i].toJson();
    }
    keys.push("messages");
    values.push(JsonValue.Array(msgJsons));

    return JsonValue.Object(keys, values);
  }

  static fromJson(value: JsonValue): Session {
    if (!value.isObject()) throw new Error("session must be an object");

    const versionVal = value.objectGet("version");
    if (versionVal == null || !versionVal.isNumber()) throw new Error("missing version");
    const version = u32(versionVal.asI64());

    const messagesVal = value.objectGet("messages");
    if (messagesVal == null || !messagesVal.isArray()) throw new Error("missing messages");
    const messagesArr = messagesVal.asArray();
    const messages = new Array<ConversationMessage>(messagesArr.length);
    for (let i = 0; i < messagesArr.length; i++) {
      messages[i] = ConversationMessage.fromJson(messagesArr[i]);
    }

    return new Session(version, messages);
  }

  /** Stub: serialization to string for persistence */
  serialize(): string {
    return this.toJson().render();
  }

  /** Stub: deserialization from string */
  static deserialize(data: string): Session {
    return Session.fromJson(JsonValue.parse(data));
  }

  clone(): Session {
    const msgs = new Array<ConversationMessage>(this.messages.length);
    for (let i = 0; i < this.messages.length; i++) {
      msgs[i] = this.messages[i].clone();
    }
    return new Session(this.version, msgs);
  }

  equals(other: Session): bool {
    if (this.version != other.version) return false;
    if (this.messages.length != other.messages.length) return false;
    for (let i = 0; i < this.messages.length; i++) {
      if (!this.messages[i].equals(other.messages[i])) return false;
    }
    return true;
  }
}

// --- Helpers ---

function requiredString(obj: JsonValue, key: string): string {
  const val = obj.objectGet(key);
  if (val == null || !val.isString()) throw new Error("missing " + key);
  return val.asStr();
}

function usageToJson(usage: TokenUsage): JsonValue {
  const keys: Array<string> = [
    "input_tokens",
    "output_tokens",
    "cache_creation_input_tokens",
    "cache_read_input_tokens",
  ];
  const values: Array<JsonValue> = [
    JsonValue.Number(i64(usage.inputTokens)),
    JsonValue.Number(i64(usage.outputTokens)),
    JsonValue.Number(i64(usage.cacheCreationInputTokens)),
    JsonValue.Number(i64(usage.cacheReadInputTokens)),
  ];
  return JsonValue.Object(keys, values);
}

function usageFromJson(value: JsonValue): TokenUsage {
  if (!value.isObject()) throw new Error("usage must be an object");
  return new TokenUsage(
    requiredU32(value, "input_tokens"),
    requiredU32(value, "output_tokens"),
    requiredU32(value, "cache_creation_input_tokens"),
    requiredU32(value, "cache_read_input_tokens")
  );
}

function requiredU32(obj: JsonValue, key: string): u32 {
  const val = obj.objectGet(key);
  if (val == null || !val.isNumber()) throw new Error("missing " + key);
  return u32(val.asI64());
}
