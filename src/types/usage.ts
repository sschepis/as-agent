export interface TokenUsage {
  inputTokens: number;
  outputTokens: number;
  cacheCreationInputTokens: number;
  cacheReadInputTokens: number;
}

export interface UsageCostEstimate {
  inputCostUsd: number;
  outputCostUsd: number;
  cacheCreationCostUsd: number;
  cacheReadCostUsd: number;
  totalCostUsd: number;
}

export interface ModelPricing {
  inputCostPerMillion: number;
  outputCostPerMillion: number;
  cacheCreationCostPerMillion: number;
  cacheReadCostPerMillion: number;
}

export interface UsageTracker {
  record(usage: TokenUsage): void;
  currentTurnUsage(): TokenUsage;
  cumulativeUsage(): TokenUsage;
  turns(): number;
}
