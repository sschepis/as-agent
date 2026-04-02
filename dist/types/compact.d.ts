import type { Session } from "./session.js";
export interface CompactionConfig {
    preserveRecentMessages: number;
    maxEstimatedTokens: number;
}
export interface CompactionResult {
    summary: string;
    formattedSummary: string;
    compactedSession: Session;
    removedMessageCount: number;
}
//# sourceMappingURL=compact.d.ts.map