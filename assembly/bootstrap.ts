// Bootstrap phases — ported from rust/crates/runtime/src/bootstrap.rs

export const enum BootstrapPhase {
  CliEntry = 0,
  FastPathVersion = 1,
  StartupProfiler = 2,
  SystemPromptFastPath = 3,
  ChromeMcpFastPath = 4,
  DaemonWorkerFastPath = 5,
  BridgeFastPath = 6,
  DaemonFastPath = 7,
  BackgroundSessionFastPath = 8,
  TemplateFastPath = 9,
  EnvironmentRunnerFastPath = 10,
  MainRuntime = 11,
}

export class BootstrapPlan {
  private phases: Array<BootstrapPhase>;

  private constructor(phases: Array<BootstrapPhase>) {
    this.phases = phases;
  }

  static claudeCodeDefault(): BootstrapPlan {
    return BootstrapPlan.fromPhases([
      BootstrapPhase.CliEntry,
      BootstrapPhase.FastPathVersion,
      BootstrapPhase.StartupProfiler,
      BootstrapPhase.SystemPromptFastPath,
      BootstrapPhase.ChromeMcpFastPath,
      BootstrapPhase.DaemonWorkerFastPath,
      BootstrapPhase.BridgeFastPath,
      BootstrapPhase.DaemonFastPath,
      BootstrapPhase.BackgroundSessionFastPath,
      BootstrapPhase.TemplateFastPath,
      BootstrapPhase.EnvironmentRunnerFastPath,
      BootstrapPhase.MainRuntime,
    ]);
  }

  static fromPhases(phases: Array<BootstrapPhase>): BootstrapPlan {
    const deduped = new Array<BootstrapPhase>();
    for (let i = 0; i < phases.length; i++) {
      if (!deduped.includes(phases[i])) {
        deduped.push(phases[i]);
      }
    }
    return new BootstrapPlan(deduped);
  }

  getPhases(): Array<BootstrapPhase> {
    return this.phases;
  }
}
