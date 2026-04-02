export var CommandSource;
(function (CommandSource) {
    CommandSource[CommandSource["Builtin"] = 0] = "Builtin";
    CommandSource[CommandSource["InternalOnly"] = 1] = "InternalOnly";
    CommandSource[CommandSource["FeatureGated"] = 2] = "FeatureGated";
})(CommandSource || (CommandSource = {}));
export var BootstrapPhase;
(function (BootstrapPhase) {
    BootstrapPhase[BootstrapPhase["CliEntry"] = 0] = "CliEntry";
    BootstrapPhase[BootstrapPhase["FastPathVersion"] = 1] = "FastPathVersion";
    BootstrapPhase[BootstrapPhase["StartupProfiler"] = 2] = "StartupProfiler";
    BootstrapPhase[BootstrapPhase["SystemPromptFastPath"] = 3] = "SystemPromptFastPath";
    BootstrapPhase[BootstrapPhase["ChromeMcpFastPath"] = 4] = "ChromeMcpFastPath";
    BootstrapPhase[BootstrapPhase["DaemonWorkerFastPath"] = 5] = "DaemonWorkerFastPath";
    BootstrapPhase[BootstrapPhase["BridgeFastPath"] = 6] = "BridgeFastPath";
    BootstrapPhase[BootstrapPhase["DaemonFastPath"] = 7] = "DaemonFastPath";
    BootstrapPhase[BootstrapPhase["BackgroundSessionFastPath"] = 8] = "BackgroundSessionFastPath";
    BootstrapPhase[BootstrapPhase["TemplateFastPath"] = 9] = "TemplateFastPath";
    BootstrapPhase[BootstrapPhase["EnvironmentRunnerFastPath"] = 10] = "EnvironmentRunnerFastPath";
    BootstrapPhase[BootstrapPhase["MainRuntime"] = 11] = "MainRuntime";
})(BootstrapPhase || (BootstrapPhase = {}));
//# sourceMappingURL=commands.js.map