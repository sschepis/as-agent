// Token usage tracking and cost estimation — ported from rust/crates/runtime/src/usage.rs

const DEFAULT_INPUT_COST_PER_MILLION: f64 = 15.0;
const DEFAULT_OUTPUT_COST_PER_MILLION: f64 = 75.0;
const DEFAULT_CACHE_CREATION_COST_PER_MILLION: f64 = 18.75;
const DEFAULT_CACHE_READ_COST_PER_MILLION: f64 = 1.5;

export class ModelPricing {
  constructor(
    public inputCostPerMillion: f64,
    public outputCostPerMillion: f64,
    public cacheCreationCostPerMillion: f64,
    public cacheReadCostPerMillion: f64
  ) {}

  static defaultSonnetTier(): ModelPricing {
    return new ModelPricing(
      DEFAULT_INPUT_COST_PER_MILLION,
      DEFAULT_OUTPUT_COST_PER_MILLION,
      DEFAULT_CACHE_CREATION_COST_PER_MILLION,
      DEFAULT_CACHE_READ_COST_PER_MILLION
    );
  }
}

export function pricingForModel(model: string): ModelPricing | null {
  const normalized = model.toLowerCase();
  if (normalized.includes("haiku")) {
    return new ModelPricing(1.0, 5.0, 1.25, 0.1);
  }
  if (normalized.includes("opus")) {
    return new ModelPricing(15.0, 75.0, 18.75, 1.5);
  }
  if (normalized.includes("sonnet")) {
    return ModelPricing.defaultSonnetTier();
  }
  return null;
}

export class TokenUsage {
  constructor(
    public inputTokens: u32 = 0,
    public outputTokens: u32 = 0,
    public cacheCreationInputTokens: u32 = 0,
    public cacheReadInputTokens: u32 = 0
  ) {}

  totalTokens(): u32 {
    return (
      this.inputTokens +
      this.outputTokens +
      this.cacheCreationInputTokens +
      this.cacheReadInputTokens
    );
  }

  estimateCostUsd(): UsageCostEstimate {
    return this.estimateCostUsdWithPricing(ModelPricing.defaultSonnetTier());
  }

  estimateCostUsdWithPricing(pricing: ModelPricing): UsageCostEstimate {
    return new UsageCostEstimate(
      costForTokens(this.inputTokens, pricing.inputCostPerMillion),
      costForTokens(this.outputTokens, pricing.outputCostPerMillion),
      costForTokens(this.cacheCreationInputTokens, pricing.cacheCreationCostPerMillion),
      costForTokens(this.cacheReadInputTokens, pricing.cacheReadCostPerMillion)
    );
  }

  summaryLines(label: string): Array<string> {
    return this.summaryLinesForModel(label, "");
  }

  summaryLinesForModel(label: string, model: string): Array<string> {
    const pricingResult = model.length > 0 ? pricingForModel(model) : null;
    const cost = pricingResult != null
      ? this.estimateCostUsdWithPricing(pricingResult!)
      : this.estimateCostUsd();
    const modelSuffix = model.length > 0 ? " model=" + model : "";
    const pricingSuffix = pricingResult != null ? "" : model.length > 0 ? " pricing=estimated-default" : "";
    return [
      label +
        ": total_tokens=" + this.totalTokens().toString() +
        " input=" + this.inputTokens.toString() +
        " output=" + this.outputTokens.toString() +
        " cache_write=" + this.cacheCreationInputTokens.toString() +
        " cache_read=" + this.cacheReadInputTokens.toString() +
        " estimated_cost=" + formatUsd(cost.totalCostUsd()) +
        modelSuffix +
        pricingSuffix,
      "  cost breakdown: input=" + formatUsd(cost.inputCostUsd) +
        " output=" + formatUsd(cost.outputCostUsd) +
        " cache_write=" + formatUsd(cost.cacheCreationCostUsd) +
        " cache_read=" + formatUsd(cost.cacheReadCostUsd),
    ];
  }

  equals(other: TokenUsage): bool {
    return (
      this.inputTokens == other.inputTokens &&
      this.outputTokens == other.outputTokens &&
      this.cacheCreationInputTokens == other.cacheCreationInputTokens &&
      this.cacheReadInputTokens == other.cacheReadInputTokens
    );
  }

  clone(): TokenUsage {
    return new TokenUsage(
      this.inputTokens,
      this.outputTokens,
      this.cacheCreationInputTokens,
      this.cacheReadInputTokens
    );
  }
}

export class UsageCostEstimate {
  constructor(
    public inputCostUsd: f64,
    public outputCostUsd: f64,
    public cacheCreationCostUsd: f64,
    public cacheReadCostUsd: f64
  ) {}

  totalCostUsd(): f64 {
    return (
      this.inputCostUsd +
      this.outputCostUsd +
      this.cacheCreationCostUsd +
      this.cacheReadCostUsd
    );
  }
}

function costForTokens(tokens: u32, usdPerMillionTokens: f64): f64 {
  return (f64(tokens) / 1_000_000.0) * usdPerMillionTokens;
}

export function formatUsd(amount: f64): string {
  // Format to 4 decimal places: $X.XXXX
  const scaled = Math.round(amount * 10000.0);
  const intPart = i64(scaled / 10000);
  const fracPart = i64(Math.abs(scaled)) % 10000;
  const fracStr = fracPart.toString().padStart(4, "0");
  return "$" + intPart.toString() + "." + fracStr;
}

export class UsageTracker {
  private latestTurn: TokenUsage;
  private cumulative: TokenUsage;
  private _turns: u32;

  constructor() {
    this.latestTurn = new TokenUsage();
    this.cumulative = new TokenUsage();
    this._turns = 0;
  }

  record(usage: TokenUsage): void {
    this.latestTurn = usage.clone();
    this.cumulative.inputTokens += usage.inputTokens;
    this.cumulative.outputTokens += usage.outputTokens;
    this.cumulative.cacheCreationInputTokens += usage.cacheCreationInputTokens;
    this.cumulative.cacheReadInputTokens += usage.cacheReadInputTokens;
    this._turns += 1;
  }

  currentTurnUsage(): TokenUsage {
    return this.latestTurn;
  }

  cumulativeUsage(): TokenUsage {
    return this.cumulative;
  }

  turns(): u32 {
    return this._turns;
  }
}
