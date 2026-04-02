export enum MessageRole {
  System = 0,
  User = 1,
  Assistant = 2,
  Tool = 3,
}

export interface TextBlock {
  kind: "text";
  text: string;
}

export interface ToolUseBlock {
  kind: "tool_use";
  id: string;
  name: string;
  input: string;
}

export interface ToolResultBlock {
  kind: "tool_result";
  toolUseId: string;
  toolName: string;
  output: string;
  isError: boolean;
}

export type ContentBlock = TextBlock | ToolUseBlock | ToolResultBlock;

export interface ConversationMessage {
  role: MessageRole;
  blocks: ContentBlock[];
  usage?: TokenUsage | null;
}

export interface Session {
  version: number;
  messages: ConversationMessage[];
}

// Inline to avoid circular dep
interface TokenUsage {
  inputTokens: number;
  outputTokens: number;
  cacheCreationInputTokens: number;
  cacheReadInputTokens: number;
}
