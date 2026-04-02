(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32 i32) (result i32)))
 (type $2 (func (param i32 i32)))
 (type $3 (func (param i32 i32 i32) (result i32)))
 (type $4 (func (param i32)))
 (type $5 (func))
 (type $6 (func (result i32)))
 (type $7 (func (param i32 i32 i32)))
 (type $8 (func (param i32 i32 i32 i32) (result i32)))
 (type $9 (func (param i32 i32 i32 i32)))
 (type $10 (func (param i32 i32 i64)))
 (type $11 (func (param f64 f64 f64 f64) (result i32)))
 (type $12 (func (param f64) (result i32)))
 (type $13 (func (param i32 i32 i32 i32 i32)))
 (type $14 (func (param i32 i32 i32 i32 i32 i32)))
 (type $15 (func (param i64) (result i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (global $assembly/json/JSON_NULL i32 (i32.const 0))
 (global $assembly/json/JSON_BOOL i32 (i32.const 1))
 (global $assembly/json/JSON_NUMBER i32 (i32.const 2))
 (global $assembly/json/JSON_STRING i32 (i32.const 3))
 (global $assembly/json/JSON_ARRAY i32 (i32.const 4))
 (global $assembly/json/JSON_OBJECT i32 (i32.const 5))
 (global $assembly/session/MessageRole.System i32 (i32.const 0))
 (global $assembly/session/MessageRole.User i32 (i32.const 1))
 (global $assembly/session/MessageRole.Assistant i32 (i32.const 2))
 (global $assembly/session/MessageRole.Tool i32 (i32.const 3))
 (global $assembly/session/BLOCK_TEXT i32 (i32.const 0))
 (global $assembly/session/BLOCK_TOOL_USE i32 (i32.const 1))
 (global $assembly/session/BLOCK_TOOL_RESULT i32 (i32.const 2))
 (global $assembly/permissions/PermissionMode.ReadOnly i32 (i32.const 0))
 (global $assembly/permissions/PermissionMode.WorkspaceWrite i32 (i32.const 1))
 (global $assembly/permissions/PermissionMode.DangerFullAccess i32 (i32.const 2))
 (global $assembly/permissions/PermissionMode.Prompt i32 (i32.const 3))
 (global $assembly/permissions/PermissionMode.Allow i32 (i32.const 4))
 (global $assembly/sandbox/FilesystemIsolationMode.Off i32 (i32.const 0))
 (global $assembly/sandbox/FilesystemIsolationMode.WorkspaceOnly i32 (i32.const 1))
 (global $assembly/sandbox/FilesystemIsolationMode.AllowList i32 (i32.const 2))
 (global $assembly/config/CLAUDE_CODE_SETTINGS_SCHEMA_NAME i32 (i32.const 1056))
 (global $assembly/config/ConfigSource.User i32 (i32.const 0))
 (global $assembly/config/ConfigSource.Project i32 (i32.const 1))
 (global $assembly/config/ConfigSource.Local i32 (i32.const 2))
 (global $assembly/config/ResolvedPermissionMode.ReadOnly i32 (i32.const 0))
 (global $assembly/config/ResolvedPermissionMode.WorkspaceWrite i32 (i32.const 1))
 (global $assembly/config/ResolvedPermissionMode.DangerFullAccess i32 (i32.const 2))
 (global $assembly/config/McpTransport.Stdio i32 (i32.const 0))
 (global $assembly/config/McpTransport.Sse i32 (i32.const 1))
 (global $assembly/config/McpTransport.Http i32 (i32.const 2))
 (global $assembly/config/McpTransport.Ws i32 (i32.const 3))
 (global $assembly/config/McpTransport.Sdk i32 (i32.const 4))
 (global $assembly/config/McpTransport.ClaudeAiProxy i32 (i32.const 5))
 (global $assembly/hooks/HookEvent.PreToolUse i32 (i32.const 0))
 (global $assembly/hooks/HookEvent.PostToolUse i32 (i32.const 1))
 (global $assembly/conversation/EVENT_TEXT_DELTA i32 (i32.const 0))
 (global $assembly/conversation/EVENT_TOOL_USE i32 (i32.const 1))
 (global $assembly/conversation/EVENT_USAGE i32 (i32.const 2))
 (global $assembly/conversation/EVENT_MESSAGE_STOP i32 (i32.const 3))
 (global $assembly/commands/CommandSource.Builtin i32 (i32.const 0))
 (global $assembly/commands/CommandSource.InternalOnly i32 (i32.const 1))
 (global $assembly/commands/CommandSource.FeatureGated i32 (i32.const 2))
 (global $~lib/rt/itcms/total (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/threshold (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/state (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/visitCount (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/pinSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/iter (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/toSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/white (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/fromSpace (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $assembly/commands/SLASH_COMMAND_SPECS (mut i32) (i32.const 0))
 (global $assembly/bootstrap/BootstrapPhase.CliEntry i32 (i32.const 0))
 (global $assembly/bootstrap/BootstrapPhase.FastPathVersion i32 (i32.const 1))
 (global $assembly/bootstrap/BootstrapPhase.StartupProfiler i32 (i32.const 2))
 (global $assembly/bootstrap/BootstrapPhase.SystemPromptFastPath i32 (i32.const 3))
 (global $assembly/bootstrap/BootstrapPhase.ChromeMcpFastPath i32 (i32.const 4))
 (global $assembly/bootstrap/BootstrapPhase.DaemonWorkerFastPath i32 (i32.const 5))
 (global $assembly/bootstrap/BootstrapPhase.BridgeFastPath i32 (i32.const 6))
 (global $assembly/bootstrap/BootstrapPhase.DaemonFastPath i32 (i32.const 7))
 (global $assembly/bootstrap/BootstrapPhase.BackgroundSessionFastPath i32 (i32.const 8))
 (global $assembly/bootstrap/BootstrapPhase.TemplateFastPath i32 (i32.const 9))
 (global $assembly/bootstrap/BootstrapPhase.EnvironmentRunnerFastPath i32 (i32.const 10))
 (global $assembly/bootstrap/BootstrapPhase.MainRuntime i32 (i32.const 11))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 20032))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 52884))
 (memory $0 1)
 (data $0 (i32.const 1036) ",")
 (data $0.1 (i32.const 1048) "\02\00\00\00\1c\00\00\00S\00e\00t\00t\00i\00n\00g\00s\00S\00c\00h\00e\00m\00a")
 (data $1 (i32.const 1084) "\1c")
 (data $1.1 (i32.const 1096) "\02\00\00\00\04\00\00\00r\00s")
 (data $2 (i32.const 1116) "\1c")
 (data $2.1 (i32.const 1128) "\02\00\00\00\04\00\00\00t\00s")
 (data $3 (i32.const 1148) "\1c")
 (data $3.1 (i32.const 1160) "\02\00\00\00\06\00\00\00t\00s\00x")
 (data $4 (i32.const 1180) "\1c")
 (data $4.1 (i32.const 1192) "\02\00\00\00\04\00\00\00j\00s")
 (data $5 (i32.const 1212) "\1c")
 (data $5.1 (i32.const 1224) "\02\00\00\00\08\00\00\00j\00s\00o\00n")
 (data $6 (i32.const 1244) "\1c")
 (data $6.1 (i32.const 1256) "\02\00\00\00\04\00\00\00m\00d")
 (data $7 (i32.const 1276) ",")
 (data $7.1 (i32.const 1288) "\01\00\00\00\18\00\00\00P\04\00\00p\04\00\00\90\04\00\00\b0\04\00\00\d0\04\00\00\f0\04")
 (data $8 (i32.const 1324) ",")
 (data $8.1 (i32.const 1336) "\04\00\00\00\10\00\00\00\10\05\00\00\10\05\00\00\18\00\00\00\06")
 (data $9 (i32.const 1372) "<")
 (data $9.1 (i32.const 1384) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $10 (i32.const 1436) "<")
 (data $10.1 (i32.const 1448) "\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00r\00t\00/\00i\00t\00c\00m\00s\00.\00t\00s")
 (data $13 (i32.const 1564) "<")
 (data $13.1 (i32.const 1576) "\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $14 (i32.const 1628) ",")
 (data $14.1 (i32.const 1640) "\02\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s")
 (data $16 (i32.const 1708) "<")
 (data $16.1 (i32.const 1720) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s")
 (data $17 (i32.const 1772) "\1c")
 (data $17.1 (i32.const 1784) "\02\00\00\00\08\00\00\00h\00e\00l\00p")
 (data $18 (i32.const 1804) "L")
 (data $18.1 (i32.const 1816) "\02\00\00\00:\00\00\00S\00h\00o\00w\00 \00a\00v\00a\00i\00l\00a\00b\00l\00e\00 \00s\00l\00a\00s\00h\00 \00c\00o\00m\00m\00a\00n\00d\00s")
 (data $19 (i32.const 1884) "\1c")
 (data $19.1 (i32.const 1896) "\02")
 (data $20 (i32.const 1916) "\1c")
 (data $20.1 (i32.const 1928) "\02\00\00\00\0c\00\00\00s\00t\00a\00t\00u\00s")
 (data $21 (i32.const 1948) "L")
 (data $21.1 (i32.const 1960) "\02\00\00\006\00\00\00S\00h\00o\00w\00 \00c\00u\00r\00r\00e\00n\00t\00 \00s\00e\00s\00s\00i\00o\00n\00 \00s\00t\00a\00t\00u\00s")
 (data $22 (i32.const 2028) ",")
 (data $22.1 (i32.const 2040) "\02\00\00\00\0e\00\00\00c\00o\00m\00p\00a\00c\00t")
 (data $23 (i32.const 2076) "L")
 (data $23.1 (i32.const 2088) "\02\00\00\00:\00\00\00C\00o\00m\00p\00a\00c\00t\00 \00l\00o\00c\00a\00l\00 \00s\00e\00s\00s\00i\00o\00n\00 \00h\00i\00s\00t\00o\00r\00y")
 (data $24 (i32.const 2156) "\1c")
 (data $24.1 (i32.const 2168) "\02\00\00\00\n\00\00\00m\00o\00d\00e\00l")
 (data $25 (i32.const 2188) "\\")
 (data $25.1 (i32.const 2200) "\02\00\00\00>\00\00\00S\00h\00o\00w\00 \00o\00r\00 \00s\00w\00i\00t\00c\00h\00 \00t\00h\00e\00 \00a\00c\00t\00i\00v\00e\00 \00m\00o\00d\00e\00l")
 (data $26 (i32.const 2284) ",")
 (data $26.1 (i32.const 2296) "\02\00\00\00\0e\00\00\00[\00m\00o\00d\00e\00l\00]")
 (data $27 (i32.const 2332) ",")
 (data $27.1 (i32.const 2344) "\02\00\00\00\16\00\00\00p\00e\00r\00m\00i\00s\00s\00i\00o\00n\00s")
 (data $28 (i32.const 2380) "l")
 (data $28.1 (i32.const 2392) "\02\00\00\00R\00\00\00S\00h\00o\00w\00 \00o\00r\00 \00s\00w\00i\00t\00c\00h\00 \00t\00h\00e\00 \00a\00c\00t\00i\00v\00e\00 \00p\00e\00r\00m\00i\00s\00s\00i\00o\00n\00 \00m\00o\00d\00e")
 (data $29 (i32.const 2492) "l")
 (data $29.1 (i32.const 2504) "\02\00\00\00\\\00\00\00[\00r\00e\00a\00d\00-\00o\00n\00l\00y\00|\00w\00o\00r\00k\00s\00p\00a\00c\00e\00-\00w\00r\00i\00t\00e\00|\00d\00a\00n\00g\00e\00r\00-\00f\00u\00l\00l\00-\00a\00c\00c\00e\00s\00s\00]")
 (data $30 (i32.const 2604) "\1c")
 (data $30.1 (i32.const 2616) "\02\00\00\00\n\00\00\00c\00l\00e\00a\00r")
 (data $31 (i32.const 2636) "L")
 (data $31.1 (i32.const 2648) "\02\00\00\006\00\00\00S\00t\00a\00r\00t\00 \00a\00 \00f\00r\00e\00s\00h\00 \00l\00o\00c\00a\00l\00 \00s\00e\00s\00s\00i\00o\00n")
 (data $32 (i32.const 2716) ",")
 (data $32.1 (i32.const 2728) "\02\00\00\00\16\00\00\00[\00-\00-\00c\00o\00n\00f\00i\00r\00m\00]")
 (data $33 (i32.const 2764) "\1c")
 (data $33.1 (i32.const 2776) "\02\00\00\00\08\00\00\00c\00o\00s\00t")
 (data $34 (i32.const 2796) "l")
 (data $34.1 (i32.const 2808) "\02\00\00\00X\00\00\00S\00h\00o\00w\00 \00c\00u\00m\00u\00l\00a\00t\00i\00v\00e\00 \00t\00o\00k\00e\00n\00 \00u\00s\00a\00g\00e\00 \00f\00o\00r\00 \00t\00h\00i\00s\00 \00s\00e\00s\00s\00i\00o\00n")
 (data $35 (i32.const 2908) "\1c")
 (data $35.1 (i32.const 2920) "\02\00\00\00\0c\00\00\00r\00e\00s\00u\00m\00e")
 (data $36 (i32.const 2940) "\\")
 (data $36.1 (i32.const 2952) "\02\00\00\00D\00\00\00L\00o\00a\00d\00 \00a\00 \00s\00a\00v\00e\00d\00 \00s\00e\00s\00s\00i\00o\00n\00 \00i\00n\00t\00o\00 \00t\00h\00e\00 \00R\00E\00P\00L")
 (data $37 (i32.const 3036) ",")
 (data $37.1 (i32.const 3048) "\02\00\00\00\1c\00\00\00<\00s\00e\00s\00s\00i\00o\00n\00-\00p\00a\00t\00h\00>")
 (data $38 (i32.const 3084) "\1c")
 (data $38.1 (i32.const 3096) "\02\00\00\00\0c\00\00\00c\00o\00n\00f\00i\00g")
 (data $39 (i32.const 3116) "l")
 (data $39.1 (i32.const 3128) "\02\00\00\00\\\00\00\00I\00n\00s\00p\00e\00c\00t\00 \00C\00l\00a\00u\00d\00e\00 \00c\00o\00n\00f\00i\00g\00 \00f\00i\00l\00e\00s\00 \00o\00r\00 \00m\00e\00r\00g\00e\00d\00 \00s\00e\00c\00t\00i\00o\00n\00s")
 (data $40 (i32.const 3228) "<")
 (data $40.1 (i32.const 3240) "\02\00\00\00\"\00\00\00[\00e\00n\00v\00|\00h\00o\00o\00k\00s\00|\00m\00o\00d\00e\00l\00]")
 (data $41 (i32.const 3292) "\1c")
 (data $41.1 (i32.const 3304) "\02\00\00\00\0c\00\00\00m\00e\00m\00o\00r\00y")
 (data $42 (i32.const 3324) "l")
 (data $42.1 (i32.const 3336) "\02\00\00\00\\\00\00\00I\00n\00s\00p\00e\00c\00t\00 \00l\00o\00a\00d\00e\00d\00 \00C\00l\00a\00u\00d\00e\00 \00i\00n\00s\00t\00r\00u\00c\00t\00i\00o\00n\00 \00m\00e\00m\00o\00r\00y\00 \00f\00i\00l\00e\00s")
 (data $43 (i32.const 3436) "\1c")
 (data $43.1 (i32.const 3448) "\02\00\00\00\08\00\00\00i\00n\00i\00t")
 (data $44 (i32.const 3468) "l")
 (data $44.1 (i32.const 3480) "\02\00\00\00P\00\00\00C\00r\00e\00a\00t\00e\00 \00a\00 \00s\00t\00a\00r\00t\00e\00r\00 \00C\00L\00A\00U\00D\00E\00.\00m\00d\00 \00f\00o\00r\00 \00t\00h\00i\00s\00 \00r\00e\00p\00o")
 (data $45 (i32.const 3580) "\1c")
 (data $45.1 (i32.const 3592) "\02\00\00\00\08\00\00\00d\00i\00f\00f")
 (data $46 (i32.const 3612) "l")
 (data $46.1 (i32.const 3624) "\02\00\00\00V\00\00\00S\00h\00o\00w\00 \00g\00i\00t\00 \00d\00i\00f\00f\00 \00f\00o\00r\00 \00c\00u\00r\00r\00e\00n\00t\00 \00w\00o\00r\00k\00s\00p\00a\00c\00e\00 \00c\00h\00a\00n\00g\00e\00s")
 (data $47 (i32.const 3724) ",")
 (data $47.1 (i32.const 3736) "\02\00\00\00\0e\00\00\00v\00e\00r\00s\00i\00o\00n")
 (data $48 (i32.const 3772) "\\")
 (data $48.1 (i32.const 3784) "\02\00\00\00L\00\00\00S\00h\00o\00w\00 \00C\00L\00I\00 \00v\00e\00r\00s\00i\00o\00n\00 \00a\00n\00d\00 \00b\00u\00i\00l\00d\00 \00i\00n\00f\00o\00r\00m\00a\00t\00i\00o\00n")
 (data $49 (i32.const 3868) ",")
 (data $49.1 (i32.const 3880) "\02\00\00\00\12\00\00\00b\00u\00g\00h\00u\00n\00t\00e\00r")
 (data $50 (i32.const 3916) "\\")
 (data $50.1 (i32.const 3928) "\02\00\00\00H\00\00\00I\00n\00s\00p\00e\00c\00t\00 \00t\00h\00e\00 \00c\00o\00d\00e\00b\00a\00s\00e\00 \00f\00o\00r\00 \00l\00i\00k\00e\00l\00y\00 \00b\00u\00g\00s")
 (data $51 (i32.const 4012) ",")
 (data $51.1 (i32.const 4024) "\02\00\00\00\0e\00\00\00[\00s\00c\00o\00p\00e\00]")
 (data $52 (i32.const 4060) "\1c")
 (data $52.1 (i32.const 4072) "\02\00\00\00\0c\00\00\00c\00o\00m\00m\00i\00t")
 (data $53 (i32.const 4092) "|")
 (data $53.1 (i32.const 4104) "\02\00\00\00b\00\00\00G\00e\00n\00e\00r\00a\00t\00e\00 \00a\00 \00c\00o\00m\00m\00i\00t\00 \00m\00e\00s\00s\00a\00g\00e\00 \00a\00n\00d\00 \00c\00r\00e\00a\00t\00e\00 \00a\00 \00g\00i\00t\00 \00c\00o\00m\00m\00i\00t")
 (data $54 (i32.const 4220) "\1c")
 (data $54.1 (i32.const 4232) "\02\00\00\00\04\00\00\00p\00r")
 (data $55 (i32.const 4252) "|")
 (data $55.1 (i32.const 4264) "\02\00\00\00h\00\00\00D\00r\00a\00f\00t\00 \00o\00r\00 \00c\00r\00e\00a\00t\00e\00 \00a\00 \00p\00u\00l\00l\00 \00r\00e\00q\00u\00e\00s\00t\00 \00f\00r\00o\00m\00 \00t\00h\00e\00 \00c\00o\00n\00v\00e\00r\00s\00a\00t\00i\00o\00n")
 (data $56 (i32.const 4380) ",")
 (data $56.1 (i32.const 4392) "\02\00\00\00\12\00\00\00[\00c\00o\00n\00t\00e\00x\00t\00]")
 (data $57 (i32.const 4428) "\1c")
 (data $57.1 (i32.const 4440) "\02\00\00\00\n\00\00\00i\00s\00s\00u\00e")
 (data $58 (i32.const 4460) "|")
 (data $58.1 (i32.const 4472) "\02\00\00\00h\00\00\00D\00r\00a\00f\00t\00 \00o\00r\00 \00c\00r\00e\00a\00t\00e\00 \00a\00 \00G\00i\00t\00H\00u\00b\00 \00i\00s\00s\00u\00e\00 \00f\00r\00o\00m\00 \00t\00h\00e\00 \00c\00o\00n\00v\00e\00r\00s\00a\00t\00i\00o\00n")
 (data $59 (i32.const 4588) ",")
 (data $59.1 (i32.const 4600) "\02\00\00\00\12\00\00\00u\00l\00t\00r\00a\00p\00l\00a\00n")
 (data $60 (i32.const 4636) "|")
 (data $60.1 (i32.const 4648) "\02\00\00\00h\00\00\00R\00u\00n\00 \00a\00 \00d\00e\00e\00p\00 \00p\00l\00a\00n\00n\00i\00n\00g\00 \00p\00r\00o\00m\00p\00t\00 \00w\00i\00t\00h\00 \00m\00u\00l\00t\00i\00-\00s\00t\00e\00p\00 \00r\00e\00a\00s\00o\00n\00i\00n\00g")
 (data $61 (i32.const 4764) "\1c")
 (data $61.1 (i32.const 4776) "\02\00\00\00\0c\00\00\00[\00t\00a\00s\00k\00]")
 (data $62 (i32.const 4796) ",")
 (data $62.1 (i32.const 4808) "\02\00\00\00\10\00\00\00t\00e\00l\00e\00p\00o\00r\00t")
 (data $63 (i32.const 4844) "|")
 (data $63.1 (i32.const 4856) "\02\00\00\00f\00\00\00J\00u\00m\00p\00 \00t\00o\00 \00a\00 \00f\00i\00l\00e\00 \00o\00r\00 \00s\00y\00m\00b\00o\00l\00 \00b\00y\00 \00s\00e\00a\00r\00c\00h\00i\00n\00g\00 \00t\00h\00e\00 \00w\00o\00r\00k\00s\00p\00a\00c\00e")
 (data $64 (i32.const 4972) "<")
 (data $64.1 (i32.const 4984) "\02\00\00\00 \00\00\00<\00s\00y\00m\00b\00o\00l\00-\00o\00r\00-\00p\00a\00t\00h\00>")
 (data $65 (i32.const 5036) "<")
 (data $65.1 (i32.const 5048) "\02\00\00\00\1e\00\00\00d\00e\00b\00u\00g\00-\00t\00o\00o\00l\00-\00c\00a\00l\00l")
 (data $66 (i32.const 5100) "l")
 (data $66.1 (i32.const 5112) "\02\00\00\00X\00\00\00R\00e\00p\00l\00a\00y\00 \00t\00h\00e\00 \00l\00a\00s\00t\00 \00t\00o\00o\00l\00 \00c\00a\00l\00l\00 \00w\00i\00t\00h\00 \00d\00e\00b\00u\00g\00 \00d\00e\00t\00a\00i\00l\00s")
 (data $67 (i32.const 5212) "\1c")
 (data $67.1 (i32.const 5224) "\02\00\00\00\0c\00\00\00e\00x\00p\00o\00r\00t")
 (data $68 (i32.const 5244) "l")
 (data $68.1 (i32.const 5256) "\02\00\00\00R\00\00\00E\00x\00p\00o\00r\00t\00 \00t\00h\00e\00 \00c\00u\00r\00r\00e\00n\00t\00 \00c\00o\00n\00v\00e\00r\00s\00a\00t\00i\00o\00n\00 \00t\00o\00 \00a\00 \00f\00i\00l\00e")
 (data $69 (i32.const 5356) "\1c")
 (data $69.1 (i32.const 5368) "\02\00\00\00\0c\00\00\00[\00f\00i\00l\00e\00]")
 (data $70 (i32.const 5388) ",")
 (data $70.1 (i32.const 5400) "\02\00\00\00\0e\00\00\00s\00e\00s\00s\00i\00o\00n")
 (data $71 (i32.const 5436) "\\")
 (data $71.1 (i32.const 5448) "\02\00\00\00J\00\00\00L\00i\00s\00t\00 \00o\00r\00 \00s\00w\00i\00t\00c\00h\00 \00m\00a\00n\00a\00g\00e\00d\00 \00l\00o\00c\00a\00l\00 \00s\00e\00s\00s\00i\00o\00n\00s")
 (data $72 (i32.const 5532) "L")
 (data $72.1 (i32.const 5544) "\02\00\00\004\00\00\00[\00l\00i\00s\00t\00|\00s\00w\00i\00t\00c\00h\00 \00<\00s\00e\00s\00s\00i\00o\00n\00-\00i\00d\00>\00]")
 (data $73 (i32.const 5612) ",")
 (data $73.1 (i32.const 5624) "\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $74 (i32.const 5660) ",")
 (data $74.1 (i32.const 5672) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data $75 (i32.const 5708) "\12\10\13\14\15\16\17\18\19\1a\1b\1c\1d\1e\1f !\10\10\"\10\10\10#$%&\'()\10*+\10\10\10\10\10\10\10\10\10\10\10,-.\10/\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\100\10\10\101\10234567\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\108\10\109:\10;<=\10\10\10\10\10\10>\10\10?@ABCDEFGHIJKL\10MNO\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10P\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10QR\10\10\10S\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10T\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10UV\10\10\10\10\10\10\10W\10\10\10\10\10XYZ\10\10\10\10\10[\\\10\10\10\10\10\10\10\10\10]\10\10\10\10\10\10\10\10\10\10\10\10")
 (data $75.1 (i32.const 6252) "\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\00\00\00\00\80@\00\04\00\00\00@\01\00\00\00\00\00\00\00\00\a1\90\01")
 (data $75.2 (i32.const 6338) "\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff0\04\b0")
 (data $75.3 (i32.const 6396) "\f8\03")
 (data $75.4 (i32.const 6423) "\82\00\00\00\00\00\00\fe\ff\ff\ff\ff\bf\b6\00\00\00\00\00\10\00?\00\ff\17\00\00\00\00\01\f8\ff\ff\00\00\01")
 (data $75.5 (i32.const 6470) "\c0\bf\ff=\00\00\00\80\02\00\00\00\ff\ff\ff\07")
 (data $75.6 (i32.const 6496) "\c0\ff\01\00\00\00\00\00\00\f8?$\00\00\c0\ff\ff?\00\00\00\00\00\0e")
 (data $75.7 (i32.const 6534) "\f8\ff\ff\ff\ff\ff\07\00\00\00\00\00\00\14\fe!\fe\00\0c\00\02\00\02\00\00\00\00\00\00\10\1e \00\00\0c\00\00@\06\00\00\00\00\00\00\10\869\02\00\00\00#\00\06\00\00\00\00\00\00\10\be!\00\00\0c\00\00\fc\02\00\00\00\00\00\00\90\1e `\00\0c\00\00\00\04\00\00\00\00\00\00\00\01 \00\00\00\00\00\00\11\00\00\00\00\00\00\c0\c1=`\00\0c\00\00\00\02\00\00\00\00\00\00\90@0\00\00\0c\00\00\00\03\00\00\00\00\00\00\18\1e \00\00\0c\00\00\00\02\00\00\00\00\00\00\00\00\04\\")
 (data $75.8 (i32.const 6706) "\f2\07\c0\7f")
 (data $75.9 (i32.const 6722) "\f2\1f@?")
 (data $75.10 (i32.const 6735) "\03\00\00\a0\02\00\00\00\00\00\00\fe\7f\df\e0\ff\fe\ff\ff\ff\1f@")
 (data $75.11 (i32.const 6769) "\e0\fdf\00\00\00\c3\01\00\1e\00d \00 ")
 (data $75.12 (i32.const 6795) "\10")
 (data $75.13 (i32.const 6807) "\e0")
 (data $75.14 (i32.const 6830) "\1c\00\00\00\1c\00\00\00\0c\00\00\00\0c\00\00\00\00\00\00\00\b0?@\fe\8f \00\00\00\00\00x\00\00\00\00\00\00\08\00\00\00\00\00\00\00`\00\00\00\00\02")
 (data $75.15 (i32.const 6896) "\87\01\04\0e")
 (data $75.16 (i32.const 6926) "\80\t\00\00\00\00\00\00@\7f\e5\1f\f8\9f\00\00\00\00\80\00\ff\ff\01\00\00\00\00\00\00\00\0f\00\00\00\00\00\d0\17\04\00\00\00\00\f8\0f\00\03\00\00\00<;\00\00\00\00\00\00@\a3\03\00\00\00\00\00\00\f0\cf\00\00\00\00\00\00\00\00?")
 (data $75.17 (i32.const 7014) "\f7\ff\fd!\10\03\00\00\00\00\00\f0\ff\ff\ff\ff\ff\ff\ff\07\00\01\00\00\00\f8\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\fb")
 (data $75.18 (i32.const 7075) "\a0\03\e0\00\e0\00\e0\00`\00\f8\00\03\90|\00\00\00\00\00\00\df\ff\02\80\00\00\ff\1f\00\00\00\00\00\00\ff\ff\ff\ff\01")
 (data $75.19 (i32.const 7131) "0")
 (data $75.20 (i32.const 7145) "\80\03")
 (data $75.21 (i32.const 7161) "\80\00\80")
 (data $75.22 (i32.const 7176) "\ff\ff\ff\ff\00\00\00\00\00\80")
 (data $75.23 (i32.const 7212) " \00\00\00\00<>\08")
 (data $75.24 (i32.const 7231) "~")
 (data $75.25 (i32.const 7243) "p\00\00 ")
 (data $75.26 (i32.const 7307) "?\00\10")
 (data $75.27 (i32.const 7321) "\80\f7\bf\00\00\00\f0")
 (data $75.28 (i32.const 7338) "\03\00\ff\ff\ff\ff\03")
 (data $75.29 (i32.const 7354) "\01\00\00\07")
 (data $75.30 (i32.const 7371) "\03D\08\00\00`\10")
 (data $75.31 (i32.const 7396) "0\00\00\00\ff\ff\03\80\00\00\00\00\c0?\00\00\80\ff\03\00\00\00\00\00\07\00\00\00\00\00\c83\00\80\00\00`\00\00\00\00\00\00\00\00~f\00\08\10\00\00\00\00\01\10\00\00\00\00\00\00\9d\c1\02\00\00 \000X")
 (data $75.32 (i32.const 7479) "\f8\00\0e")
 (data $75.33 (i32.const 7496) " !\00\00\00\00\00@")
 (data $75.34 (i32.const 7522) "\fc\ff\03\00\00\00\00\00\00\00\ff\ff\08\00\ff\ff\00\00\00\00$")
 (data $75.35 (i32.const 7563) "\80\80@\00\04\00\00\00@\01\00\00\00\00\00\01\00\00\00\00\c0\00\00\00\00\00\00\00\00\08\00\00\0e")
 (data $75.36 (i32.const 7627) " ")
 (data $75.37 (i32.const 7656) "\01")
 (data $75.38 (i32.const 7674) "\c0\07")
 (data $75.39 (i32.const 7692) "n\f0\00\00\00\00\00\87")
 (data $75.40 (i32.const 7720) "`\00\00\00\00\00\00\00\f0")
 (data $75.41 (i32.const 7777) "\18")
 (data $75.42 (i32.const 7796) "\c0\ff\01")
 (data $75.43 (i32.const 7820) "\02\00\00\00\00\00\00\ff\7f\00\00\00\00\00\00\80\03\00\00\00\00\00x&\00 \00\00\00\00\00\00\07\00\00\00\80\ef\1f\00\00\00\00\00\00\00\08\00\03\00\00\00\00\00\c0\7f\00\9e")
 (data $75.44 (i32.const 7889) "\80\d3@")
 (data $75.45 (i32.const 7911) "\80\f8\07\00\00\03\00\00\00\00\00\00\18\01\00\00\00\c0\1f\1f")
 (data $75.46 (i32.const 7955) "\ff\\\00\00@")
 (data $75.47 (i32.const 7970) "\f8\85\r")
 (data $75.48 (i32.const 8002) "<\b0\01\00\000")
 (data $75.49 (i32.const 8018) "\f8\a7\01")
 (data $75.50 (i32.const 8033) "(\bf")
 (data $75.51 (i32.const 8047) "\e0\bc\0f")
 (data $75.52 (i32.const 8081) "\80\ff\06")
 (data $75.53 (i32.const 8115) "X\08")
 (data $75.54 (i32.const 8134) "\f0\0c\01\00\00\00\fe\07\00\00\00\00\f8y\80\00~\0e\00\00\00\00\00\fc\7f\03")
 (data $75.55 (i32.const 8178) "\7f\bf")
 (data $75.56 (i32.const 8190) "\fc\ff\ff\fcm")
 (data $75.57 (i32.const 8210) "~\b4\bf")
 (data $75.58 (i32.const 8222) "\a3")
 (data $75.59 (i32.const 8266) "\18\00\00\00\00\00\00\00\ff\01")
 (data $75.60 (i32.const 8330) "\1f\00\00\00\00\00\00\00\7f\00\0f")
 (data $75.61 (i32.const 8373) "\80\00\00\00\00\00\00\00\80\ff\ff\00\00\00\00\00\00\00\00\1b")
 (data $75.62 (i32.const 8415) "`\0f")
 (data $75.63 (i32.const 8440) "\80\03\f8\ff\e7\0f\00\00\00<")
 (data $75.64 (i32.const 8468) "\1c")
 (data $75.65 (i32.const 8492) "\ff\ff\ff\ff\ff\ff\7f\f8\ff\ff\ff\ff\ff\1f \00\10\00\00\f8\fe\ff")
 (data $75.66 (i32.const 8524) "\7f\ff\ff\f9\db\07")
 (data $75.67 (i32.const 8562) "\ff?")
 (data $75.68 (i32.const 8617) "\f0")
 (data $75.69 (i32.const 8646) "\7f")
 (data $75.70 (i32.const 8660) "\f0\0f")
 (data $75.71 (i32.const 8715) "\f8")
 (data $76 (i32.const 8716) "\12\13\14\15\16\17\10\10\10\10\10\10\10\10\10\10\18\10\10\19\10\10\10\10\10\10\10\10\1a\1b\11\1c\1d\1e\10\10\1f\10\10\10\10\10\10\10 !\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\"#\10\10\10$\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10%\10\10\10&\10\10\10\10\'\10\10\10\10\10\10\10(\10\10\10\10\10\10\10\10\10\10\10)\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10*\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10+,-.\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10/\10\10\10\10\10\10\100\10\10\10\10\10\10\10\10\10\10\10\10\10\10")
 (data $76.1 (i32.const 9260) "\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\00\00\00\00\00\00\00\00\fe\ff\ff\07\fe\ff\ff\07\00\00\00\00\00\04 \04\ff\ff\7f\ff\ff\ff\7f\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\f7\f0\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ef\ff\ff\ff\ff\01\03\00\00\00\1f")
 (data $76.2 (i32.const 9396) " \00\00\00\00\00\cf\bc@\d7\ff\ff\fb\ff\ff\ff\ff\ff\ff\ff\ff\ff\bf\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\03\fc\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\fe\ff\ff\ff\7f\00\ff\ff\ff\ff\ff\01")
 (data $76.3 (i32.const 9504) "\ff\ff\ff\ff\bf \ff\ff\ff\ff\ff\e7")
 (data $76.4 (i32.const 9536) "\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff??")
 (data $76.5 (i32.const 9564) "\ff\01\ff\ff\ff\ff\ff\e7\00\00\00\00\00\00\00\00\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\00\00\00\00\00\00\00\00\ff\ff??\ff\ff\ff\ff??\ff\aa\ff\ff\ff?\ff\ff\ff\ff\ff\ff\df_\dc\1f\cf\0f\ff\1f\dc\1f")
 (data $76.6 (i32.const 9658) "\02\80\00\00\ff\1f")
 (data $76.7 (i32.const 9676) "\84\fc/>P\bd\1f\f2\e0C\00\00\ff\ff\ff\ff\18")
 (data $76.8 (i32.const 9730) "\c0\ff\ff\ff\ff\ff\ff\03\00\00\ff\ff\ff\ff\ff\7f\ff\ff\ff\ff\ff\7f\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\1fx\0c\00\ff\ff\ff\ff\bf ")
 (data $76.9 (i32.const 9812) "\ff\ff\ff\ff\ff?\00\00\ff\ff\ff?")
 (data $76.10 (i32.const 9840) "\fc\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ffx\ff\ff\ff\ff\ff\ff\fc\07\00\00\00\00`\07\00\00\00\00\00\00\ff\ff\ff\ff\ff\f7\ff\01\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\00\00\00\00\00\00\00\00\7f\00\f8")
 (data $76.11 (i32.const 9936) "\fe\ff\ff\07\fe\ff\ff\07")
 (data $76.12 (i32.const 9964) "\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff")
 (data $76.13 (i32.const 9986) "\ff\ff\ff\ff\0f\ff\ff\ff\ff\0f")
 (data $76.14 (i32.const 10012) "\ff\ff\ff\ff\ff\ff\07\00\ff\ff\ff\ff\ff\ff\07")
 (data $76.15 (i32.const 10048) "\ff\ff\ff\ff\ff\ff\ff\ff")
 (data $76.16 (i32.const 10068) "\ff\ff\ff\ff\ff\ff\ff\ff")
 (data $76.17 (i32.const 10092) "\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\df\ff\ff\ff\ff\ff\ff\ff\ff\dfd\de\ff\eb\ef\ff\ff\ff\ff\ff\ff\ff\bf\e7\df\df\ff\ff\ff{_\fc\fd\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff?\ff\ff\ff\fd\ff\ff\f7\ff\ff\ff\f7\ff\ff\df\ff\ff\ff\df\ff\ff\7f\ff\ff\ff\7f\ff\ff\ff\fd\ff\ff\ff\fd\ff\ff\f7\0f\00\00\00\00\00\00\ff\ff\ff\ff\ff\ff\ff\ff\0f")
 (data $76.18 (i32.const 10258) "\ff\ff\ff\03\ff\ff\ff\03\ff\ff\ff\03")
 (data $77 (i32.const 10284) "\07\08\t\n\0b\0c\06\06\06\06\06\06\06\06\06\06\r\06\06\0e\06\06\06\06\06\06\06\06\0f\10\11\12\06\13\06\06\06\06\06\06\06\06\06\06\14\15\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\16\17\06\06\06\18\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\19\06\06\06\06\1a\06\06\06\06\06\06\06\1b\06\06\06\06\06\06\06\06\06\06\06\1c\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\1d\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\1e\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06")
 (data $77.1 (i32.const 10907) "$++++++++\01\00TVVVVVVVV")
 (data $77.2 (i32.const 10946) "\18\00\00\00+++++++\07++[VVVVVVVJVV\051P1P1P1P1P1P1P1P$Py1P1P18P1P1P1P1P1P1P1PN1\02N\r\rN\03N\00$n\00N1&nQN$PN9\14\81\1b\1d\1dS1P1P\r1P1P1P\1bS$P1\02\\{\\{\\{\\{\\{\14y\\{\\{\\-+I\03H\03x\\{\14\00\96\n\01+(\06\06\00*\06**+\07\bb\b5+\1e\00+\07+++\01++++++++++++++++++++++++++++++++\01+++++++++++++++++++++++*+++++++++++++\cdF\cd+\00%+\07\01\06\01UVVVVVUVV\02$\81\81\81\81\81\15\81\81\81\00\00+\00\b2\d1\b2\d1\b2\d1\b2\d1\00\00\cd\cc\01\00\d7\d7\d7\d7\d7\83\81\81\81\81\81\81\81\81\81\81\ac\ac\ac\ac\ac\ac\ac\ac\ac\ac\1c\00\00\00\00\001P1P1P1P1P1\02\00\001P1P1P1P1P1P1P1P1PN1P1PN1P1P1P1P1P1P1P1\02\87\a6\87\a6\87\a6\87\a6\87\a6\87\a6\87\a6\87\a6*++++++++++++\00\00\00TVVVVVVVVVVVV")
 (data $77.3 (i32.const 11455) "TVVVVVVVVVVVV\0c\00\0c*+++++++++++++\07*\01")
 (data $77.4 (i32.const 11541) "*++++++++++++++++++++++++++VVl\81\15\00++++++++++++++++++++++++++++++++++++++++++\07l\03A++VVVVVVVVVVVVVV,V+++++++++++++++++++++\01")
 (data $77.5 (i32.const 11700) "\0cl\00\00\00\00\00\06")
 (data $77.6 (i32.const 11746) "\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%Vz\9e&\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06\01++OVV,+\7fVV9++UVV++OVV,+\7fVV\817u[{\\++OVV\02\ac\04\00\009++UVV++OVV,++VV2\13\81W\00o\81~\c9\d7~-\81\81\0e~9\7foW\00\81\81~\15\00~\03++++++++++++\07+$+\97+++++++++*+++++VVVVV\80\81\81\81\819\bb*++++++++++++++++++++++++++++++++++++++++\01\81\81\81\81\81\81\81\81\81\81\81\81\81\81\81\c9\ac\ac\ac\ac\ac\ac\ac\ac\ac\ac\ac\ac\ac\ac\ac\d0\r\00N1\02\b4\c1\c1\d7\d7$P1P1P1P1P1P1P1P1P1P1P1P1P1P1P1P1P\d7\d7S\c1G\d4\d7\d7\d7\05++++++++++++\07\01\00\01")
 (data $77.7 (i32.const 12197) "N1P1P1P1P1P1P1P\r\00\00\00\00\00$P1P1P1P1P")
 (data $77.8 (i32.const 12262) "+++++++++++y\\{\\{O{\\{\\{\\{\\{\\{\\{\\{\\{\\{\\-++y\14\\{\\-y*\\\'\\{\\{\\{\a4\00\n\b4\\{\\{O\03x8+++++++++++++O-++\01")
 (data $77.9 (i32.const 12375) "H")
 (data $77.10 (i32.const 12385) "*++++++++++++++++++++++++++")
 (data $77.11 (i32.const 12445) "++++++++\07\00HVVVVVVVV\02")
 (data $77.12 (i32.const 12520) "+++++++++++++UVVVVVVVVVVVV\0e")
 (data $77.13 (i32.const 12578) "$+++++++++++\07\00VVVVVVVVVVVV")
 (data $77.14 (i32.const 12648) "$++++++++++++++++\07\00\00\00\00VVVVVVVVVVVVVVVVV")
 (data $77.15 (i32.const 12745) "*++++++++++VVVVVVVVVV\0e")
 (data $77.16 (i32.const 12799) "*++++++++++VVVVVVVVVV\0e")
 (data $77.17 (i32.const 12864) "+++++++++++UVVVVVVVVVV\0e")
 (data $78 (i32.const 12953) "\08\00\00V\01\00\009")
 (data $79 (i32.const 12968) "\01 \00\00\00\e0\ff\ff\00\bf\1d\00\00\e7\02\00\00y\00\00\02$\00\00\01\01\00\00\00\ff\ff\ff\00\00\00\00\01\02\00\00\00\fe\ff\ff\019\ff\ff\00\18\ff\ff\01\87\ff\ff\00\d4\fe\ff\00\c3\00\00\01\d2\00\00\01\ce\00\00\01\cd\00\00\01O\00\00\01\ca\00\00\01\cb\00\00\01\cf\00\00\00a\00\00\01\d3\00\00\01\d1\00\00\00\a3\00\00\01\d5\00\00\00\82\00\00\01\d6\00\00\01\da\00\00\01\d9\00\00\01\db\00\00\008\00\00\03\00\00\00\00\b1\ff\ff\01\9f\ff\ff\01\c8\ff\ff\02($\00\00\00\00\00\01\01\00\00\00\ff\ff\ff\003\ff\ff\00&\ff\ff\01~\ff\ff\01+*\00\01]\ff\ff\01(*\00\00?*\00\01=\ff\ff\01E\00\00\01G\00\00\00\1f*\00\00\1c*\00\00\1e*\00\00.\ff\ff\002\ff\ff\006\ff\ff\005\ff\ff\00O\a5\00\00K\a5\00\001\ff\ff\00(\a5\00\00D\a5\00\00/\ff\ff\00-\ff\ff\00\f7)\00\00A\a5\00\00\fd)\00\00+\ff\ff\00*\ff\ff\00\e7)\00\00C\a5\00\00*\a5\00\00\bb\ff\ff\00\'\ff\ff\00\b9\ff\ff\00%\ff\ff\00\15\a5\00\00\12\a5\00\02$L\00\00\00\00\00\01 \00\00\00\e0\ff\ff\01\01\00\00\00\ff\ff\ff\00T\00\00\01t\00\00\01&\00\00\01%\00\00\01@\00\00\01?\00\00\00\da\ff\ff\00\db\ff\ff\00\e1\ff\ff\00\c0\ff\ff\00\c1\ff\ff\01\08\00\00\00\c2\ff\ff\00\c7\ff\ff\00\d1\ff\ff\00\ca\ff\ff\00\f8\ff\ff\00\aa\ff\ff\00\b0\ff\ff\00\07\00\00\00\8c\ff\ff\01\c4\ff\ff\00\a0\ff\ff\01\f9\ff\ff\02\1ap\00\01\01\00\00\00\ff\ff\ff\01 \00\00\00\e0\ff\ff\01P\00\00\01\0f\00\00\00\f1\ff\ff\00\00\00\00\010\00\00\00\d0\ff\ff\01\01\00\00\00\ff\ff\ff\00\00\00\00\00\c0\0b\00\01`\1c\00\00\00\00\00\01\d0\97\00\01\08\00\00\00\f8\ff\ff\02\05\8a\00\00\00\00\00\01@\f4\ff\00\9e\e7\ff\00\c2\89\00\00\db\e7\ff\00\92\e7\ff\00\93\e7\ff\00\9c\e7\ff\00\9d\e7\ff\00\a4\e7\ff\00\00\00\00\008\8a\00\00\04\8a\00\00\e6\0e\00\01\01\00\00\00\ff\ff\ff\00\00\00\00\00\c5\ff\ff\01A\e2\ff\02\1d\8f\00\00\08\00\00\01\f8\ff\ff\00\00\00\00\00V\00\00\01\aa\ff\ff\00J\00\00\00d\00\00\00\80\00\00\00p\00\00\00~\00\00\00\t\00\00\01\b6\ff\ff\01\f7\ff\ff\00\db\e3\ff\01\9c\ff\ff\01\90\ff\ff\01\80\ff\ff\01\82\ff\ff\02\05\ac\00\00\00\00\00\01\10\00\00\00\f0\ff\ff\01\1c\00\00\01\01\00\00\01\a3\e2\ff\01A\df\ff\01\ba\df\ff\00\e4\ff\ff\02\0b\b1\00\01\01\00\00\00\ff\ff\ff\010\00\00\00\d0\ff\ff\00\00\00\00\01\t\d6\ff\01\1a\f1\ff\01\19\d6\ff\00\d5\d5\ff\00\d8\d5\ff\01\e4\d5\ff\01\03\d6\ff\01\e1\d5\ff\01\e2\d5\ff\01\c1\d5\ff\00\00\00\00\00\a0\e3\ff\00\00\00\00\01\01\00\00\00\ff\ff\ff\02\0c\bc\00\00\00\00\00\01\01\00\00\00\ff\ff\ff\01\bcZ\ff\01\a0\03\00\01\fcu\ff\01\d8Z\ff\000\00\00\01\b1Z\ff\01\b5Z\ff\01\bfZ\ff\01\eeZ\ff\01\d6Z\ff\01\ebZ\ff\01\d0\ff\ff\01\bdZ\ff\01\c8u\ff\00\00\00\00\000h\ff\00`\fc\ff\00\00\00\00\01 \00\00\00\e0\ff\ff\00\00\00\00\01(\00\00\00\d8\ff\ff\00\00\00\00\01@\00\00\00\c0\ff\ff\00\00\00\00\01 \00\00\00\e0\ff\ff\00\00\00\00\01 \00\00\00\e0\ff\ff\00\00\00\00\01\"\00\00\00\de\ff\ff")
 (data $80 (i32.const 13925) "\06\'Qow")
 (data $80.1 (i32.const 13940) "|\00\00\7f\00\00\00\00\00\00\00\00\83\8e\92\97\00\aa")
 (data $80.2 (i32.const 13968) "\b4\c4")
 (data $80.3 (i32.const 14090) "\c6\c9\00\00\00\db")
 (data $80.4 (i32.const 14179) "\de\00\00\00\00\e1\00\00\00\00\00\00\00\e4")
 (data $80.5 (i32.const 14204) "\e7")
 (data $80.6 (i32.const 14290) "\ea")
 (data $80.7 (i32.const 14413) "\ed")
 (data $81 (i32.const 14436) "0\0c1\rx\0e\7f\0f\80\10\81\11\86\12\89\13\8a\13\8e\14\8f\15\90\16\93\13\94\17\95\18\96\19\97\1a\9a\1b\9c\19\9d\1c\9e\1d\9f\1e\a6\1f\a9\1f\ae\1f\b1 \b2 \b7!\bf\"\c5#\c8#\cb#\dd$\f2#\f6%\f7& -:.=/>0?1@1C2D3E4P5Q6R7S8T9Y:[;\\<a=c>e?f@hAiBj@kClDoBqErFuG}H\82I\87J\89K\8aL\8bL\8cM\92N\9dO\9ePEW{\1d|\1d}\1d\7fX\86Y\88Z\89Z\8aZ\8c[\8e\\\8f\\\ac]\ad^\ae^\af^\c2_\cc`\cda\cea\cfb\d0c\d1d\d5e\d6f\d7g\f0h\f1i\f2j\f3k\f4l\f5m\f9n\fd-\fe-\ff-PiQiRiSiTiUiViWiXiYiZi[i\\i]i^i_i\82\00\83\00\84\00\85\00\86\00\87\00\88\00\89\00\c0u\cfv\80\89\81\8a\82\8b\85\8c\86\8dp\9dq\9dv\9ew\9ex\9fy\9fz\a0{\a0|\a1}\a1\b3\a2\ba\a3\bb\a3\bc\a4\be\a5\c3\a2\cc\a4\da\a6\db\a6\e5j\ea\a7\eb\a7\ecn\f3\a2\f8\a8\f9\a8\fa\a9\fb\a9\fc\a4&\b0*\b1+\b2N\b3\84\08b\bac\bbd\bce\bdf\bem\bfn\c0o\c1p\c2~\c3\7f\c3}\cf\8d\d0\94\d1\ab\d2\ac\d3\ad\d4\b0\d5\b1\d6\b2\d7\c4\d8\c5\d9\c6\da")
 (data $82 (i32.const 14844) "\1c")
 (data $82.1 (i32.const 14856) "\02\00\00\00\n\00\00\00h\00a\00i\00k\00u")
 (data $83 (i32.const 14876) "\1c")
 (data $83.1 (i32.const 14888) "\02\00\00\00\08\00\00\00o\00p\00u\00s")
 (data $84 (i32.const 14908) "\1c")
 (data $84.1 (i32.const 14920) "\02\00\00\00\0c\00\00\00s\00o\00n\00n\00e\00t")
 (data $85 (i32.const 14940) "|")
 (data $85.1 (i32.const 14952) "\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006")
 (data $86 (i32.const 15068) "<")
 (data $86.1 (i32.const 15080) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s")
 (data $87 (i32.const 15132) "\1c")
 (data $87.1 (i32.const 15144) "\02\00\00\00\02\00\00\000")
 (data $88 (i32.const 15164) "\\")
 (data $88.1 (i32.const 15176) "\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z")
 (data $89 (i32.const 15260) "\1c")
 (data $89.1 (i32.const 15272) "\02\00\00\00\02\00\00\00$")
 (data $90 (i32.const 15292) "\1c")
 (data $90.1 (i32.const 15304) "\02\00\00\00\02\00\00\00.")
 (data $91 (i32.const 15324) "\1c")
 (data $91.1 (i32.const 15336) "\02\00\00\00\0c\00\00\00s\00y\00s\00t\00e\00m")
 (data $92 (i32.const 15356) "\1c")
 (data $92.1 (i32.const 15368) "\02\00\00\00\08\00\00\00u\00s\00e\00r")
 (data $93 (i32.const 15388) ",")
 (data $93.1 (i32.const 15400) "\02\00\00\00\12\00\00\00a\00s\00s\00i\00s\00t\00a\00n\00t")
 (data $94 (i32.const 15436) "\1c")
 (data $94.1 (i32.const 15448) "\02\00\00\00\08\00\00\00t\00o\00o\00l")
 (data $95 (i32.const 15468) ",")
 (data $95.1 (i32.const 15480) "\02\00\00\00\0e\00\00\00u\00n\00k\00n\00o\00w\00n")
 (data $96 (i32.const 15516) "L")
 (data $96.1 (i32.const 15528) "\02\00\00\004\00\00\00u\00n\00s\00u\00p\00p\00o\00r\00t\00e\00d\00 \00m\00e\00s\00s\00a\00g\00e\00 \00r\00o\00l\00e\00:\00 ")
 (data $97 (i32.const 15596) "<")
 (data $97.1 (i32.const 15608) "\02\00\00\00&\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00s\00e\00s\00s\00i\00o\00n\00.\00t\00s")
 (data $98 (i32.const 15660) ",")
 (data $98.1 (i32.const 15672) "\02\00\00\00\12\00\00\00r\00e\00a\00d\00-\00o\00n\00l\00y")
 (data $99 (i32.const 15708) "<")
 (data $99.1 (i32.const 15720) "\02\00\00\00\1e\00\00\00w\00o\00r\00k\00s\00p\00a\00c\00e\00-\00w\00r\00i\00t\00e")
 (data $100 (i32.const 15772) "<")
 (data $100.1 (i32.const 15784) "\02\00\00\00$\00\00\00d\00a\00n\00g\00e\00r\00-\00f\00u\00l\00l\00-\00a\00c\00c\00e\00s\00s")
 (data $101 (i32.const 15836) "\1c")
 (data $101.1 (i32.const 15848) "\02\00\00\00\0c\00\00\00p\00r\00o\00m\00p\00t")
 (data $102 (i32.const 15868) "\1c")
 (data $102.1 (i32.const 15880) "\02\00\00\00\n\00\00\00a\00l\00l\00o\00w")
 (data $103 (i32.const 15900) "\1c")
 (data $103.1 (i32.const 15912) "\02\00\00\00\06\00\00\00o\00f\00f")
 (data $104 (i32.const 15932) ",")
 (data $104.1 (i32.const 15944) "\02\00\00\00\1c\00\00\00w\00o\00r\00k\00s\00p\00a\00c\00e\00-\00o\00n\00l\00y")
 (data $105 (i32.const 15980) ",")
 (data $105.1 (i32.const 15992) "\02\00\00\00\14\00\00\00a\00l\00l\00o\00w\00-\00l\00i\00s\00t")
 (data $106 (i32.const 16028) "L")
 (data $106.1 (i32.const 16040) "\02\00\00\00:\00\00\00u\00n\00s\00u\00p\00p\00o\00r\00t\00e\00d\00 \00f\00i\00l\00e\00s\00y\00s\00t\00e\00m\00 \00m\00o\00d\00e\00:\00 ")
 (data $107 (i32.const 16108) "<")
 (data $107.1 (i32.const 16120) "\02\00\00\00&\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00s\00a\00n\00d\00b\00o\00x\00.\00t\00s")
 (data $108 (i32.const 16172) "|")
 (data $108.1 (i32.const 16184) "\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
 (data $109 (i32.const 16300) "|")
 (data $109.1 (i32.const 16312) "\02\00\00\00^\00\00\00U\00n\00e\00x\00p\00e\00c\00t\00e\00d\00 \00\'\00n\00u\00l\00l\00\'\00 \00(\00n\00o\00t\00 \00a\00s\00s\00i\00g\00n\00e\00d\00 \00o\00r\00 \00f\00a\00i\00l\00e\00d\00 \00c\00a\00s\00t\00)")
 (data $110 (i32.const 16428) "\1c")
 (data $110.1 (i32.const 16440) "\11\00\00\00\08\00\00\00\01")
 (data $111 (i32.const 16460) ",")
 (data $111.1 (i32.const 16472) "\02\00\00\00\12\00\00\00<\00s\00u\00m\00m\00a\00r\00y\00>")
 (data $112 (i32.const 16508) "<")
 (data $112.1 (i32.const 16520) "\02\00\00\00*\00\00\00C\00o\00n\00v\00e\00r\00s\00a\00t\00i\00o\00n\00 \00s\00u\00m\00m\00a\00r\00y\00:")
 (data $113 (i32.const 16572) ",")
 (data $113.1 (i32.const 16584) "\02\00\00\00\12\00\00\00-\00 \00S\00c\00o\00p\00e\00:\00 ")
 (data $114 (i32.const 16620) "\\")
 (data $114.1 (i32.const 16632) "\02\00\00\00D\00\00\00 \00e\00a\00r\00l\00i\00e\00r\00 \00m\00e\00s\00s\00a\00g\00e\00s\00 \00c\00o\00m\00p\00a\00c\00t\00e\00d\00 \00(\00u\00s\00e\00r\00=")
 (data $115 (i32.const 16716) ",")
 (data $115.1 (i32.const 16728) "\02\00\00\00\18\00\00\00,\00 \00a\00s\00s\00i\00s\00t\00a\00n\00t\00=")
 (data $116 (i32.const 16764) ",")
 (data $116.1 (i32.const 16776) "\02\00\00\00\0e\00\00\00,\00 \00t\00o\00o\00l\00=")
 (data $117 (i32.const 16812) "\1c")
 (data $117.1 (i32.const 16824) "\02\00\00\00\04\00\00\00)\00.")
 (data $118 (i32.const 16844) "<")
 (data $118.1 (i32.const 16856) "\02\00\00\00&\00\00\00-\00 \00T\00o\00o\00l\00s\00 \00m\00e\00n\00t\00i\00o\00n\00e\00d\00:\00 ")
 (data $119 (i32.const 16908) "\1c")
 (data $119.1 (i32.const 16920) "\02\00\00\00\04\00\00\00,\00 ")
 (data $120 (i32.const 16940) "\1c")
 (data $120.1 (i32.const 16952) "\02\00\00\00\02\00\00\00& ")
 (data $121 (i32.const 16972) "L")
 (data $121.1 (i32.const 16984) "\02\00\00\00.\00\00\00-\00 \00R\00e\00c\00e\00n\00t\00 \00u\00s\00e\00r\00 \00r\00e\00q\00u\00e\00s\00t\00s\00:")
 (data $122 (i32.const 17052) "\1c")
 (data $122.1 (i32.const 17064) "\02\00\00\00\08\00\00\00 \00 \00-\00 ")
 (data $123 (i32.const 17084) "\1c")
 (data $123.1 (i32.const 17096) "\02\00\00\00\08\00\00\00t\00o\00d\00o")
 (data $124 (i32.const 17116) "\1c")
 (data $124.1 (i32.const 17128) "\02\00\00\00\08\00\00\00n\00e\00x\00t")
 (data $125 (i32.const 17148) ",")
 (data $125.1 (i32.const 17160) "\02\00\00\00\0e\00\00\00p\00e\00n\00d\00i\00n\00g")
 (data $126 (i32.const 17196) ",")
 (data $126.1 (i32.const 17208) "\02\00\00\00\12\00\00\00f\00o\00l\00l\00o\00w\00 \00u\00p")
 (data $127 (i32.const 17244) ",")
 (data $127.1 (i32.const 17256) "\02\00\00\00\12\00\00\00r\00e\00m\00a\00i\00n\00i\00n\00g")
 (data $128 (i32.const 17292) "<")
 (data $128.1 (i32.const 17304) "\02\00\00\00\1e\00\00\00-\00 \00P\00e\00n\00d\00i\00n\00g\00 \00w\00o\00r\00k\00:")
 (data $129 (i32.const 17356) "\1c")
 (data $129.1 (i32.const 17368) "\02\00\00\00\02\00\00\00 ")
 (data $130 (i32.const 17388) "\1c")
 (data $130.1 (i32.const 17400) "\02\00\00\00\02\00\00\00/")
 (data $131 (i32.const 17420) "L")
 (data $131.1 (i32.const 17432) "\02\00\00\000\00\00\00-\00 \00K\00e\00y\00 \00f\00i\00l\00e\00s\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00d\00:\00 ")
 (data $132 (i32.const 17500) "<")
 (data $132.1 (i32.const 17512) "\02\00\00\00 \00\00\00-\00 \00C\00u\00r\00r\00e\00n\00t\00 \00w\00o\00r\00k\00:\00 ")
 (data $133 (i32.const 17564) "<")
 (data $133.1 (i32.const 17576) "\02\00\00\00\1e\00\00\00-\00 \00K\00e\00y\00 \00t\00i\00m\00e\00l\00i\00n\00e\00:")
 (data $134 (i32.const 17628) ",")
 (data $134.1 (i32.const 17640) "\02\00\00\00\12\00\00\00t\00o\00o\00l\00_\00u\00s\00e\00 ")
 (data $135 (i32.const 17676) "\1c")
 (data $135.1 (i32.const 17688) "\02\00\00\00\02\00\00\00(")
 (data $136 (i32.const 17708) "\1c")
 (data $136.1 (i32.const 17720) "\02\00\00\00\02\00\00\00)")
 (data $137 (i32.const 17740) ",")
 (data $137.1 (i32.const 17752) "\02\00\00\00\18\00\00\00t\00o\00o\00l\00_\00r\00e\00s\00u\00l\00t\00 ")
 (data $138 (i32.const 17788) "\1c")
 (data $138.1 (i32.const 17800) "\02\00\00\00\04\00\00\00:\00 ")
 (data $139 (i32.const 17820) "\1c")
 (data $139.1 (i32.const 17832) "\02\00\00\00\0c\00\00\00e\00r\00r\00o\00r\00 ")
 (data $140 (i32.const 17852) "\1c")
 (data $140.1 (i32.const 17864) "\02\00\00\00\06\00\00\00 \00|\00 ")
 (data $141 (i32.const 17884) ",")
 (data $141.1 (i32.const 17896) "\02\00\00\00\14\00\00\00<\00/\00s\00u\00m\00m\00a\00r\00y\00>")
 (data $142 (i32.const 17932) "\1c")
 (data $142.1 (i32.const 17944) "\02\00\00\00\02\00\00\00\n")
 (data $143 (i32.const 17964) ",")
 (data $143.1 (i32.const 17976) "\02\00\00\00\10\00\00\00a\00n\00a\00l\00y\00s\00i\00s")
 (data $144 (i32.const 18012) "\1c")
 (data $144.1 (i32.const 18024) "\02\00\00\00\02\00\00\00<")
 (data $145 (i32.const 18044) "\1c")
 (data $145.1 (i32.const 18056) "\02\00\00\00\02\00\00\00>")
 (data $146 (i32.const 18076) "\1c")
 (data $146.1 (i32.const 18088) "\02\00\00\00\04\00\00\00<\00/")
 (data $147 (i32.const 18108) ",")
 (data $147.1 (i32.const 18120) "\02\00\00\00\0e\00\00\00s\00u\00m\00m\00a\00r\00y")
 (data $148 (i32.const 18156) ",")
 (data $148.1 (i32.const 18168) "\02\00\00\00\12\00\00\00S\00u\00m\00m\00a\00r\00y\00:\00\n")
 (data $149 (i32.const 18204) "L\01")
 (data $149.1 (i32.const 18216) "\02\00\00\002\01\00\00T\00h\00i\00s\00 \00s\00e\00s\00s\00i\00o\00n\00 \00i\00s\00 \00b\00e\00i\00n\00g\00 \00c\00o\00n\00t\00i\00n\00u\00e\00d\00 \00f\00r\00o\00m\00 \00a\00 \00p\00r\00e\00v\00i\00o\00u\00s\00 \00c\00o\00n\00v\00e\00r\00s\00a\00t\00i\00o\00n\00 \00t\00h\00a\00t\00 \00r\00a\00n\00 \00o\00u\00t\00 \00o\00f\00 \00c\00o\00n\00t\00e\00x\00t\00.\00 \00T\00h\00e\00 \00s\00u\00m\00m\00a\00r\00y\00 \00b\00e\00l\00o\00w\00 \00c\00o\00v\00e\00r\00s\00 \00t\00h\00e\00 \00e\00a\00r\00l\00i\00e\00r\00 \00p\00o\00r\00t\00i\00o\00n\00 \00o\00f\00 \00t\00h\00e\00 \00c\00o\00n\00v\00e\00r\00s\00a\00t\00i\00o\00n\00.\00\n\00\n")
 (data $150 (i32.const 18540) "l")
 (data $150.1 (i32.const 18552) "\02\00\00\00R\00\00\00\n\00\n\00R\00e\00c\00e\00n\00t\00 \00m\00e\00s\00s\00a\00g\00e\00s\00 \00a\00r\00e\00 \00p\00r\00e\00s\00e\00r\00v\00e\00d\00 \00v\00e\00r\00b\00a\00t\00i\00m\00.")
 (data $151 (i32.const 18652) "\cc\01")
 (data $151.1 (i32.const 18664) "\02\00\00\00\bc\01\00\00\n\00C\00o\00n\00t\00i\00n\00u\00e\00 \00t\00h\00e\00 \00c\00o\00n\00v\00e\00r\00s\00a\00t\00i\00o\00n\00 \00f\00r\00o\00m\00 \00w\00h\00e\00r\00e\00 \00i\00t\00 \00l\00e\00f\00t\00 \00o\00f\00f\00 \00w\00i\00t\00h\00o\00u\00t\00 \00a\00s\00k\00i\00n\00g\00 \00t\00h\00e\00 \00u\00s\00e\00r\00 \00a\00n\00y\00 \00f\00u\00r\00t\00h\00e\00r\00 \00q\00u\00e\00s\00t\00i\00o\00n\00s\00.\00 \00R\00e\00s\00u\00m\00e\00 \00d\00i\00r\00e\00c\00t\00l\00y\00 \00\14  \00d\00o\00 \00n\00o\00t\00 \00a\00c\00k\00n\00o\00w\00l\00e\00d\00g\00e\00 \00t\00h\00e\00 \00s\00u\00m\00m\00a\00r\00y\00,\00 \00d\00o\00 \00n\00o\00t\00 \00r\00e\00c\00a\00p\00 \00w\00h\00a\00t\00 \00w\00a\00s\00 \00h\00a\00p\00p\00e\00n\00i\00n\00g\00,\00 \00a\00n\00d\00 \00d\00o\00 \00n\00o\00t\00 \00p\00r\00e\00f\00a\00c\00e\00 \00w\00i\00t\00h\00 \00c\00o\00n\00t\00i\00n\00u\00a\00t\00i\00o\00n\00 \00t\00e\00x\00t\00.")
 (data $152 (i32.const 19116) ",")
 (data $152.1 (i32.const 19128) "\02\00\00\00\14\00\00\00P\00r\00e\00T\00o\00o\00l\00U\00s\00e")
 (data $153 (i32.const 19164) ",")
 (data $153.1 (i32.const 19176) "\02\00\00\00\16\00\00\00P\00o\00s\00t\00T\00o\00o\00l\00U\00s\00e")
 (data $154 (i32.const 19212) ",")
 (data $154.1 (i32.const 19224) "\02\00\00\00\0e\00\00\00U\00n\00k\00n\00o\00w\00n")
 (data $155 (i32.const 19260) ",")
 (data $155.1 (i32.const 19272) "\02\00\00\00\1c\00\00\00S\00l\00a\00s\00h\00 \00c\00o\00m\00m\00a\00n\00d\00s")
 (data $156 (i32.const 19308) "\9c")
 (data $156.1 (i32.const 19320) "\02\00\00\00\84\00\00\00 \00 \00[\00r\00e\00s\00u\00m\00e\00]\00 \00m\00e\00a\00n\00s\00 \00t\00h\00e\00 \00c\00o\00m\00m\00a\00n\00d\00 \00a\00l\00s\00o\00 \00w\00o\00r\00k\00s\00 \00w\00i\00t\00h\00 \00-\00-\00r\00e\00s\00u\00m\00e\00 \00S\00E\00S\00S\00I\00O\00N\00.\00j\00s\00o\00n")
 (data $157 (i32.const 19468) ",")
 (data $157.1 (i32.const 19480) "\02\00\00\00\12\00\00\00 \00[\00r\00e\00s\00u\00m\00e\00]")
 (data $158 (i32.const 19516) "\1c")
 (data $158.1 (i32.const 19528) "\02\00\00\00\04\00\00\00 \00 ")
 (data $159 (i32.const 19548) ",")
 (data $159.1 (i32.const 19560) "\02\00\00\00\12\00\00\00-\00-\00c\00o\00n\00f\00i\00r\00m")
 (data $160 (i32.const 19596) "\8c")
 (data $160.1 (i32.const 19608) "\02\00\00\00|\00\00\00C\00o\00m\00p\00a\00c\00t\00i\00o\00n\00 \00s\00k\00i\00p\00p\00e\00d\00:\00 \00s\00e\00s\00s\00i\00o\00n\00 \00i\00s\00 \00b\00e\00l\00o\00w\00 \00t\00h\00e\00 \00c\00o\00m\00p\00a\00c\00t\00i\00o\00n\00 \00t\00h\00r\00e\00s\00h\00o\00l\00d\00.")
 (data $161 (i32.const 19740) ",")
 (data $161.1 (i32.const 19752) "\02\00\00\00\14\00\00\00C\00o\00m\00p\00a\00c\00t\00e\00d\00 ")
 (data $162 (i32.const 19788) "l")
 (data $162.1 (i32.const 19800) "\02\00\00\00T\00\00\00 \00m\00e\00s\00s\00a\00g\00e\00s\00 \00i\00n\00t\00o\00 \00a\00 \00r\00e\00s\00u\00m\00a\00b\00l\00e\00 \00s\00y\00s\00t\00e\00m\00 \00s\00u\00m\00m\00a\00r\00y\00.")
 (data $163 (i32.const 19900) "<")
 (data $163.1 (i32.const 19912) "\02\00\00\00*\00\00\00O\00b\00j\00e\00c\00t\00 \00a\00l\00r\00e\00a\00d\00y\00 \00p\00i\00n\00n\00e\00d")
 (data $164 (i32.const 19964) "<")
 (data $164.1 (i32.const 19976) "\02\00\00\00(\00\00\00O\00b\00j\00e\00c\00t\00 \00i\00s\00 \00n\00o\00t\00 \00p\00i\00n\00n\00e\00d")
 (data $165 (i32.const 20032) "\14\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00\02A\00\00\00\00\00\00\02A\00\00\02\t\00\00 ")
 (data $165.1 (i32.const 20084) "\02A\00\00 \00\00\00\02A\00\00 ")
 (table $0 2 2 funcref)
 (elem $0 (i32.const 1) $~lib/util/sort/COMPARATOR<~lib/string/String>~anonymous|0)
 (export "JSON_NULL" (global $assembly/json/JSON_NULL))
 (export "JSON_BOOL" (global $assembly/json/JSON_BOOL))
 (export "JSON_NUMBER" (global $assembly/json/JSON_NUMBER))
 (export "JSON_STRING" (global $assembly/json/JSON_STRING))
 (export "JSON_ARRAY" (global $assembly/json/JSON_ARRAY))
 (export "JSON_OBJECT" (global $assembly/json/JSON_OBJECT))
 (export "formatUsd" (func $assembly/usage/formatUsd))
 (export "MessageRole.System" (global $assembly/session/MessageRole.System))
 (export "MessageRole.User" (global $assembly/session/MessageRole.User))
 (export "MessageRole.Assistant" (global $assembly/session/MessageRole.Assistant))
 (export "MessageRole.Tool" (global $assembly/session/MessageRole.Tool))
 (export "messageRoleToString" (func $assembly/session/messageRoleToString))
 (export "BLOCK_TEXT" (global $assembly/session/BLOCK_TEXT))
 (export "BLOCK_TOOL_USE" (global $assembly/session/BLOCK_TOOL_USE))
 (export "BLOCK_TOOL_RESULT" (global $assembly/session/BLOCK_TOOL_RESULT))
 (export "PermissionMode.ReadOnly" (global $assembly/permissions/PermissionMode.ReadOnly))
 (export "PermissionMode.WorkspaceWrite" (global $assembly/permissions/PermissionMode.WorkspaceWrite))
 (export "PermissionMode.DangerFullAccess" (global $assembly/permissions/PermissionMode.DangerFullAccess))
 (export "PermissionMode.Prompt" (global $assembly/permissions/PermissionMode.Prompt))
 (export "PermissionMode.Allow" (global $assembly/permissions/PermissionMode.Allow))
 (export "permissionModeAsStr" (func $assembly/permissions/permissionModeAsStr))
 (export "FilesystemIsolationMode.Off" (global $assembly/sandbox/FilesystemIsolationMode.Off))
 (export "FilesystemIsolationMode.WorkspaceOnly" (global $assembly/sandbox/FilesystemIsolationMode.WorkspaceOnly))
 (export "FilesystemIsolationMode.AllowList" (global $assembly/sandbox/FilesystemIsolationMode.AllowList))
 (export "filesystemIsolationModeAsStr" (func $assembly/sandbox/filesystemIsolationModeAsStr))
 (export "ConfigSource.User" (global $assembly/config/ConfigSource.User))
 (export "ConfigSource.Project" (global $assembly/config/ConfigSource.Project))
 (export "ConfigSource.Local" (global $assembly/config/ConfigSource.Local))
 (export "ResolvedPermissionMode.ReadOnly" (global $assembly/config/ResolvedPermissionMode.ReadOnly))
 (export "ResolvedPermissionMode.WorkspaceWrite" (global $assembly/config/ResolvedPermissionMode.WorkspaceWrite))
 (export "ResolvedPermissionMode.DangerFullAccess" (global $assembly/config/ResolvedPermissionMode.DangerFullAccess))
 (export "McpTransport.Stdio" (global $assembly/config/McpTransport.Stdio))
 (export "McpTransport.Sse" (global $assembly/config/McpTransport.Sse))
 (export "McpTransport.Http" (global $assembly/config/McpTransport.Http))
 (export "McpTransport.Ws" (global $assembly/config/McpTransport.Ws))
 (export "McpTransport.Sdk" (global $assembly/config/McpTransport.Sdk))
 (export "McpTransport.ClaudeAiProxy" (global $assembly/config/McpTransport.ClaudeAiProxy))
 (export "CLAUDE_CODE_SETTINGS_SCHEMA_NAME" (global $assembly/config/CLAUDE_CODE_SETTINGS_SCHEMA_NAME))
 (export "HookEvent.PreToolUse" (global $assembly/hooks/HookEvent.PreToolUse))
 (export "HookEvent.PostToolUse" (global $assembly/hooks/HookEvent.PostToolUse))
 (export "hookEventAsStr" (func $assembly/hooks/hookEventAsStr))
 (export "EVENT_TEXT_DELTA" (global $assembly/conversation/EVENT_TEXT_DELTA))
 (export "EVENT_TOOL_USE" (global $assembly/conversation/EVENT_TOOL_USE))
 (export "EVENT_USAGE" (global $assembly/conversation/EVENT_USAGE))
 (export "EVENT_MESSAGE_STOP" (global $assembly/conversation/EVENT_MESSAGE_STOP))
 (export "CommandSource.Builtin" (global $assembly/commands/CommandSource.Builtin))
 (export "CommandSource.InternalOnly" (global $assembly/commands/CommandSource.InternalOnly))
 (export "CommandSource.FeatureGated" (global $assembly/commands/CommandSource.FeatureGated))
 (export "slashCommandSpecs" (func $assembly/commands/slashCommandSpecs))
 (export "resumeSupportedSlashCommands" (func $assembly/commands/resumeSupportedSlashCommands))
 (export "renderSlashCommandHelp" (func $assembly/commands/renderSlashCommandHelp))
 (export "BootstrapPhase.CliEntry" (global $assembly/bootstrap/BootstrapPhase.CliEntry))
 (export "BootstrapPhase.FastPathVersion" (global $assembly/bootstrap/BootstrapPhase.FastPathVersion))
 (export "BootstrapPhase.StartupProfiler" (global $assembly/bootstrap/BootstrapPhase.StartupProfiler))
 (export "BootstrapPhase.SystemPromptFastPath" (global $assembly/bootstrap/BootstrapPhase.SystemPromptFastPath))
 (export "BootstrapPhase.ChromeMcpFastPath" (global $assembly/bootstrap/BootstrapPhase.ChromeMcpFastPath))
 (export "BootstrapPhase.DaemonWorkerFastPath" (global $assembly/bootstrap/BootstrapPhase.DaemonWorkerFastPath))
 (export "BootstrapPhase.BridgeFastPath" (global $assembly/bootstrap/BootstrapPhase.BridgeFastPath))
 (export "BootstrapPhase.DaemonFastPath" (global $assembly/bootstrap/BootstrapPhase.DaemonFastPath))
 (export "BootstrapPhase.BackgroundSessionFastPath" (global $assembly/bootstrap/BootstrapPhase.BackgroundSessionFastPath))
 (export "BootstrapPhase.TemplateFastPath" (global $assembly/bootstrap/BootstrapPhase.TemplateFastPath))
 (export "BootstrapPhase.EnvironmentRunnerFastPath" (global $assembly/bootstrap/BootstrapPhase.EnvironmentRunnerFastPath))
 (export "BootstrapPhase.MainRuntime" (global $assembly/bootstrap/BootstrapPhase.MainRuntime))
 (export "__new" (func $~lib/rt/itcms/__new))
 (export "__pin" (func $~lib/rt/itcms/__pin))
 (export "__unpin" (func $~lib/rt/itcms/__unpin))
 (export "__collect" (func $~lib/rt/itcms/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "memory" (memory $0))
 (export "pricingForModel" (func $export:assembly/usage/pricingForModel))
 (export "messageRoleFromString" (func $export:assembly/session/messageRoleFromString))
 (export "filesystemIsolationModeFromStr" (func $export:assembly/sandbox/filesystemIsolationModeFromStr))
 (export "compactSession" (func $export:assembly/compact/compactSession))
 (export "estimateSessionTokens" (func $export:assembly/compact/estimateSessionTokens))
 (export "shouldCompact" (func $export:assembly/compact/shouldCompact))
 (export "formatCompactSummary" (func $export:assembly/compact/formatCompactSummary))
 (export "getCompactContinuationMessage" (func $export:assembly/compact/getCompactContinuationMessage))
 (export "handleSlashCommand" (func $export:assembly/commands/handleSlashCommand))
 (start $~start)
 (func $~lib/rt/itcms/initLazy (param $0 i32) (result i32)
  local.get $0
  local.get $0
  i32.store offset=4
  local.get $0
  local.get $0
  i32.store offset=8
  local.get $0
 )
 (func $~lib/rt/itcms/visitRoots
  (local $0 i32)
  (local $1 i32)
  i32.const 1584
  call $~lib/rt/itcms/__visit
  i32.const 5680
  call $~lib/rt/itcms/__visit
  i32.const 16192
  call $~lib/rt/itcms/__visit
  i32.const 1392
  call $~lib/rt/itcms/__visit
  i32.const 19920
  call $~lib/rt/itcms/__visit
  i32.const 19984
  call $~lib/rt/itcms/__visit
  i32.const 15184
  call $~lib/rt/itcms/__visit
  i32.const 1056
  call $~lib/rt/itcms/__visit
  i32.const 1344
  call $~lib/rt/itcms/__visit
  global.get $assembly/commands/SLASH_COMMAND_SPECS
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $~lib/rt/itcms/pinSpace
  local.tee $1
  i32.load offset=4
  i32.const -4
  i32.and
  local.set $0
  loop $while-continue|0
   local.get $0
   local.get $1
   i32.ne
   if
    local.get $0
    i32.load offset=4
    i32.const 3
    i32.and
    i32.const 3
    i32.ne
    if
     i32.const 0
     i32.const 1456
     i32.const 160
     i32.const 16
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    i32.const 20
    i32.add
    call $~lib/rt/__visit_members
    local.get $0
    i32.load offset=4
    i32.const -4
    i32.and
    local.set $0
    br $while-continue|0
   end
  end
 )
 (func $~lib/rt/itcms/Object#set:color (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const -4
  i32.and
  local.get $1
  i32.or
  i32.store offset=4
 )
 (func $~lib/rt/itcms/Object#set:next (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  local.get $0
  i32.load offset=4
  i32.const 3
  i32.and
  i32.or
  i32.store offset=4
 )
 (func $~lib/rt/itcms/Object#unlink (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  i32.const -4
  i32.and
  local.tee $1
  i32.eqz
  if
   local.get $0
   i32.load offset=8
   i32.eqz
   local.get $0
   i32.const 52884
   i32.lt_u
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 1456
    i32.const 128
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   return
  end
  local.get $0
  i32.load offset=8
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 1456
   i32.const 132
   i32.const 16
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $0
  i32.store offset=8
  local.get $0
  local.get $1
  call $~lib/rt/itcms/Object#set:next
 )
 (func $~lib/rt/itcms/Object#linkTo (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  i32.load offset=8
  local.set $3
  local.get $0
  local.get $1
  local.get $2
  i32.or
  i32.store offset=4
  local.get $0
  local.get $3
  i32.store offset=8
  local.get $3
  local.get $0
  call $~lib/rt/itcms/Object#set:next
  local.get $1
  local.get $0
  i32.store offset=8
 )
 (func $~lib/rt/itcms/Object#makeGray (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  global.get $~lib/rt/itcms/iter
  i32.eq
  if
   local.get $0
   i32.load offset=8
   local.tee $1
   i32.eqz
   if
    i32.const 0
    i32.const 1456
    i32.const 148
    i32.const 30
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   global.set $~lib/rt/itcms/iter
  end
  local.get $0
  call $~lib/rt/itcms/Object#unlink
  global.get $~lib/rt/itcms/toSpace
  local.set $1
  local.get $0
  i32.load offset=12
  local.tee $2
  i32.const 2
  i32.le_u
  if (result i32)
   i32.const 1
  else
   local.get $2
   i32.const 20032
   i32.load
   i32.gt_u
   if
    i32.const 1584
    i32.const 1648
    i32.const 21
    i32.const 28
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   i32.const 2
   i32.shl
   i32.const 20036
   i32.add
   i32.load
   i32.const 32
   i32.and
  end
  local.set $2
  local.get $0
  local.get $1
  global.get $~lib/rt/itcms/white
  i32.eqz
  i32.const 2
  local.get $2
  select
  call $~lib/rt/itcms/Object#linkTo
 )
 (func $~lib/rt/itcms/__visit (param $0 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  global.get $~lib/rt/itcms/white
  local.get $0
  i32.const 20
  i32.sub
  local.tee $0
  i32.load offset=4
  i32.const 3
  i32.and
  i32.eq
  if
   local.get $0
   call $~lib/rt/itcms/Object#makeGray
   global.get $~lib/rt/itcms/visitCount
   i32.const 1
   i32.add
   global.set $~lib/rt/itcms/visitCount
  end
 )
 (func $~lib/rt/tlsf/removeBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.load
  local.tee $3
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1728
   i32.const 268
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const -4
  i32.and
  local.tee $3
  i32.const 12
  i32.lt_u
  if
   i32.const 0
   i32.const 1728
   i32.const 270
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $3
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   i32.const 1073741820
   local.get $3
   local.get $3
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $3
   i32.clz
   i32.sub
   local.tee $4
   i32.const 7
   i32.sub
   local.set $2
   local.get $3
   local.get $4
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.tee $3
  i32.const 16
  i32.lt_u
  local.get $2
  i32.const 23
  i32.lt_u
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1728
   i32.const 284
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load offset=8
  local.set $5
  local.get $1
  i32.load offset=4
  local.tee $4
  if
   local.get $4
   local.get $5
   i32.store offset=8
  end
  local.get $5
  if
   local.get $5
   local.get $4
   i32.store offset=4
  end
  local.get $1
  local.get $0
  local.get $2
  i32.const 4
  i32.shl
  local.get $3
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.tee $1
  i32.load offset=96
  i32.eq
  if
   local.get $1
   local.get $5
   i32.store offset=96
   local.get $5
   i32.eqz
   if
    local.get $0
    local.get $2
    i32.const 2
    i32.shl
    i32.add
    local.tee $1
    i32.load offset=4
    i32.const -2
    local.get $3
    i32.rotl
    i32.and
    local.set $3
    local.get $1
    local.get $3
    i32.store offset=4
    local.get $3
    i32.eqz
    if
     local.get $0
     local.get $0
     i32.load
     i32.const -2
     local.get $2
     i32.rotl
     i32.and
     i32.store
    end
   end
  end
 )
 (func $~lib/rt/tlsf/insertBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.eqz
  if
   i32.const 0
   i32.const 1728
   i32.const 201
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load
  local.tee $3
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1728
   i32.const 203
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 4
  i32.add
  local.get $1
  i32.load
  i32.const -4
  i32.and
  i32.add
  local.tee $4
  i32.load
  local.tee $2
  i32.const 1
  i32.and
  if
   local.get $0
   local.get $4
   call $~lib/rt/tlsf/removeBlock
   local.get $1
   local.get $3
   i32.const 4
   i32.add
   local.get $2
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   i32.store
   local.get $1
   i32.const 4
   i32.add
   local.get $1
   i32.load
   i32.const -4
   i32.and
   i32.add
   local.tee $4
   i32.load
   local.set $2
  end
  local.get $3
  i32.const 2
  i32.and
  if
   local.get $1
   i32.const 4
   i32.sub
   i32.load
   local.tee $1
   i32.load
   local.tee $6
   i32.const 1
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 1728
    i32.const 221
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/removeBlock
   local.get $1
   local.get $6
   i32.const 4
   i32.add
   local.get $3
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   i32.store
  end
  local.get $4
  local.get $2
  i32.const 2
  i32.or
  i32.store
  local.get $3
  i32.const -4
  i32.and
  local.tee $2
  i32.const 12
  i32.lt_u
  if
   i32.const 0
   i32.const 1728
   i32.const 233
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  local.get $1
  i32.const 4
  i32.add
  local.get $2
  i32.add
  i32.ne
  if
   i32.const 0
   i32.const 1728
   i32.const 234
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const 4
  i32.sub
  local.get $1
  i32.store
  local.get $2
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $2
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   i32.const 1073741820
   local.get $2
   local.get $2
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $2
   i32.clz
   i32.sub
   local.tee $3
   i32.const 7
   i32.sub
   local.set $5
   local.get $2
   local.get $3
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.tee $2
  i32.const 16
  i32.lt_u
  local.get $5
  i32.const 23
  i32.lt_u
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1728
   i32.const 251
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $5
  i32.const 4
  i32.shl
  local.get $2
  i32.add
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=96
  local.set $3
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  local.get $3
  i32.store offset=8
  local.get $3
  if
   local.get $3
   local.get $1
   i32.store offset=4
  end
  local.get $0
  local.get $5
  i32.const 4
  i32.shl
  local.get $2
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store offset=96
  local.get $0
  local.get $0
  i32.load
  i32.const 1
  local.get $5
  i32.shl
  i32.or
  i32.store
  local.get $0
  local.get $5
  i32.const 2
  i32.shl
  i32.add
  local.tee $0
  local.get $0
  i32.load offset=4
  i32.const 1
  local.get $2
  i32.shl
  i32.or
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/addMemory (param $0 i32) (param $1 i32) (param $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $2
  local.get $1
  i64.extend_i32_u
  i64.lt_u
  if
   i32.const 0
   i32.const 1728
   i32.const 382
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.set $1
  local.get $0
  i32.load offset=1568
  local.tee $3
  if
   local.get $3
   i32.const 4
   i32.add
   local.get $1
   i32.gt_u
   if
    i32.const 0
    i32.const 1728
    i32.const 389
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $3
   local.get $1
   i32.const 16
   i32.sub
   local.tee $5
   i32.eq
   if
    local.get $3
    i32.load
    local.set $4
    local.get $5
    local.set $1
   end
  else
   local.get $0
   i32.const 1572
   i32.add
   local.get $1
   i32.gt_u
   if
    i32.const 0
    i32.const 1728
    i32.const 402
    i32.const 5
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $2
  i32.wrap_i64
  i32.const -16
  i32.and
  local.get $1
  i32.sub
  local.tee $3
  i32.const 20
  i32.lt_u
  if
   return
  end
  local.get $1
  local.get $4
  i32.const 2
  i32.and
  local.get $3
  i32.const 8
  i32.sub
  local.tee $3
  i32.const 1
  i32.or
  i32.or
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 4
  i32.add
  local.get $3
  i32.add
  local.tee $3
  i32.const 2
  i32.store
  local.get $0
  local.get $3
  i32.store offset=1568
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/tlsf/initialize
  (local $0 i32)
  (local $1 i32)
  memory.size
  local.tee $1
  i32.const 0
  i32.le_s
  if (result i32)
   i32.const 1
   local.get $1
   i32.sub
   memory.grow
   i32.const 0
   i32.lt_s
  else
   i32.const 0
  end
  if
   unreachable
  end
  i32.const 52896
  i32.const 0
  i32.store
  i32.const 54464
  i32.const 0
  i32.store
  loop $for-loop|0
   local.get $0
   i32.const 23
   i32.lt_u
   if
    local.get $0
    i32.const 2
    i32.shl
    i32.const 52896
    i32.add
    i32.const 0
    i32.store offset=4
    i32.const 0
    local.set $1
    loop $for-loop|1
     local.get $1
     i32.const 16
     i32.lt_u
     if
      local.get $0
      i32.const 4
      i32.shl
      local.get $1
      i32.add
      i32.const 2
      i32.shl
      i32.const 52896
      i32.add
      i32.const 0
      i32.store offset=96
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      br $for-loop|1
     end
    end
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  i32.const 52896
  i32.const 54468
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  i32.const 52896
  global.set $~lib/rt/tlsf/ROOT
 )
 (func $~lib/rt/tlsf/__free (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.const 52884
  i32.lt_u
  if
   return
  end
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.set $2
  local.get $0
  i32.const 4
  i32.sub
  local.set $1
  local.get $0
  i32.const 15
  i32.and
  i32.const 1
  local.get $0
  select
  if (result i32)
   i32.const 1
  else
   local.get $1
   i32.load
   i32.const 1
   i32.and
  end
  if
   i32.const 0
   i32.const 1728
   i32.const 562
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $1
  i32.load
  i32.const 1
  i32.or
  i32.store
  local.get $2
  local.get $1
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/itcms/step (result i32)
  (local $0 i32)
  (local $1 i32)
  block $break|0
   block $case2|0
    block $case1|0
     block $case0|0
      global.get $~lib/rt/itcms/state
      br_table $case0|0 $case1|0 $case2|0 $break|0
     end
     i32.const 1
     global.set $~lib/rt/itcms/state
     i32.const 0
     global.set $~lib/rt/itcms/visitCount
     call $~lib/rt/itcms/visitRoots
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/iter
     global.get $~lib/rt/itcms/visitCount
     return
    end
    global.get $~lib/rt/itcms/white
    i32.eqz
    local.set $1
    global.get $~lib/rt/itcms/iter
    i32.load offset=4
    i32.const -4
    i32.and
    local.set $0
    loop $while-continue|1
     local.get $0
     global.get $~lib/rt/itcms/toSpace
     i32.ne
     if
      local.get $0
      global.set $~lib/rt/itcms/iter
      local.get $1
      local.get $0
      i32.load offset=4
      i32.const 3
      i32.and
      i32.ne
      if
       local.get $0
       local.get $1
       call $~lib/rt/itcms/Object#set:color
       i32.const 0
       global.set $~lib/rt/itcms/visitCount
       local.get $0
       i32.const 20
       i32.add
       call $~lib/rt/__visit_members
       global.get $~lib/rt/itcms/visitCount
       return
      end
      local.get $0
      i32.load offset=4
      i32.const -4
      i32.and
      local.set $0
      br $while-continue|1
     end
    end
    i32.const 0
    global.set $~lib/rt/itcms/visitCount
    call $~lib/rt/itcms/visitRoots
    global.get $~lib/rt/itcms/toSpace
    global.get $~lib/rt/itcms/iter
    i32.load offset=4
    i32.const -4
    i32.and
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     local.set $0
     loop $while-continue|0
      local.get $0
      i32.const 52884
      i32.lt_u
      if
       local.get $0
       i32.load
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.const 4
       i32.add
       local.set $0
       br $while-continue|0
      end
     end
     global.get $~lib/rt/itcms/iter
     i32.load offset=4
     i32.const -4
     i32.and
     local.set $0
     loop $while-continue|2
      local.get $0
      global.get $~lib/rt/itcms/toSpace
      i32.ne
      if
       local.get $1
       local.get $0
       i32.load offset=4
       i32.const 3
       i32.and
       i32.ne
       if
        local.get $0
        local.get $1
        call $~lib/rt/itcms/Object#set:color
        local.get $0
        i32.const 20
        i32.add
        call $~lib/rt/__visit_members
       end
       local.get $0
       i32.load offset=4
       i32.const -4
       i32.and
       local.set $0
       br $while-continue|2
      end
     end
     global.get $~lib/rt/itcms/fromSpace
     local.set $0
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/fromSpace
     local.get $0
     global.set $~lib/rt/itcms/toSpace
     local.get $1
     global.set $~lib/rt/itcms/white
     local.get $0
     i32.load offset=4
     i32.const -4
     i32.and
     global.set $~lib/rt/itcms/iter
     i32.const 2
     global.set $~lib/rt/itcms/state
    end
    global.get $~lib/rt/itcms/visitCount
    return
   end
   global.get $~lib/rt/itcms/iter
   local.tee $0
   global.get $~lib/rt/itcms/toSpace
   i32.ne
   if
    local.get $0
    i32.load offset=4
    i32.const -4
    i32.and
    global.set $~lib/rt/itcms/iter
    global.get $~lib/rt/itcms/white
    i32.eqz
    local.get $0
    i32.load offset=4
    i32.const 3
    i32.and
    i32.ne
    if
     i32.const 0
     i32.const 1456
     i32.const 229
     i32.const 20
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    i32.const 52884
    i32.lt_u
    if
     local.get $0
     i32.const 0
     i32.store offset=4
     local.get $0
     i32.const 0
     i32.store offset=8
    else
     global.get $~lib/rt/itcms/total
     local.get $0
     i32.load
     i32.const -4
     i32.and
     i32.const 4
     i32.add
     i32.sub
     global.set $~lib/rt/itcms/total
     local.get $0
     i32.const 4
     i32.add
     call $~lib/rt/tlsf/__free
    end
    i32.const 10
    return
   end
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   i32.store offset=4
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   i32.store offset=8
   i32.const 0
   global.set $~lib/rt/itcms/state
  end
  i32.const 0
 )
 (func $~lib/rt/tlsf/roundSize (param $0 i32) (result i32)
  local.get $0
  i32.const 536870910
  i32.lt_u
  if (result i32)
   local.get $0
   i32.const 1
   i32.const 27
   local.get $0
   i32.clz
   i32.sub
   i32.shl
   i32.add
   i32.const 1
   i32.sub
  else
   local.get $0
  end
 )
 (func $~lib/rt/tlsf/searchBlock (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $1
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   local.get $1
   call $~lib/rt/tlsf/roundSize
   local.tee $1
   i32.clz
   i32.sub
   local.tee $3
   i32.const 7
   i32.sub
   local.set $2
   local.get $1
   local.get $3
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.tee $1
  i32.const 16
  i32.lt_u
  local.get $2
  i32.const 23
  i32.lt_u
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1728
   i32.const 334
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=4
  i32.const -1
  local.get $1
  i32.shl
  i32.and
  local.tee $1
  if (result i32)
   local.get $0
   local.get $1
   i32.ctz
   local.get $2
   i32.const 4
   i32.shl
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
  else
   local.get $0
   i32.load
   i32.const -1
   local.get $2
   i32.const 1
   i32.add
   i32.shl
   i32.and
   local.tee $1
   if (result i32)
    local.get $0
    local.get $1
    i32.ctz
    local.tee $1
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    local.tee $2
    i32.eqz
    if
     i32.const 0
     i32.const 1728
     i32.const 347
     i32.const 18
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    local.get $2
    i32.ctz
    local.get $1
    i32.const 4
    i32.shl
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
   else
    i32.const 0
   end
  end
 )
 (func $~lib/rt/tlsf/allocateBlock (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1392
   i32.const 1728
   i32.const 461
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 12
  local.get $1
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.get $1
  i32.const 12
  i32.le_u
  select
  local.tee $1
  call $~lib/rt/tlsf/searchBlock
  local.tee $2
  i32.eqz
  if
   local.get $1
   i32.const 256
   i32.ge_u
   if (result i32)
    local.get $1
    call $~lib/rt/tlsf/roundSize
   else
    local.get $1
   end
   local.set $2
   memory.size
   local.tee $3
   local.get $2
   i32.const 4
   local.get $0
   i32.load offset=1568
   local.get $3
   i32.const 16
   i32.shl
   i32.const 4
   i32.sub
   i32.ne
   i32.shl
   i32.add
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $2
   local.get $2
   local.get $3
   i32.lt_s
   select
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $2
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
   local.get $0
   local.get $3
   i32.const 16
   i32.shl
   memory.size
   i64.extend_i32_s
   i64.const 16
   i64.shl
   call $~lib/rt/tlsf/addMemory
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/searchBlock
   local.tee $2
   i32.eqz
   if
    i32.const 0
    i32.const 1728
    i32.const 499
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $1
  local.get $2
  i32.load
  i32.const -4
  i32.and
  i32.gt_u
  if
   i32.const 0
   i32.const 1728
   i32.const 501
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $2
  call $~lib/rt/tlsf/removeBlock
  local.get $2
  i32.load
  local.set $4
  local.get $1
  i32.const 4
  i32.add
  i32.const 15
  i32.and
  if
   i32.const 0
   i32.const 1728
   i32.const 361
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const -4
  i32.and
  local.get $1
  i32.sub
  local.tee $3
  i32.const 16
  i32.ge_u
  if
   local.get $2
   local.get $1
   local.get $4
   i32.const 2
   i32.and
   i32.or
   i32.store
   local.get $2
   i32.const 4
   i32.add
   local.get $1
   i32.add
   local.tee $1
   local.get $3
   i32.const 4
   i32.sub
   i32.const 1
   i32.or
   i32.store
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/insertBlock
  else
   local.get $2
   local.get $4
   i32.const -2
   i32.and
   i32.store
   local.get $2
   i32.const 4
   i32.add
   local.get $2
   i32.load
   i32.const -4
   i32.and
   i32.add
   local.tee $0
   local.get $0
   i32.load
   i32.const -3
   i32.and
   i32.store
  end
  local.get $2
 )
 (func $~lib/rt/tlsf/__alloc (param $0 i32) (result i32)
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.get $0
  call $~lib/rt/tlsf/allocateBlock
  i32.const 4
  i32.add
 )
 (func $~lib/rt/itcms/__new (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  i32.const 1073741804
  i32.ge_u
  if
   i32.const 1392
   i32.const 1456
   i32.const 261
   i32.const 31
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/total
  global.get $~lib/rt/itcms/threshold
  i32.ge_u
  if
   block $__inlined_func$~lib/rt/itcms/interrupt$67
    i32.const 2048
    local.set $2
    loop $do-loop|0
     local.get $2
     call $~lib/rt/itcms/step
     i32.sub
     local.set $2
     global.get $~lib/rt/itcms/state
     i32.eqz
     if
      global.get $~lib/rt/itcms/total
      i64.extend_i32_u
      i64.const 200
      i64.mul
      i64.const 100
      i64.div_u
      i32.wrap_i64
      i32.const 1024
      i32.add
      global.set $~lib/rt/itcms/threshold
      br $__inlined_func$~lib/rt/itcms/interrupt$67
     end
     local.get $2
     i32.const 0
     i32.gt_s
     br_if $do-loop|0
    end
    global.get $~lib/rt/itcms/total
    global.get $~lib/rt/itcms/total
    global.get $~lib/rt/itcms/threshold
    i32.sub
    i32.const 1024
    i32.lt_u
    i32.const 10
    i32.shl
    i32.add
    global.set $~lib/rt/itcms/threshold
   end
  end
  local.get $0
  i32.const 16
  i32.add
  call $~lib/rt/tlsf/__alloc
  i32.const 4
  i32.sub
  local.tee $2
  local.get $1
  i32.store offset=12
  local.get $2
  local.get $0
  i32.store offset=16
  local.get $2
  global.get $~lib/rt/itcms/fromSpace
  global.get $~lib/rt/itcms/white
  call $~lib/rt/itcms/Object#linkTo
  global.get $~lib/rt/itcms/total
  local.get $2
  i32.load
  i32.const -4
  i32.and
  i32.const 4
  i32.add
  i32.add
  global.set $~lib/rt/itcms/total
  local.get $2
  i32.const 20
  i32.add
  local.tee $1
  i32.const 0
  local.get $0
  memory.fill
  local.get $1
 )
 (func $~lib/rt/itcms/__link (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  i32.eqz
  if
   return
  end
  local.get $0
  i32.eqz
  if
   i32.const 0
   i32.const 1456
   i32.const 295
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/white
  local.get $1
  i32.const 20
  i32.sub
  local.tee $1
  i32.load offset=4
  i32.const 3
  i32.and
  i32.eq
  if
   local.get $0
   i32.const 20
   i32.sub
   local.tee $0
   i32.load offset=4
   i32.const 3
   i32.and
   local.tee $3
   global.get $~lib/rt/itcms/white
   i32.eqz
   i32.eq
   if
    local.get $0
    local.get $1
    local.get $2
    select
    call $~lib/rt/itcms/Object#makeGray
   else
    global.get $~lib/rt/itcms/state
    i32.const 1
    i32.eq
    local.get $3
    i32.const 3
    i32.eq
    i32.and
    if
     local.get $1
     call $~lib/rt/itcms/Object#makeGray
    end
   end
  end
 )
 (func $assembly/commands/SlashCommandSpec#set:name (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $assembly/commands/SlashCommandSpec#set:summary (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $assembly/commands/SlashCommandSpec#set:argumentHint (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/rt/itcms/__renew (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  local.get $0
  i32.const 20
  i32.sub
  local.tee $3
  i32.load
  i32.const -4
  i32.and
  i32.const 16
  i32.sub
  i32.le_u
  if
   local.get $3
   local.get $1
   i32.store offset=16
   local.get $0
   return
  end
  local.get $1
  local.get $3
  i32.load offset=12
  call $~lib/rt/itcms/__new
  local.tee $2
  local.get $0
  local.get $1
  local.get $3
  i32.load offset=16
  local.tee $0
  local.get $0
  local.get $1
  i32.gt_u
  select
  memory.copy
  local.get $2
 )
 (func $~lib/util/string/stagedBinaryLookup (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $0
  local.get $1
  i32.const 8
  i32.shr_u
  i32.add
  i32.load8_u
  i32.const 5
  i32.shl
  i32.add
  local.get $1
  i32.const 255
  i32.and
  i32.const 3
  i32.shr_u
  i32.add
  i32.load8_u
  local.get $1
  i32.const 7
  i32.and
  i32.shr_u
  i32.const 1
  i32.and
 )
 (func $~lib/util/casemap/casemap (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  local.tee $1
  i32.const 8
  i32.shr_u
  local.tee $2
  i32.const 13924
  i32.add
  i32.load8_u
  local.get $2
  i32.const 10284
  i32.add
  i32.load8_u
  i32.const 86
  i32.mul
  i32.const 10284
  i32.add
  local.get $0
  i32.const 255
  i32.and
  local.tee $3
  i32.const 3
  i32.div_u
  i32.add
  i32.load8_u
  local.get $3
  i32.const 3
  i32.rem_u
  i32.const 2
  i32.shl
  i32.const 12952
  i32.add
  i32.load
  i32.mul
  i32.const 11
  i32.shr_u
  i32.const 6
  i32.rem_u
  i32.add
  i32.const 2
  i32.shl
  i32.const 12964
  i32.add
  i32.load
  local.tee $2
  i32.const 255
  i32.and
  local.set $0
  local.get $2
  i32.const 8
  i32.shr_s
  local.set $2
  block $folding-inner0
   local.get $0
   i32.const 2
   i32.lt_u
   br_if $folding-inner0
   local.get $2
   i32.const 255
   i32.and
   local.set $0
   local.get $2
   i32.const 8
   i32.shr_u
   local.set $2
   loop $while-continue|0
    local.get $0
    if
     local.get $2
     local.get $0
     i32.const 1
     i32.shr_u
     local.tee $6
     i32.add
     i32.const 1
     i32.shl
     i32.const 14436
     i32.add
     local.tee $4
     i32.load8_u
     local.tee $5
     local.get $3
     i32.eq
     if (result i32)
      local.get $4
      i32.load8_u offset=1
      i32.const 2
      i32.shl
      i32.const 12964
      i32.add
      i32.load
      local.tee $2
      i32.const 255
      i32.and
      local.set $0
      local.get $2
      i32.const 8
      i32.shr_s
      local.set $2
      local.get $0
      i32.const 2
      i32.lt_u
      br_if $folding-inner0
      local.get $1
      i32.const 1
      i32.add
      return
     else
      local.get $3
      local.get $5
      i32.lt_u
      if (result i32)
       local.get $6
      else
       local.get $2
       local.get $6
       i32.add
       local.set $2
       local.get $0
       local.get $6
       i32.sub
      end
     end
     local.set $0
     br $while-continue|0
    end
   end
   local.get $1
   return
  end
  local.get $1
  local.get $2
  i32.const 0
  local.get $0
  i32.sub
  i32.and
  i32.add
 )
 (func $~lib/util/string/compareImpl (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  local.get $0
  local.get $1
  i32.const 1
  i32.shl
  i32.add
  local.tee $1
  i32.const 7
  i32.and
  local.get $2
  i32.const 7
  i32.and
  i32.or
  i32.eqz
  local.get $3
  i32.const 4
  i32.ge_u
  i32.and
  if
   loop $do-loop|0
    local.get $1
    i64.load
    local.get $2
    i64.load
    i64.eq
    if
     local.get $1
     i32.const 8
     i32.add
     local.set $1
     local.get $2
     i32.const 8
     i32.add
     local.set $2
     local.get $3
     i32.const 4
     i32.sub
     local.tee $3
     i32.const 4
     i32.ge_u
     br_if $do-loop|0
    end
   end
  end
  loop $while-continue|1
   local.get $3
   local.tee $0
   i32.const 1
   i32.sub
   local.set $3
   local.get $0
   if
    local.get $1
    i32.load16_u
    local.tee $0
    local.get $2
    i32.load16_u
    local.tee $4
    i32.ne
    if
     local.get $0
     local.get $4
     i32.sub
     return
    end
    local.get $1
    i32.const 2
    i32.add
    local.set $1
    local.get $2
    i32.const 2
    i32.add
    local.set $2
    br $while-continue|1
   end
  end
  i32.const 0
 )
 (func $~lib/util/number/decimalCount32 (param $0 i32) (result i32)
  local.get $0
  i32.const 100000
  i32.lt_u
  if (result i32)
   local.get $0
   i32.const 10
   i32.ge_u
   i32.const 1
   i32.add
   local.get $0
   i32.const 10000
   i32.ge_u
   i32.const 3
   i32.add
   local.get $0
   i32.const 1000
   i32.ge_u
   i32.add
   local.get $0
   i32.const 100
   i32.lt_u
   select
  else
   local.get $0
   i32.const 1000000
   i32.ge_u
   i32.const 6
   i32.add
   local.get $0
   i32.const 1000000000
   i32.ge_u
   i32.const 8
   i32.add
   local.get $0
   i32.const 100000000
   i32.ge_u
   i32.add
   local.get $0
   i32.const 10000000
   i32.lt_u
   select
  end
 )
 (func $~lib/util/number/utoa_dec_simple<u32> (param $0 i32) (param $1 i32) (param $2 i32)
  loop $do-loop|0
   local.get $0
   local.get $2
   i32.const 1
   i32.sub
   local.tee $2
   i32.const 1
   i32.shl
   i32.add
   local.get $1
   i32.const 10
   i32.rem_u
   i32.const 48
   i32.add
   i32.store16
   local.get $1
   i32.const 10
   i32.div_u
   local.tee $1
   br_if $do-loop|0
  end
 )
 (func $assembly/session/messageRoleToString (param $0 i32) (result i32)
  block $case4|0
   block $case3|0
    block $case2|0
     block $case1|0
      block $case0|0
       local.get $0
       br_table $case0|0 $case1|0 $case2|0 $case3|0 $case4|0
      end
      i32.const 15344
      return
     end
     i32.const 15376
     return
    end
    i32.const 15408
    return
   end
   i32.const 15456
   return
  end
  i32.const 15488
 )
 (func $assembly/permissions/permissionModeAsStr (param $0 i32) (result i32)
  block $case5|0
   block $case4|0
    block $case3|0
     block $case2|0
      block $case1|0
       block $case0|0
        local.get $0
        br_table $case0|0 $case1|0 $case2|0 $case3|0 $case4|0 $case5|0
       end
       i32.const 15680
       return
      end
      i32.const 15728
      return
     end
     i32.const 15792
     return
    end
    i32.const 15856
    return
   end
   i32.const 15888
   return
  end
  i32.const 15488
 )
 (func $assembly/sandbox/filesystemIsolationModeAsStr (param $0 i32) (result i32)
  block $case3|0
   block $case2|0
    block $case1|0
     block $case0|0
      local.get $0
      br_table $case0|0 $case1|0 $case2|0 $case3|0
     end
     i32.const 15920
     return
    end
    i32.const 15952
    return
   end
   i32.const 16000
   return
  end
  i32.const 15920
 )
 (func $~lib/util/string/isSpace (param $0 i32) (result i32)
  local.get $0
  i32.const 5760
  i32.lt_u
  if
   local.get $0
   i32.const 128
   i32.or
   i32.const 160
   i32.eq
   local.get $0
   i32.const 9
   i32.sub
   i32.const 4
   i32.le_u
   i32.or
   return
  end
  local.get $0
  i32.const -8192
  i32.add
  i32.const 10
  i32.le_u
  if
   i32.const 1
   return
  end
  local.get $0
  i32.const 5760
  i32.eq
  local.get $0
  i32.const 8232
  i32.eq
  i32.or
  local.get $0
  i32.const 8233
  i32.eq
  local.get $0
  i32.const 8239
  i32.eq
  i32.or
  i32.or
  local.get $0
  i32.const 8287
  i32.eq
  local.get $0
  i32.const 12288
  i32.eq
  i32.or
  local.get $0
  i32.const 65279
  i32.eq
  i32.or
  i32.or
  if
   i32.const 1
   return
  end
  i32.const 0
 )
 (func $assembly/session/ContentBlock#set:name (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=12
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $assembly/session/ContentBlock#set:input (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=16
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $assembly/session/ContentBlock#set:toolUseId (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=20
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $assembly/session/ContentBlock#set:toolName (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=24
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $assembly/session/ContentBlock#set:output (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=28
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $assembly/hooks/hookEventAsStr (param $0 i32) (result i32)
  block $case2|0
   block $case1|0
    local.get $0
    if
     local.get $0
     i32.const 1
     i32.eq
     br_if $case1|0
     br $case2|0
    end
    i32.const 19136
    return
   end
   i32.const 19184
   return
  end
  i32.const 19232
 )
 (func $assembly/commands/slashCommandSpecs (result i32)
  global.get $assembly/commands/SLASH_COMMAND_SPECS
 )
 (func $~lib/rt/itcms/__pin (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  if
   local.get $0
   i32.const 20
   i32.sub
   local.tee $1
   i32.load offset=4
   i32.const 3
   i32.and
   i32.const 3
   i32.eq
   if
    i32.const 19920
    i32.const 1456
    i32.const 338
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   call $~lib/rt/itcms/Object#unlink
   local.get $1
   global.get $~lib/rt/itcms/pinSpace
   i32.const 3
   call $~lib/rt/itcms/Object#linkTo
  end
  local.get $0
 )
 (func $~lib/rt/itcms/__unpin (param $0 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  local.get $0
  i32.const 20
  i32.sub
  local.tee $0
  i32.load offset=4
  i32.const 3
  i32.and
  i32.const 3
  i32.ne
  if
   i32.const 19984
   i32.const 1456
   i32.const 352
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/state
  i32.const 1
  i32.eq
  if
   local.get $0
   call $~lib/rt/itcms/Object#makeGray
  else
   local.get $0
   call $~lib/rt/itcms/Object#unlink
   local.get $0
   global.get $~lib/rt/itcms/fromSpace
   global.get $~lib/rt/itcms/white
   call $~lib/rt/itcms/Object#linkTo
  end
 )
 (func $~lib/rt/itcms/__collect
  global.get $~lib/rt/itcms/state
  i32.const 0
  i32.gt_s
  if
   loop $while-continue|0
    global.get $~lib/rt/itcms/state
    if
     call $~lib/rt/itcms/step
     drop
     br $while-continue|0
    end
   end
  end
  call $~lib/rt/itcms/step
  drop
  loop $while-continue|1
   global.get $~lib/rt/itcms/state
   if
    call $~lib/rt/itcms/step
    drop
    br $while-continue|1
   end
  end
  global.get $~lib/rt/itcms/total
  i64.extend_i32_u
  i64.const 200
  i64.mul
  i64.const 100
  i64.div_u
  i32.wrap_i64
  i32.const 1024
  i32.add
  global.set $~lib/rt/itcms/threshold
 )
 (func $assembly/commands/SlashCommandSpec~visit (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load
  local.tee $1
  if
   local.get $1
   call $~lib/rt/itcms/__visit
  end
  local.get $0
  i32.load offset=4
  local.tee $1
  if
   local.get $1
   call $~lib/rt/itcms/__visit
  end
  local.get $0
  i32.load offset=8
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
 )
 (func $assembly/session/ConversationMessage~visit (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.tee $1
  if
   local.get $1
   call $~lib/rt/itcms/__visit
  end
  local.get $0
  i32.load offset=8
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
 )
 (func $~lib/rt/__visit_members (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  block $folding-inner2
   block $folding-inner1
    block $folding-inner0
     block $invalid
      block $assembly/commands/SlashCommand
       block $assembly/commands/SlashCommandResult
        block $~lib/function/Function<%28~lib/string/String%2C~lib/string/String%29=>i32>
         block $assembly/compact/CompactionResult
          block $assembly/compact/CompactionConfig
           block $assembly/usage/TokenUsage
            block $assembly/session/ContentBlock
             block $assembly/session/ConversationMessage
              block $assembly/usage/ModelPricing
               block $~lib/array/Array<i32>
                block $assembly/commands/SlashCommandSpec
                 block $~lib/arraybuffer/ArrayBufferView
                  block $~lib/string/String
                   block $~lib/arraybuffer/ArrayBuffer
                    block $~lib/object/Object
                     local.get $0
                     i32.const 8
                     i32.sub
                     i32.load
                     br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $~lib/arraybuffer/ArrayBufferView $folding-inner0 $assembly/commands/SlashCommandSpec $folding-inner0 $~lib/array/Array<i32> $assembly/usage/ModelPricing $folding-inner1 $assembly/session/ConversationMessage $assembly/session/ContentBlock $folding-inner0 $assembly/usage/TokenUsage $folding-inner0 $assembly/compact/CompactionConfig $assembly/compact/CompactionResult $~lib/function/Function<%28~lib/string/String%2C~lib/string/String%29=>i32> $assembly/commands/SlashCommandResult $assembly/commands/SlashCommand $invalid
                    end
                    return
                   end
                   return
                  end
                  return
                 end
                 local.get $0
                 i32.load
                 local.tee $0
                 if
                  local.get $0
                  call $~lib/rt/itcms/__visit
                 end
                 return
                end
                local.get $0
                call $assembly/commands/SlashCommandSpec~visit
                return
               end
               global.get $~lib/memory/__stack_pointer
               i32.const 4
               i32.sub
               global.set $~lib/memory/__stack_pointer
               call $~stack_check
               global.get $~lib/memory/__stack_pointer
               i32.const 0
               i32.store
               br $folding-inner2
              end
              return
             end
             local.get $0
             call $assembly/session/ConversationMessage~visit
             return
            end
            local.get $0
            i32.load offset=4
            local.tee $1
            if
             local.get $1
             call $~lib/rt/itcms/__visit
            end
            local.get $0
            i32.load offset=8
            local.tee $1
            if
             local.get $1
             call $~lib/rt/itcms/__visit
            end
            local.get $0
            i32.load offset=12
            local.tee $1
            if
             local.get $1
             call $~lib/rt/itcms/__visit
            end
            local.get $0
            i32.load offset=16
            local.tee $1
            if
             local.get $1
             call $~lib/rt/itcms/__visit
            end
            local.get $0
            i32.load offset=20
            local.tee $1
            if
             local.get $1
             call $~lib/rt/itcms/__visit
            end
            local.get $0
            i32.load offset=24
            local.tee $1
            if
             local.get $1
             call $~lib/rt/itcms/__visit
            end
            local.get $0
            i32.load offset=28
            local.tee $0
            if
             local.get $0
             call $~lib/rt/itcms/__visit
            end
            return
           end
           return
          end
          return
         end
         local.get $0
         call $assembly/commands/SlashCommandSpec~visit
         return
        end
        global.get $~lib/memory/__stack_pointer
        i32.const 4
        i32.sub
        global.set $~lib/memory/__stack_pointer
        call $~stack_check
        global.get $~lib/memory/__stack_pointer
        i32.const 0
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        local.get $0
        i32.load offset=4
        call $~lib/rt/itcms/__visit
        global.get $~lib/memory/__stack_pointer
        i32.const 4
        i32.add
        global.set $~lib/memory/__stack_pointer
        return
       end
       local.get $0
       i32.load
       local.tee $1
       if
        local.get $1
        call $~lib/rt/itcms/__visit
       end
       br $folding-inner1
      end
      local.get $0
      call $assembly/session/ConversationMessage~visit
      return
     end
     unreachable
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 4
    i32.sub
    global.set $~lib/memory/__stack_pointer
    call $~stack_check
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.load offset=4
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $1
    local.get $0
    i32.load offset=12
    i32.const 2
    i32.shl
    i32.add
    local.set $2
    loop $while-continue|0
     local.get $1
     local.get $2
     i32.lt_u
     if
      local.get $1
      i32.load
      local.tee $3
      if
       local.get $3
       call $~lib/rt/itcms/__visit
      end
      local.get $1
      i32.const 4
      i32.add
      local.set $1
      br $while-continue|0
     end
    end
    br $folding-inner2
   end
   local.get $0
   i32.load offset=4
   local.tee $0
   if
    local.get $0
    call $~lib/rt/itcms/__visit
   end
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~start
  call $start:assembly/commands
 )
 (func $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 20116
  i32.lt_s
  if
   i32.const 52912
   i32.const 52960
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $assembly/commands/SlashCommandSpec#constructor (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 13
  i32.const 5
  call $~lib/rt/itcms/__new
  local.tee $4
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $4
  local.get $0
  call $assembly/commands/SlashCommandSpec#set:name
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $4
  local.get $1
  call $assembly/commands/SlashCommandSpec#set:summary
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $4
  local.get $2
  call $assembly/commands/SlashCommandSpec#set:argumentHint
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $3
  i32.store8 offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
 )
 (func $~lib/array/ensureCapacity (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=8
  local.tee $3
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   local.get $1
   i32.const 268435455
   i32.gt_u
   if
    i32.const 5680
    i32.const 5632
    i32.const 19
    i32.const 48
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load
   local.tee $2
   i32.const 1073741820
   local.get $3
   i32.const 1
   i32.shl
   local.tee $3
   local.get $3
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $3
   i32.const 8
   local.get $1
   local.get $1
   i32.const 8
   i32.le_u
   select
   i32.const 2
   i32.shl
   local.tee $1
   local.get $1
   local.get $3
   i32.lt_u
   select
   local.tee $1
   call $~lib/rt/itcms/__renew
   local.tee $3
   local.get $2
   i32.ne
   if
    local.get $0
    local.get $3
    i32.store
    local.get $0
    local.get $3
    i32.store offset=4
    local.get $0
    local.get $3
    i32.const 0
    call $~lib/rt/itcms/__link
   end
   local.get $0
   local.get $1
   i32.store offset=8
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    i32.const 1584
    i32.const 5632
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   local.tee $3
   call $~lib/array/ensureCapacity
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $3
   i32.store offset=12
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
  local.get $0
  local.get $2
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $start:assembly/commands
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  memory.size
  i32.const 16
  i32.shl
  i32.const 52884
  i32.sub
  i32.const 1
  i32.shr_u
  global.set $~lib/rt/itcms/threshold
  i32.const 1504
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/pinSpace
  i32.const 1536
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/toSpace
  i32.const 1680
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/fromSpace
  global.get $~lib/memory/__stack_pointer
  i32.const 22
  i32.const 6
  call $~lib/rt/__newArray
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 1792
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 1824
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.const 1792
  i32.const 1824
  i32.const 1904
  i32.const 1
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 1936
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 1968
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=16
  local.get $0
  i32.const 1
  i32.const 1936
  i32.const 1968
  i32.const 1904
  i32.const 1
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 2048
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 2096
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=16
  local.get $0
  i32.const 2
  i32.const 2048
  i32.const 2096
  i32.const 1904
  i32.const 1
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 2176
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 2208
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 2304
  i32.store offset=16
  local.get $0
  i32.const 3
  i32.const 2176
  i32.const 2208
  i32.const 2304
  i32.const 0
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 2352
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 2400
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 2512
  i32.store offset=16
  local.get $0
  i32.const 4
  i32.const 2352
  i32.const 2400
  i32.const 2512
  i32.const 0
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 2624
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 2656
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 2736
  i32.store offset=16
  local.get $0
  i32.const 5
  i32.const 2624
  i32.const 2656
  i32.const 2736
  i32.const 1
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 2784
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 2816
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=16
  local.get $0
  i32.const 6
  i32.const 2784
  i32.const 2816
  i32.const 1904
  i32.const 1
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 2928
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 2960
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 3056
  i32.store offset=16
  local.get $0
  i32.const 7
  i32.const 2928
  i32.const 2960
  i32.const 3056
  i32.const 0
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 3104
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 3136
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 3248
  i32.store offset=16
  local.get $0
  i32.const 8
  i32.const 3104
  i32.const 3136
  i32.const 3248
  i32.const 1
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 3312
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 3344
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=16
  local.get $0
  i32.const 9
  i32.const 3312
  i32.const 3344
  i32.const 1904
  i32.const 1
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 3456
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 3488
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=16
  local.get $0
  i32.const 10
  i32.const 3456
  i32.const 3488
  i32.const 1904
  i32.const 1
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 3600
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 3632
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=16
  local.get $0
  i32.const 11
  i32.const 3600
  i32.const 3632
  i32.const 1904
  i32.const 1
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 3744
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 3792
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=16
  local.get $0
  i32.const 12
  i32.const 3744
  i32.const 3792
  i32.const 1904
  i32.const 1
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 3888
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 3936
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 4032
  i32.store offset=16
  local.get $0
  i32.const 13
  i32.const 3888
  i32.const 3936
  i32.const 4032
  i32.const 0
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 4080
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 4112
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=16
  local.get $0
  i32.const 14
  i32.const 4080
  i32.const 4112
  i32.const 1904
  i32.const 0
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 4240
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 4272
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 4400
  i32.store offset=16
  local.get $0
  i32.const 15
  i32.const 4240
  i32.const 4272
  i32.const 4400
  i32.const 0
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 4448
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 4480
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 4400
  i32.store offset=16
  local.get $0
  i32.const 16
  i32.const 4448
  i32.const 4480
  i32.const 4400
  i32.const 0
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 4608
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 4656
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 4784
  i32.store offset=16
  local.get $0
  i32.const 17
  i32.const 4608
  i32.const 4656
  i32.const 4784
  i32.const 0
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 4816
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 4864
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 4992
  i32.store offset=16
  local.get $0
  i32.const 18
  i32.const 4816
  i32.const 4864
  i32.const 4992
  i32.const 0
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 5056
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 5120
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=16
  local.get $0
  i32.const 19
  i32.const 5056
  i32.const 5120
  i32.const 1904
  i32.const 0
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 5232
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 5264
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 5376
  i32.store offset=16
  local.get $0
  i32.const 20
  i32.const 5232
  i32.const 5264
  i32.const 5376
  i32.const 1
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 5408
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 5456
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 5552
  i32.store offset=16
  local.get $0
  i32.const 21
  i32.const 5408
  i32.const 5456
  i32.const 5552
  i32.const 0
  call $assembly/commands/SlashCommandSpec#constructor
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  local.get $0
  global.set $assembly/commands/SLASH_COMMAND_SPECS
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/string/String#toLowerCase (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  local.tee $7
  if
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.const 2
   i32.shl
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $6
   i32.store offset=4
   loop $for-loop|0
    local.get $3
    local.get $7
    i32.lt_u
    if
     local.get $0
     local.get $3
     i32.const 1
     i32.shl
     i32.add
     local.tee $1
     i32.load16_u
     local.tee $2
     i32.const 7
     i32.shr_u
     if
      block $for-continue|0
       local.get $2
       i32.const 55295
       i32.sub
       i32.const 1025
       i32.lt_u
       local.get $3
       local.get $7
       i32.const 1
       i32.sub
       i32.lt_u
       i32.and
       if
        local.get $1
        i32.load16_u offset=2
        local.tee $4
        i32.const 56319
        i32.sub
        i32.const 1025
        i32.lt_u
        if
         local.get $3
         i32.const 1
         i32.add
         local.set $3
         local.get $4
         i32.const 1023
         i32.and
         local.get $2
         local.tee $1
         i32.const 1023
         i32.and
         i32.const 10
         i32.shl
         i32.or
         i32.const 65536
         i32.add
         local.tee $2
         i32.const 131072
         i32.ge_u
         if
          local.get $6
          local.get $5
          i32.const 1
          i32.shl
          i32.add
          local.get $1
          local.get $4
          i32.const 16
          i32.shl
          i32.or
          i32.store
          local.get $5
          i32.const 1
          i32.add
          local.set $5
          br $for-continue|0
         end
        end
       end
       local.get $2
       i32.const 304
       i32.eq
       if
        local.get $6
        local.get $5
        i32.const 1
        i32.shl
        i32.add
        i32.const 50790505
        i32.store
        local.get $5
        i32.const 1
        i32.add
        local.set $5
       else
        local.get $2
        i32.const 931
        i32.eq
        if
         local.get $6
         local.get $5
         i32.const 1
         i32.shl
         i32.add
         i32.const 962
         i32.const 963
         local.get $7
         i32.const 1
         i32.gt_u
         if (result i32)
          block $~lib/util/string/isFinalSigma|inlined.0 (result i32)
           i32.const 0
           local.set $1
           local.get $3
           local.tee $2
           i32.const 30
           i32.sub
           local.tee $4
           i32.const 0
           local.get $4
           i32.const 0
           i32.ge_s
           select
           local.set $10
           loop $while-continue|1
            local.get $2
            local.get $10
            i32.gt_s
            if
             i32.const -1
             local.set $4
             block $~lib/util/string/codePointBefore|inlined.0
              local.get $2
              i32.const 0
              i32.le_s
              br_if $~lib/util/string/codePointBefore|inlined.0
              local.get $0
              local.get $2
              i32.const 1
              i32.sub
              i32.const 1
              i32.shl
              i32.add
              i32.load16_u
              local.tee $9
              i32.const 64512
              i32.and
              i32.const 56320
              i32.eq
              local.get $2
              i32.const 2
              i32.sub
              local.tee $4
              i32.const 0
              i32.ge_s
              i32.and
              if
               local.get $9
               i32.const 1023
               i32.and
               local.get $0
               local.get $4
               i32.const 1
               i32.shl
               i32.add
               i32.load16_u
               local.tee $8
               i32.const 1023
               i32.and
               i32.const 10
               i32.shl
               i32.add
               i32.const 65536
               i32.add
               local.set $4
               local.get $8
               i32.const 64512
               i32.and
               i32.const 55296
               i32.eq
               br_if $~lib/util/string/codePointBefore|inlined.0
              end
              i32.const 65533
              local.get $9
              local.get $9
              i32.const 63488
              i32.and
              i32.const 55296
              i32.eq
              select
              local.set $4
             end
             local.get $4
             i32.const 918000
             i32.lt_u
             if (result i32)
              i32.const 5708
              local.get $4
              call $~lib/util/string/stagedBinaryLookup
             else
              i32.const 0
             end
             i32.eqz
             if
              local.get $4
              i32.const 127370
              i32.lt_u
              if (result i32)
               i32.const 8716
               local.get $4
               call $~lib/util/string/stagedBinaryLookup
              else
               i32.const 0
              end
              if (result i32)
               i32.const 1
              else
               i32.const 0
               br $~lib/util/string/isFinalSigma|inlined.0
              end
              local.set $1
             end
             local.get $2
             local.get $4
             i32.const 65536
             i32.ge_s
             i32.const 1
             i32.add
             i32.sub
             local.set $2
             br $while-continue|1
            end
           end
           i32.const 0
           local.get $1
           i32.eqz
           br_if $~lib/util/string/isFinalSigma|inlined.0
           drop
           local.get $3
           i32.const 1
           i32.add
           local.tee $2
           i32.const 30
           i32.add
           local.tee $1
           local.get $7
           local.get $1
           local.get $7
           i32.lt_s
           select
           local.set $4
           loop $while-continue|2
            local.get $2
            local.get $4
            i32.lt_s
            if
             local.get $0
             local.get $2
             i32.const 1
             i32.shl
             i32.add
             local.tee $8
             i32.load16_u
             local.tee $1
             i32.const 64512
             i32.and
             i32.const 55296
             i32.eq
             local.get $2
             i32.const 1
             i32.add
             local.get $7
             i32.ne
             i32.and
             if
              local.get $8
              i32.load16_u offset=2
              local.tee $8
              i32.const 64512
              i32.and
              i32.const 56320
              i32.eq
              if
               local.get $1
               i32.const 10
               i32.shl
               local.get $8
               i32.add
               i32.const 56613888
               i32.sub
               local.set $1
              end
             end
             local.get $1
             i32.const 918000
             i32.lt_u
             if (result i32)
              i32.const 5708
              local.get $1
              call $~lib/util/string/stagedBinaryLookup
             else
              i32.const 0
             end
             i32.eqz
             if
              local.get $1
              i32.const 127370
              i32.lt_u
              if (result i32)
               i32.const 8716
               local.get $1
               call $~lib/util/string/stagedBinaryLookup
              else
               i32.const 0
              end
              i32.eqz
              br $~lib/util/string/isFinalSigma|inlined.0
             end
             local.get $2
             local.get $1
             i32.const 65536
             i32.ge_u
             i32.const 1
             i32.add
             i32.add
             local.set $2
             br $while-continue|2
            end
           end
           i32.const 1
          end
         else
          i32.const 0
         end
         select
         i32.store16
        else
         local.get $2
         i32.const 9398
         i32.sub
         i32.const 25
         i32.le_u
         if
          local.get $6
          local.get $5
          i32.const 1
          i32.shl
          i32.add
          local.get $2
          i32.const 26
          i32.add
          i32.store16
         else
          local.get $2
          call $~lib/util/casemap/casemap
          i32.const 2097151
          i32.and
          local.tee $1
          i32.const 65536
          i32.lt_u
          if
           local.get $6
           local.get $5
           i32.const 1
           i32.shl
           i32.add
           local.get $1
           i32.store16
          else
           local.get $6
           local.get $5
           i32.const 1
           i32.shl
           i32.add
           local.get $1
           i32.const 65536
           i32.sub
           local.tee $1
           i32.const 10
           i32.shr_u
           i32.const 55296
           i32.or
           local.get $1
           i32.const 1023
           i32.and
           i32.const 56320
           i32.or
           i32.const 16
           i32.shl
           i32.or
           i32.store
           local.get $5
           i32.const 1
           i32.add
           local.set $5
          end
         end
        end
       end
      end
     else
      local.get $6
      local.get $5
      i32.const 1
      i32.shl
      i32.add
      local.get $2
      local.get $2
      i32.const 65
      i32.sub
      i32.const 26
      i32.lt_u
      i32.const 5
      i32.shl
      i32.or
      i32.store16
     end
     local.get $3
     i32.const 1
     i32.add
     local.set $3
     local.get $5
     i32.const 1
     i32.add
     local.set $5
     br $for-loop|0
    end
   end
   local.get $6
   local.get $5
   i32.const 1
   i32.shl
   call $~lib/rt/itcms/__renew
   local.set $0
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String#indexOf (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  block $folding-inner1
   local.get $1
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   local.tee $3
   i32.eqz
   if
    i32.const 0
    local.set $2
    br $folding-inner1
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   local.tee $4
   if
    local.get $2
    i32.const 0
    local.get $2
    i32.const 0
    i32.gt_s
    select
    local.tee $2
    local.get $4
    local.get $2
    local.get $4
    i32.lt_s
    select
    local.set $2
    local.get $4
    local.get $3
    i32.sub
    local.set $4
    loop $for-loop|0
     local.get $2
     local.get $4
     i32.le_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=4
      local.get $0
      local.get $2
      local.get $1
      local.get $3
      call $~lib/util/string/compareImpl
      i32.eqz
      br_if $folding-inner1
      local.get $2
      i32.const 1
      i32.add
      local.set $2
      br $for-loop|0
     end
    end
   end
   i32.const -1
   local.set $2
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/string/String#includes (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/string/String#indexOf
  i32.const -1
  i32.ne
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/usage/ModelPricing#constructor (param $0 f64) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 32
  i32.const 8
  call $~lib/rt/itcms/__new
  local.tee $4
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $0
  f64.store
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $1
  f64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $2
  f64.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $3
  f64.store offset=24
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
 )
 (func $~lib/string/String#padStart (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const -2
  i32.and
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 15152
  i32.store
  i32.const 15148
  i32.load
  i32.const -2
  i32.and
  local.tee $2
  i32.eqz
  local.get $4
  i32.const 8
  i32.gt_u
  i32.or
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store offset=4
   i32.const 8
   local.get $4
   i32.sub
   local.tee $3
   local.get $2
   i32.gt_u
   if
    local.get $3
    local.get $3
    i32.const 2
    i32.sub
    local.get $2
    i32.div_u
    local.get $2
    i32.mul
    local.tee $6
    i32.sub
    local.set $7
    loop $while-continue|0
     local.get $5
     local.get $6
     i32.lt_u
     if
      local.get $1
      local.get $5
      i32.add
      i32.const 15152
      local.get $2
      memory.copy
      local.get $2
      local.get $5
      i32.add
      local.set $5
      br $while-continue|0
     end
    end
    local.get $1
    local.get $6
    i32.add
    i32.const 15152
    local.get $7
    memory.copy
   else
    local.get $1
    i32.const 15152
    local.get $3
    memory.copy
   end
   local.get $1
   local.get $3
   i32.add
   local.get $0
   local.get $4
   memory.copy
   local.get $1
   local.set $0
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String.__concat (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  local.tee $2
  i32.store
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const -2
  i32.and
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  block $__inlined_func$~lib/string/String#concat$101
   local.get $1
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const -2
   i32.and
   local.tee $4
   local.get $3
   i32.add
   local.tee $0
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 8
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 1904
    local.set $0
    br $__inlined_func$~lib/string/String#concat$101
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store offset=4
   local.get $0
   local.get $2
   local.get $3
   memory.copy
   local.get $0
   local.get $3
   i32.add
   local.get $1
   local.get $4
   memory.copy
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/usage/formatUsd (param $0 f64) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 28
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.set $1
  local.get $0
  f64.const 1e4
  f64.mul
  local.tee $0
  f64.ceil
  local.get $0
  f64.ceil
  f64.const -0.5
  f64.add
  local.get $0
  f64.gt
  f64.convert_i32_u
  f64.sub
  local.tee $0
  f64.abs
  i64.trunc_sat_f64_s
  i64.const 10000
  i64.rem_s
  call $~lib/util/number/itoa64
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 15152
  i32.store offset=4
  local.get $1
  local.get $2
  call $~lib/string/String#padStart
  local.tee $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 15280
  i32.store offset=20
  local.get $0
  f64.const 1e4
  f64.div
  i64.trunc_sat_f64_s
  call $~lib/util/number/itoa64
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=24
  i32.const 15280
  local.get $2
  call $~lib/string/String.__concat
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 15312
  i32.store offset=16
  local.get $2
  i32.const 15312
  call $~lib/string/String.__concat
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $2
  local.get $1
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/string/String.__eq (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  block $folding-inner0
   local.get $0
   local.get $1
   i32.eq
   if
    i32.const 1
    local.set $2
    br $folding-inner0
   end
   local.get $1
   i32.eqz
   local.get $0
   i32.eqz
   i32.or
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   local.get $3
   local.get $1
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   i32.ne
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   i32.const 0
   local.get $1
   local.get $3
   call $~lib/util/string/compareImpl
   i32.eqz
   local.set $2
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $assembly/session/messageRoleFromString (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 15344
  i32.store offset=4
  block $folding-inner0
   local.get $0
   i32.const 15344
   call $~lib/string/String.__eq
   if
    i32.const 0
    local.set $0
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 15376
   i32.store offset=4
   local.get $0
   i32.const 15376
   call $~lib/string/String.__eq
   if
    i32.const 1
    local.set $0
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 15408
   i32.store offset=4
   local.get $0
   i32.const 15408
   call $~lib/string/String.__eq
   if
    i32.const 2
    local.set $0
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 15456
   i32.store offset=4
   local.get $0
   i32.const 15456
   call $~lib/string/String.__eq
   if
    i32.const 3
    local.set $0
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 15536
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   i32.const 15536
   local.get $0
   call $~lib/string/String.__concat
   i32.const 15616
   i32.const 33
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/array/Array<assembly/session/ConversationMessage>#get:length (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=12
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/array/Array<assembly/session/ConversationMessage>#__get (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 1584
   i32.const 5632
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $0
  i32.store offset=4
  local.get $0
  i32.eqz
  if
   i32.const 16192
   i32.const 5632
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/compact/estimateMessageTokens (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  loop $for-loop|0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $3
   i32.store
   local.get $3
   call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
   local.get $2
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $3
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $3
    local.get $2
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.tee $3
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    block $break|1
     block $case2|1
      block $case1|1
       block $case0|1
        local.get $3
        i32.load8_u
        br_table $case0|1 $case1|1 $case2|1 $break|1
       end
       global.get $~lib/memory/__stack_pointer
       local.get $3
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $3
       i32.load offset=4
       local.tee $3
       i32.store
       local.get $1
       local.get $3
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 3
       i32.shr_u
       i32.const 1
       i32.add
       i32.add
       local.set $1
       br $break|1
      end
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.load offset=12
      local.tee $4
      i32.store
      local.get $4
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      local.set $4
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.load offset=16
      local.tee $3
      i32.store
      local.get $1
      local.get $4
      local.get $3
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      i32.add
      i32.const 4
      i32.div_s
      i32.const 1
      i32.add
      i32.add
      local.set $1
      br $break|1
     end
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.load offset=24
     local.tee $4
     i32.store
     local.get $4
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     local.set $4
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.load offset=28
     local.tee $3
     i32.store
     local.get $1
     local.get $4
     local.get $3
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     i32.add
     i32.const 4
     i32.div_s
     i32.const 1
     i32.add
     i32.add
     local.set $1
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $assembly/compact/estimateSessionTokens (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  loop $for-loop|0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $3
   i32.store
   local.get $3
   call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
   local.get $1
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $3
    i32.store offset=4
    local.get $3
    local.get $1
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    local.get $3
    call $assembly/compact/estimateMessageTokens
    local.get $2
    i32.add
    local.set $2
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $assembly/compact/shouldCompact (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store
  local.get $2
  call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $2
  local.get $1
  i32.load
  i32.gt_s
  if (result i32)
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $assembly/compact/estimateSessionTokens
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   local.get $0
   local.get $1
   i32.load offset=4
   i32.ge_s
  else
   i32.const 0
  end
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/compact/CompactionResult#constructor (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.const 16
  call $~lib/rt/itcms/__new
  local.tee $4
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $4
  local.get $0
  call $assembly/commands/SlashCommandSpec#set:name
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $4
  local.get $1
  call $assembly/commands/SlashCommandSpec#set:summary
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $4
  local.get $2
  call $assembly/commands/SlashCommandSpec#set:argumentHint
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
 )
 (func $~lib/array/Array<assembly/session/ConversationMessage>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.const 14
  call $~lib/rt/itcms/__new
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $assembly/commands/SlashCommandSpec#set:name
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 5680
   i32.const 5632
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  local.get $0
  local.get $0
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $3
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=12
  local.get $1
  local.get $2
  call $assembly/commands/SlashCommandSpec#set:name
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/array/Array<assembly/session/ContentBlock>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.const 12
  call $~lib/rt/itcms/__new
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $assembly/commands/SlashCommandSpec#set:name
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 5680
   i32.const 5632
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  local.get $0
  local.get $0
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $3
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=12
  local.get $1
  local.get $2
  call $assembly/commands/SlashCommandSpec#set:name
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $assembly/session/ConversationMessage#constructor (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.const 10
  call $~lib/rt/itcms/__new
  local.tee $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i32.const 0
  call $assembly/commands/SlashCommandSpec#set:summary
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i32.const 0
  call $assembly/commands/SlashCommandSpec#set:argumentHint
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $3
  local.get $1
  call $assembly/commands/SlashCommandSpec#set:summary
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $3
  local.get $2
  call $assembly/commands/SlashCommandSpec#set:argumentHint
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
 )
 (func $assembly/session/ConversationMessage#clone (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
  call $~lib/array/Array<assembly/session/ContentBlock>#constructor
  local.tee $2
  i32.store offset=8
  loop $for-loop|0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $3
   i32.store
   local.get $3
   call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
   local.get $1
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=16
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $3
    i32.store offset=12
    local.get $3
    local.get $1
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=4
    local.get $2
    local.get $1
    local.get $3
    call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=12
  local.get $0
  i32.load
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=12
  local.get $0
  i32.load offset=8
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=8
   local.tee $0
   i32.store offset=20
   local.get $0
   i32.eqz
   if
    i32.const 16320
    i32.const 15616
    i32.const 300
    i32.const 28
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   call $~stack_check
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=4
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=8
   local.set $6
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load offset=12
   local.set $1
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   call $~stack_check
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 16
   i32.const 13
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   local.get $4
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   local.get $5
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   local.get $6
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
  else
   i32.const 0
   local.set $0
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $3
  local.get $2
  local.get $0
  call $assembly/session/ConversationMessage#constructor
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/session/Session#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.const 9
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 0
  call $assembly/commands/SlashCommandSpec#set:summary
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $1
  i32.eqz
  if
   i32.const 0
   call $~lib/array/Array<assembly/session/ConversationMessage>#constructor
   local.set $1
  end
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $2
  local.get $1
  call $assembly/commands/SlashCommandSpec#set:summary
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $assembly/session/Session#clone (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
  call $~lib/array/Array<assembly/session/ConversationMessage>#constructor
  local.tee $2
  i32.store offset=8
  loop $for-loop|0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $3
   i32.store
   local.get $3
   call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
   local.get $1
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $3
    i32.store offset=16
    local.get $3
    local.get $1
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=12
    local.get $3
    call $assembly/session/ConversationMessage#clone
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=4
    local.get $2
    local.get $1
    local.get $3
    call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.load
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $0
  local.get $2
  call $assembly/session/Session#constructor
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/array/Array<assembly/session/ConversationMessage>#slice (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=12
  local.set $4
  local.get $1
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $1
   local.get $4
   i32.add
   local.tee $1
   i32.const 0
   local.get $1
   i32.const 0
   i32.gt_s
   select
  else
   local.get $1
   local.get $4
   local.get $1
   local.get $4
   i32.lt_s
   select
  end
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $2
   local.get $4
   i32.add
   local.tee $2
   i32.const 0
   local.get $2
   i32.const 0
   i32.gt_s
   select
  else
   local.get $2
   local.get $4
   local.get $2
   local.get $4
   i32.lt_s
   select
  end
  local.get $1
  i32.sub
  local.tee $2
  i32.const 0
  local.get $2
  i32.const 0
  i32.gt_s
  select
  local.tee $2
  i32.const 14
  call $~lib/rt/__newArray
  local.tee $4
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  i32.load offset=4
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.set $0
  local.get $2
  i32.const 2
  i32.shl
  local.set $1
  loop $while-continue|0
   local.get $1
   local.get $3
   i32.gt_u
   if
    local.get $3
    local.get $5
    i32.add
    local.get $0
    local.get $3
    i32.add
    i32.load
    local.tee $2
    i32.store
    local.get $4
    local.get $2
    i32.const 1
    call $~lib/rt/itcms/__link
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    br $while-continue|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
 )
 (func $~lib/array/Array<~lib/string/String>#constructor (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.const 4
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $assembly/commands/SlashCommandSpec#set:name
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 32
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=12
  local.get $0
  local.get $1
  call $assembly/commands/SlashCommandSpec#set:name
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 32
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/array/Array<~lib/string/String>#includes (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  block $folding-inner1
   local.get $0
   i32.load offset=12
   local.tee $3
   i32.eqz
   local.get $3
   i32.const 0
   i32.le_s
   i32.or
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.load offset=4
    local.set $0
    loop $while-continue|0
     local.get $2
     local.get $3
     i32.lt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      local.get $2
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee $4
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=4
      local.get $4
      local.get $1
      call $~lib/string/String.__eq
      br_if $folding-inner1
      local.get $2
      i32.const 1
      i32.add
      local.set $2
      br $while-continue|0
     end
    end
   end
   i32.const -1
   local.set $2
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  i32.const 0
  i32.ge_s
 )
 (func $~lib/array/Array<~lib/string/String>#push (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $0
  i32.load offset=12
  local.tee $2
  i32.const 1
  i32.add
  local.tee $3
  call $~lib/array/ensureCapacity
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store
  local.get $0
  local.get $1
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/util/sort/insertionSort<~lib/string/String> (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $1
  local.get $3
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.ge_s
   if
    local.get $3
    i32.const 1
    i32.sub
    local.set $5
    global.get $~lib/memory/__stack_pointer
    local.get $0
    local.get $3
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $6
    i32.store
    loop $while-continue|1
     local.get $1
     local.get $5
     i32.le_s
     if
      block $while-break|1
       global.get $~lib/memory/__stack_pointer
       local.get $0
       local.get $5
       i32.const 2
       i32.shl
       i32.add
       local.tee $8
       i32.load
       local.tee $7
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $6
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $7
       i32.store offset=12
       i32.const 2
       global.set $~argumentsLength
       local.get $6
       local.get $7
       local.get $4
       i32.load
       call_indirect (type $1)
       i32.const 0
       i32.ge_s
       br_if $while-break|1
       local.get $8
       local.get $7
       i32.store offset=4
       local.get $5
       i32.const 1
       i32.sub
       local.set $5
       br $while-continue|1
      end
     end
    end
    local.get $0
    local.get $5
    i32.const 2
    i32.shl
    i32.add
    local.get $6
    i32.store offset=4
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/util/sort/extendRunRight<~lib/string/String> (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  local.get $1
  local.get $2
  i32.ne
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   local.get $1
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $5
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   local.tee $4
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $6
   i32.store offset=4
   i32.const 2
   global.set $~argumentsLength
   local.get $5
   local.get $6
   local.get $3
   i32.load
   call_indirect (type $1)
   i32.const 0
   i32.gt_s
   if
    loop $while-continue|0
     local.get $2
     local.get $4
     i32.gt_s
     if (result i32)
      global.get $~lib/memory/__stack_pointer
      local.get $0
      local.get $4
      i32.const 2
      i32.shl
      i32.add
      local.tee $5
      i32.load offset=4
      local.tee $6
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $5
      i32.load
      local.tee $5
      i32.store offset=4
      i32.const 2
      global.set $~argumentsLength
      local.get $6
      local.get $5
      local.get $3
      i32.load
      call_indirect (type $1)
      i32.const 31
      i32.shr_u
     else
      i32.const 0
     end
     if
      local.get $4
      i32.const 1
      i32.add
      local.set $4
      br $while-continue|0
     end
    end
    local.get $4
    local.set $2
    loop $while-continue|1
     local.get $1
     local.get $2
     i32.lt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      local.get $1
      i32.const 2
      i32.shl
      i32.add
      local.tee $3
      i32.load
      local.tee $5
      i32.store offset=8
      local.get $3
      local.get $0
      local.get $2
      i32.const 2
      i32.shl
      i32.add
      local.tee $3
      i32.load
      i32.store
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      local.get $3
      local.get $5
      i32.store
      local.get $2
      i32.const 1
      i32.sub
      local.set $2
      br $while-continue|1
     end
    end
   else
    loop $while-continue|2
     local.get $2
     local.get $4
     i32.gt_s
     if (result i32)
      global.get $~lib/memory/__stack_pointer
      local.get $0
      local.get $4
      i32.const 2
      i32.shl
      i32.add
      local.tee $1
      i32.load offset=4
      local.tee $5
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.load
      local.tee $1
      i32.store offset=4
      i32.const 2
      global.set $~argumentsLength
      local.get $5
      local.get $1
      local.get $3
      i32.load
      call_indirect (type $1)
      i32.const 0
      i32.ge_s
     else
      i32.const 0
     end
     if
      local.get $4
      i32.const 1
      i32.add
      local.set $4
      br $while-continue|2
     end
    end
   end
   local.get $4
   local.set $1
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/util/sort/mergeRuns<~lib/string/String> (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  local.get $2
  i32.const 1
  i32.sub
  local.tee $6
  local.get $3
  i32.add
  local.set $7
  local.get $6
  i32.const 1
  i32.add
  local.set $2
  loop $for-loop|0
   local.get $1
   local.get $2
   i32.lt_s
   if
    local.get $2
    i32.const 1
    i32.sub
    local.tee $2
    i32.const 2
    i32.shl
    local.tee $8
    local.get $4
    i32.add
    local.get $0
    local.get $8
    i32.add
    i32.load
    i32.store
    br $for-loop|0
   end
  end
  loop $for-loop|1
   local.get $3
   local.get $6
   i32.gt_s
   if
    local.get $4
    local.get $7
    local.get $6
    i32.sub
    i32.const 2
    i32.shl
    i32.add
    local.get $0
    local.get $6
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    i32.store
    local.get $6
    i32.const 1
    i32.add
    local.set $6
    br $for-loop|1
   end
  end
  loop $for-loop|2
   local.get $1
   local.get $3
   i32.le_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $4
    local.get $6
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $7
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $4
    local.get $2
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $8
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $7
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $8
    i32.store offset=12
    i32.const 2
    global.set $~argumentsLength
    local.get $7
    local.get $8
    local.get $5
    i32.load
    call_indirect (type $1)
    i32.const 0
    i32.lt_s
    if
     local.get $0
     local.get $1
     i32.const 2
     i32.shl
     i32.add
     local.get $7
     i32.store
     local.get $6
     i32.const 1
     i32.sub
     local.set $6
    else
     local.get $0
     local.get $1
     i32.const 2
     i32.shl
     i32.add
     local.get $8
     i32.store
     local.get $2
     i32.const 1
     i32.add
     local.set $2
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|2
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/util/sort/SORT<~lib/string/String> (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i64)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $1
  i32.const 48
  i32.le_s
  if
   local.get $1
   i32.const 1
   i32.le_s
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 4
    i32.add
    global.set $~lib/memory/__stack_pointer
    return
   end
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $0
   i32.const 0
   local.get $1
   i32.const 1
   i32.sub
   i32.const 0
   local.get $2
   call $~lib/util/sort/insertionSort<~lib/string/String>
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 33
  local.get $1
  i32.clz
  i32.sub
  local.tee $6
  i32.const 2
  i32.shl
  local.tee $7
  i32.const 1
  i32.shl
  call $~lib/rt/tlsf/__alloc
  local.tee $13
  local.get $7
  i32.add
  local.set $12
  loop $for-loop|0
   local.get $4
   local.get $6
   i32.lt_u
   if
    local.get $13
    local.get $4
    i32.const 2
    i32.shl
    i32.add
    i32.const -1
    i32.store
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $1
  i32.const 2
  i32.shl
  call $~lib/rt/tlsf/__alloc
  local.set $11
  global.get $~lib/memory/__stack_pointer
  local.get $2
  local.tee $7
  i32.store
  local.get $0
  i32.const 0
  local.get $1
  i32.const 1
  i32.sub
  local.tee $14
  local.get $7
  call $~lib/util/sort/extendRunRight<~lib/string/String>
  local.tee $1
  i32.const 1
  i32.add
  local.tee $2
  i32.const 32
  i32.lt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   local.get $0
   i32.const 0
   i32.const 31
   local.get $14
   local.get $14
   i32.const 31
   i32.ge_s
   select
   local.tee $1
   local.get $2
   local.get $7
   call $~lib/util/sort/insertionSort<~lib/string/String>
  end
  loop $while-continue|1
   local.get $1
   local.get $14
   i32.lt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $7
    i32.store
    local.get $0
    local.get $1
    i32.const 1
    i32.add
    local.tee $2
    local.get $14
    local.get $7
    call $~lib/util/sort/extendRunRight<~lib/string/String>
    local.tee $4
    local.get $2
    i32.sub
    i32.const 1
    i32.add
    local.tee $6
    i32.const 32
    i32.lt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $7
     i32.store
     local.get $0
     local.get $2
     local.get $14
     local.get $2
     i32.const 31
     i32.add
     local.tee $4
     local.get $4
     local.get $14
     i32.gt_s
     select
     local.tee $4
     local.get $6
     local.get $7
     call $~lib/util/sort/insertionSort<~lib/string/String>
    end
    local.get $2
    local.get $3
    i32.add
    i64.extend_i32_u
    i64.const 30
    i64.shl
    local.get $14
    i32.const 1
    i32.add
    i64.extend_i32_u
    local.tee $10
    i64.div_u
    local.get $2
    local.get $4
    i32.add
    i32.const 1
    i32.add
    i64.extend_i32_u
    i64.const 30
    i64.shl
    local.get $10
    i64.div_u
    i64.xor
    i32.wrap_i64
    i32.clz
    local.set $6
    loop $for-loop|2
     local.get $5
     local.get $6
     i32.gt_u
     if
      local.get $5
      i32.const 2
      i32.shl
      local.tee $9
      local.get $13
      i32.add
      local.tee $8
      i32.load
      local.tee $15
      i32.const -1
      i32.ne
      if
       local.get $9
       local.get $12
       i32.add
       i32.load
       i32.const 1
       i32.add
       local.set $3
       global.get $~lib/memory/__stack_pointer
       local.get $7
       i32.store
       local.get $0
       local.get $15
       local.get $3
       local.get $1
       local.get $11
       local.get $7
       call $~lib/util/sort/mergeRuns<~lib/string/String>
       local.get $8
       i32.const -1
       i32.store
       local.get $15
       local.set $3
      end
      local.get $5
      i32.const 1
      i32.sub
      local.set $5
      br $for-loop|2
     end
    end
    local.get $6
    i32.const 2
    i32.shl
    local.tee $5
    local.get $13
    i32.add
    local.get $3
    i32.store
    local.get $5
    local.get $12
    i32.add
    local.get $1
    i32.store
    local.get $2
    local.set $3
    local.get $4
    local.set $1
    local.get $6
    local.set $5
    br $while-continue|1
   end
  end
  loop $for-loop|3
   local.get $5
   if
    local.get $5
    i32.const 2
    i32.shl
    local.tee $1
    local.get $13
    i32.add
    i32.load
    local.tee $2
    i32.const -1
    i32.ne
    if
     local.get $1
     local.get $12
     i32.add
     i32.load
     i32.const 1
     i32.add
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $7
     i32.store
     local.get $0
     local.get $2
     local.get $1
     local.get $14
     local.get $11
     local.get $7
     call $~lib/util/sort/mergeRuns<~lib/string/String>
    end
    local.get $5
    i32.const 1
    i32.sub
    local.set $5
    br $for-loop|3
   end
  end
  local.get $11
  call $~lib/rt/tlsf/__free
  local.get $13
  call $~lib/rt/tlsf/__free
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/util/sort/COMPARATOR<~lib/string/String>~anonymous|0 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  block $folding-inner0
   local.get $1
   i32.eqz
   local.get $0
   i32.eqz
   local.get $0
   local.get $1
   i32.eq
   i32.or
   i32.or
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   local.get $1
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   local.tee $3
   local.get $4
   i32.or
   i32.eqz
   br_if $folding-inner0
   local.get $4
   i32.eqz
   if
    i32.const -1
    local.set $2
    br $folding-inner0
   end
   local.get $3
   i32.eqz
   if
    i32.const 1
    local.set $2
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   i32.const 0
   local.get $1
   local.get $4
   local.get $3
   local.get $3
   local.get $4
   i32.gt_s
   select
   call $~lib/util/string/compareImpl
   local.tee $0
   local.get $4
   local.get $3
   i32.sub
   local.get $0
   select
   local.set $2
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/array/Array<~lib/string/String>#sort@varargs (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 16448
   local.set $1
   global.get $~lib/memory/__stack_pointer
   i32.const 16448
   i32.store
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.load offset=4
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.load offset=12
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $2
  local.get $0
  local.get $1
  call $~lib/util/sort/SORT<~lib/string/String>
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/string/String.__ne (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  i32.eqz
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/util/string/joinReferenceArray<~lib/string/String> (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  block $folding-inner0
   local.get $1
   i32.const 1
   i32.sub
   local.tee $4
   i32.const 0
   i32.lt_s
   if
    i32.const 1904
    local.set $0
    br $folding-inner0
   end
   local.get $4
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load
    local.tee $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    call $~lib/string/String.__ne
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
    else
     i32.const 1904
     local.set $0
    end
    br $folding-inner0
   end
   i32.const 1904
   local.set $1
   global.get $~lib/memory/__stack_pointer
   i32.const 1904
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   local.set $6
   loop $for-loop|0
    local.get $4
    local.get $5
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     local.get $5
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $3
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=4
     local.get $3
     call $~lib/string/String.__ne
     if
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=16
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=12
      global.get $~lib/memory/__stack_pointer
      local.get $1
      local.get $3
      call $~lib/string/String.__concat
      local.tee $1
      i32.store offset=8
     end
     local.get $6
     if
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=12
      global.get $~lib/memory/__stack_pointer
      local.get $1
      local.get $2
      call $~lib/string/String.__concat
      local.tee $1
      i32.store offset=8
     end
     local.get $5
     i32.const 1
     i32.add
     local.set $5
     br $for-loop|0
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   local.get $4
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   call $~lib/string/String.__ne
   if
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=16
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $1
    local.get $0
    call $~lib/string/String.__concat
    local.tee $1
    i32.store offset=8
   end
   local.get $1
   local.set $0
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/array/Array<~lib/string/String>#join (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=12
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $2
  local.get $0
  local.get $1
  call $~lib/util/string/joinReferenceArray<~lib/string/String>
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String#trim (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  local.tee $1
  i32.const 1
  i32.shl
  local.set $2
  loop $while-continue|0
   local.get $2
   if (result i32)
    local.get $0
    local.get $2
    i32.add
    i32.const 2
    i32.sub
    i32.load16_u
    call $~lib/util/string/isSpace
   else
    i32.const 0
   end
   if
    local.get $2
    i32.const 2
    i32.sub
    local.set $2
    br $while-continue|0
   end
  end
  loop $while-continue|1
   local.get $2
   local.get $3
   i32.gt_u
   if (result i32)
    local.get $0
    local.get $3
    i32.add
    i32.load16_u
    call $~lib/util/string/isSpace
   else
    i32.const 0
   end
   if
    local.get $3
    i32.const 2
    i32.add
    local.set $3
    local.get $2
    i32.const 2
    i32.sub
    local.set $2
    br $while-continue|1
   end
  end
  block $folding-inner0
   local.get $2
   i32.eqz
   if
    i32.const 1904
    local.set $0
    br $folding-inner0
   end
   local.get $3
   i32.eqz
   local.get $2
   local.get $1
   i32.const 1
   i32.shl
   i32.eq
   i32.and
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store offset=4
   local.get $1
   local.get $0
   local.get $3
   i32.add
   local.get $2
   memory.copy
   local.get $1
   local.set $0
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/compact/firstTextBlock (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  loop $for-loop|0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.store
   local.get $2
   call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
   local.get $1
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $2
    i32.store offset=4
    local.get $2
    local.get $1
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.set $2
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store
    local.get $2
    i32.load8_u
    if (result i32)
     i32.const 0
    else
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=4
     local.tee $2
     i32.store offset=12
     local.get $2
     local.get $1
     call $~lib/array/Array<assembly/session/ConversationMessage>#__get
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.load offset=4
     local.tee $2
     i32.store offset=4
     local.get $2
     call $~lib/string/String#trim
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $2
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
    end
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=4
     local.tee $0
     i32.store offset=4
     local.get $0
     local.get $1
     call $~lib/array/Array<assembly/session/ConversationMessage>#__get
     local.set $0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.load offset=4
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 20
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $0
     return
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 1904
 )
 (func $~lib/string/String#substring (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  i32.const 0
  local.get $1
  i32.const 0
  i32.gt_s
  select
  local.tee $3
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  local.tee $1
  local.get $1
  local.get $3
  i32.gt_s
  select
  local.tee $3
  local.get $2
  i32.const 0
  local.get $2
  i32.const 0
  i32.gt_s
  select
  local.tee $2
  local.get $1
  local.get $1
  local.get $2
  i32.gt_s
  select
  local.tee $2
  local.get $2
  local.get $3
  i32.gt_s
  select
  i32.const 1
  i32.shl
  local.set $4
  block $folding-inner0
   local.get $3
   local.get $2
   local.get $2
   local.get $3
   i32.lt_s
   select
   i32.const 1
   i32.shl
   local.tee $2
   local.get $4
   i32.sub
   local.tee $3
   i32.eqz
   if
    i32.const 1904
    local.set $0
    br $folding-inner0
   end
   local.get $4
   i32.eqz
   local.get $2
   local.get $1
   i32.const 1
   i32.shl
   i32.eq
   i32.and
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store offset=4
   local.get $1
   local.get $0
   local.get $4
   i32.add
   local.get $3
   memory.copy
   local.get $1
   local.set $0
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/compact/truncateSummary (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  local.get $1
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $0
   i32.const 0
   local.get $1
   call $~lib/string/String#substring
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 16960
   i32.store offset=4
   local.get $0
   i32.const 16960
   call $~lib/string/String.__concat
   local.set $0
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/array/Array<~lib/string/String>#reverse (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=12
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $0
  i32.const 1
  i32.gt_u
  if
   local.get $0
   i32.const 1
   i32.shr_u
   local.set $3
   local.get $0
   i32.const 1
   i32.sub
   local.set $0
   loop $while-continue|0
    local.get $1
    local.get $3
    i32.lt_u
    if
     global.get $~lib/memory/__stack_pointer
     local.get $2
     local.get $1
     i32.const 2
     i32.shl
     i32.add
     local.tee $4
     i32.load
     local.tee $5
     i32.store
     local.get $4
     local.get $2
     local.get $0
     local.get $1
     i32.sub
     i32.const 2
     i32.shl
     i32.add
     local.tee $4
     i32.load
     i32.store
     local.get $4
     local.get $5
     i32.store
     local.get $1
     i32.const 1
     i32.add
     local.set $1
     br $while-continue|0
    end
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/compact/collectRecentRoleSummaries (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  call $~lib/array/Array<~lib/string/String>#constructor
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
  i32.const 1
  i32.sub
  local.set $2
  loop $for-loop|0
   local.get $2
   i32.const 0
   i32.ge_s
   if (result i32)
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=4
    local.get $1
    call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
    i32.const 3
    i32.lt_s
   else
    i32.const 0
   end
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $0
    local.get $2
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=4
    local.get $3
    i32.load
    i32.const 1
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     local.set $4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $0
     local.get $2
     call $~lib/array/Array<assembly/session/ConversationMessage>#__get
     local.set $3
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=4
     local.get $4
     local.get $3
     call $assembly/compact/firstTextBlock
     local.tee $3
     i32.store offset=12
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=4
     local.get $3
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     if
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=16
      local.get $3
      i32.const 160
      call $assembly/compact/truncateSummary
      local.set $3
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=8
      local.get $1
      local.get $3
      call $~lib/array/Array<~lib/string/String>#push
     end
    end
    local.get $2
    i32.const 1
    i32.sub
    local.set $2
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $~lib/array/Array<~lib/string/String>#reverse
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $assembly/compact/inferPendingWork (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  global.get $~lib/memory/__stack_pointer
  call $~lib/array/Array<~lib/string/String>#constructor
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
  i32.const 1
  i32.sub
  local.set $2
  loop $for-loop|0
   local.get $2
   i32.const 0
   i32.ge_s
   if (result i32)
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=4
    local.get $1
    call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
    i32.const 3
    i32.lt_s
   else
    i32.const 0
   end
   if
    global.get $~lib/memory/__stack_pointer
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $0
    local.get $2
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.set $4
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=4
    local.get $3
    local.get $4
    call $assembly/compact/firstTextBlock
    local.tee $3
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=4
    local.get $3
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    if
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $3
     call $~lib/string/String#toLowerCase
     local.tee $4
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     i32.const 17104
     i32.store offset=8
     local.get $4
     i32.const 17104
     call $~lib/string/String#includes
     if (result i32)
      i32.const 1
     else
      global.get $~lib/memory/__stack_pointer
      local.get $4
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      i32.const 17136
      i32.store offset=8
      local.get $4
      i32.const 17136
      call $~lib/string/String#includes
     end
     if (result i32)
      i32.const 1
     else
      global.get $~lib/memory/__stack_pointer
      local.get $4
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      i32.const 17168
      i32.store offset=8
      local.get $4
      i32.const 17168
      call $~lib/string/String#includes
     end
     if (result i32)
      i32.const 1
     else
      global.get $~lib/memory/__stack_pointer
      local.get $4
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      i32.const 17216
      i32.store offset=8
      local.get $4
      i32.const 17216
      call $~lib/string/String#includes
     end
     if (result i32)
      i32.const 1
     else
      global.get $~lib/memory/__stack_pointer
      local.get $4
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      i32.const 17264
      i32.store offset=8
      local.get $4
      i32.const 17264
      call $~lib/string/String#includes
     end
     if
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=20
      local.get $3
      i32.const 160
      call $assembly/compact/truncateSummary
      local.set $3
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=8
      local.get $1
      local.get $3
      call $~lib/array/Array<~lib/string/String>#push
     end
    end
    local.get $2
    i32.const 1
    i32.sub
    local.set $2
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $~lib/array/Array<~lib/string/String>#reverse
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/string/String#split (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 40
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 40
  memory.fill
  block $folding-inner3
   block $folding-inner2
    block $folding-inner1
     block $folding-inner0
      local.get $2
      i32.eqz
      br_if $folding-inner0
      local.get $1
      i32.eqz
      if
       global.get $~lib/memory/__stack_pointer
       i32.const 1
       i32.const 4
       call $~lib/rt/__newArray
       local.tee $1
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $1
       i32.load offset=4
       i32.store offset=4
       local.get $1
       i32.const 0
       local.get $0
       call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
       global.get $~lib/memory/__stack_pointer
       i32.const 40
       i32.add
       global.set $~lib/memory/__stack_pointer
       local.get $1
       return
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=8
      local.get $0
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      local.set $6
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=8
      i32.const 2147483647
      local.get $2
      local.get $2
      i32.const 0
      i32.lt_s
      select
      local.set $8
      local.get $1
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      local.tee $4
      if
       local.get $6
       i32.eqz
       if
        global.get $~lib/memory/__stack_pointer
        i32.const 1
        i32.const 4
        call $~lib/rt/__newArray
        local.tee $0
        i32.store offset=20
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store offset=8
        local.get $0
        i32.load offset=4
        i32.const 1904
        i32.store
        br $folding-inner1
       end
      else
       local.get $6
       i32.eqz
       br_if $folding-inner0
       global.get $~lib/memory/__stack_pointer
       local.get $6
       local.get $8
       local.get $6
       local.get $8
       i32.lt_s
       select
       local.tee $3
       i32.const 4
       call $~lib/rt/__newArray
       local.tee $2
       i32.store offset=12
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=8
       local.get $2
       i32.load offset=4
       local.set $4
       i32.const 0
       local.set $1
       loop $for-loop|0
        local.get $1
        local.get $3
        i32.lt_s
        if
         global.get $~lib/memory/__stack_pointer
         i32.const 2
         i32.const 2
         call $~lib/rt/itcms/__new
         local.tee $5
         i32.store offset=16
         local.get $5
         local.get $0
         local.get $1
         i32.const 1
         i32.shl
         i32.add
         i32.load16_u
         i32.store16
         local.get $4
         local.get $1
         i32.const 2
         i32.shl
         i32.add
         local.get $5
         i32.store
         local.get $2
         local.get $5
         i32.const 1
         call $~lib/rt/itcms/__link
         local.get $1
         i32.const 1
         i32.add
         local.set $1
         br $for-loop|0
        end
       end
       br $folding-inner3
      end
      global.get $~lib/memory/__stack_pointer
      i32.const 0
      i32.const 4
      call $~lib/rt/__newArray
      local.tee $2
      i32.store offset=24
      loop $while-continue|1
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $1
       i32.store offset=28
       local.get $0
       local.get $1
       local.get $3
       call $~lib/string/String#indexOf
       local.tee $9
       i32.const -1
       i32.xor
       if
        local.get $9
        local.get $3
        i32.sub
        local.tee $7
        i32.const 0
        i32.gt_s
        if
         global.get $~lib/memory/__stack_pointer
         local.get $7
         i32.const 1
         i32.shl
         local.tee $10
         i32.const 2
         call $~lib/rt/itcms/__new
         local.tee $7
         i32.store offset=32
         local.get $7
         local.get $0
         local.get $3
         i32.const 1
         i32.shl
         i32.add
         local.get $10
         memory.copy
         global.get $~lib/memory/__stack_pointer
         local.get $2
         i32.store offset=8
         global.get $~lib/memory/__stack_pointer
         local.get $7
         i32.store offset=28
         local.get $2
         local.get $7
         call $~lib/array/Array<~lib/string/String>#push
        else
         global.get $~lib/memory/__stack_pointer
         local.get $2
         i32.store offset=8
         global.get $~lib/memory/__stack_pointer
         i32.const 1904
         i32.store offset=28
         local.get $2
         i32.const 1904
         call $~lib/array/Array<~lib/string/String>#push
        end
        local.get $5
        i32.const 1
        i32.add
        local.tee $5
        local.get $8
        i32.eq
        br_if $folding-inner2
        local.get $4
        local.get $9
        i32.add
        local.set $3
        br $while-continue|1
       end
      end
      local.get $3
      i32.eqz
      if
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=28
       local.get $2
       local.get $0
       call $~lib/array/Array<~lib/string/String>#push
       br $folding-inner2
      end
      local.get $6
      local.get $3
      i32.sub
      local.tee $1
      i32.const 0
      i32.gt_s
      if
       global.get $~lib/memory/__stack_pointer
       local.get $1
       i32.const 1
       i32.shl
       local.tee $1
       i32.const 2
       call $~lib/rt/itcms/__new
       local.tee $4
       i32.store offset=36
       local.get $4
       local.get $0
       local.get $3
       i32.const 1
       i32.shl
       i32.add
       local.get $1
       memory.copy
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $4
       i32.store offset=28
       local.get $2
       local.get $4
       call $~lib/array/Array<~lib/string/String>#push
      else
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       i32.const 1904
       i32.store offset=28
       local.get $2
       i32.const 1904
       call $~lib/array/Array<~lib/string/String>#push
      end
      br $folding-inner3
     end
     i32.const 0
     i32.const 4
     call $~lib/rt/__newArray
     local.set $0
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 40
    i32.add
    global.set $~lib/memory/__stack_pointer
    local.get $0
    return
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 40
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 40
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/string/String#split@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  block $2of2
   block $1of2
    block $0of2
     block $outOfRange
      global.get $~argumentsLength
      br_table $0of2 $1of2 $2of2 $outOfRange
     end
     unreachable
    end
    i32.const 0
    local.set $1
   end
   i32.const 2147483647
   local.set $2
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  local.get $2
  call $~lib/string/String#split
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String#charCodeAt (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  i32.ge_u
  if (result i32)
   i32.const -1
  else
   local.get $0
   local.get $1
   i32.const 1
   i32.shl
   i32.add
   i32.load16_u
  end
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String#substring@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 2147483647
   local.set $2
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $~lib/string/String#substring
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String#lastIndexOf (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 15312
  i32.store
  block $folding-inner1
   i32.const 15308
   i32.load
   i32.const 1
   i32.shr_u
   local.tee $2
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    local.set $1
    br $folding-inner1
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   local.tee $3
   if
    local.get $1
    i32.const 0
    local.get $1
    i32.const 0
    i32.gt_s
    select
    local.tee $1
    local.get $3
    local.get $2
    i32.sub
    local.tee $3
    local.get $1
    local.get $3
    i32.lt_s
    select
    local.set $1
    loop $for-loop|0
     local.get $1
     i32.const 0
     i32.ge_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      i32.const 15312
      i32.store offset=4
      local.get $0
      local.get $1
      i32.const 15312
      local.get $2
      call $~lib/util/string/compareImpl
      i32.eqz
      br_if $folding-inner1
      local.get $1
      i32.const 1
      i32.sub
      local.set $1
      br $for-loop|0
     end
    end
   end
   i32.const -1
   local.set $1
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $assembly/compact/hasInterestingExtension (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 15312
  i32.store offset=4
  i32.const 1
  global.set $~argumentsLength
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 2147483647
   local.set $1
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 15312
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/string/String#lastIndexOf
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  i32.const 0
  i32.lt_s
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 0
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  local.get $1
  i32.const 1
  i32.add
  call $~lib/string/String#substring@varargs
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $2
  local.get $0
  call $~lib/string/String#toLowerCase
  local.tee $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 1344
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  i32.const 1344
  local.get $0
  call $~lib/array/Array<~lib/string/String>#includes
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/compact/extractFileCandidates (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  call $~lib/array/Array<~lib/string/String>#constructor
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 17376
  i32.store offset=8
  i32.const 1
  global.set $~argumentsLength
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.const 17376
  call $~lib/string/String#split@varargs
  local.tee $1
  i32.store offset=12
  loop $for-loop|0
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
   local.get $3
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=8
    local.get $1
    local.get $3
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.set $4
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=4
    local.get $0
    local.get $4
    call $~lib/string/String#trim
    local.tee $0
    i32.store offset=16
    loop $while-continue|1
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     if
      block $while-break|1
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       local.get $0
       i32.const 0
       call $~lib/string/String#charCodeAt
       local.tee $4
       i32.const 46
       i32.eq
       local.get $4
       i32.const 44
       i32.eq
       i32.or
       local.get $4
       i32.const 58
       i32.eq
       i32.or
       local.get $4
       i32.const 59
       i32.eq
       i32.or
       local.get $4
       i32.const 41
       i32.eq
       i32.or
       local.get $4
       i32.const 40
       i32.eq
       i32.or
       local.get $4
       i32.const 34
       i32.eq
       i32.or
       local.get $4
       i32.const 39
       i32.eq
       i32.or
       local.get $4
       i32.const 96
       i32.eq
       i32.or
       i32.eqz
       br_if $while-break|1
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       i32.const 1
       global.set $~argumentsLength
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.const 1
       call $~lib/string/String#substring@varargs
       local.tee $0
       i32.store offset=16
       br $while-continue|1
      end
     end
    end
    loop $while-continue|2
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     if
      block $while-break|2
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=8
       local.get $0
       local.get $0
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 1
       i32.shr_u
       i32.const 1
       i32.sub
       call $~lib/string/String#charCodeAt
       local.tee $4
       i32.const 46
       i32.eq
       local.get $4
       i32.const 44
       i32.eq
       i32.or
       local.get $4
       i32.const 58
       i32.eq
       i32.or
       local.get $4
       i32.const 59
       i32.eq
       i32.or
       local.get $4
       i32.const 41
       i32.eq
       i32.or
       local.get $4
       i32.const 40
       i32.eq
       i32.or
       local.get $4
       i32.const 34
       i32.eq
       i32.or
       local.get $4
       i32.const 39
       i32.eq
       i32.or
       local.get $4
       i32.const 96
       i32.eq
       i32.or
       i32.eqz
       br_if $while-break|2
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=4
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=8
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.const 0
       local.get $0
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 1
       i32.shr_u
       i32.const 1
       i32.sub
       call $~lib/string/String#substring
       local.tee $0
       i32.store offset=16
       br $while-continue|2
      end
     end
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    i32.const 17408
    i32.store offset=8
    local.get $0
    i32.const 17408
    call $~lib/string/String#includes
    if (result i32)
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     call $assembly/compact/hasInterestingExtension
    else
     i32.const 0
    end
    if
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $2
     local.get $0
     call $~lib/array/Array<~lib/string/String>#push
    end
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/array/Array<~lib/string/String>#slice (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=12
  local.tee $2
  i32.const 0
  local.get $2
  i32.const 0
  i32.le_s
  select
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  local.get $2
  local.get $2
  i32.const 8
  i32.gt_s
  select
  local.get $3
  i32.sub
  local.tee $2
  i32.const 0
  local.get $2
  i32.const 0
  i32.gt_s
  select
  local.tee $4
  i32.const 4
  call $~lib/rt/__newArray
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  i32.load offset=4
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.get $3
  i32.const 2
  i32.shl
  i32.add
  local.set $0
  local.get $4
  i32.const 2
  i32.shl
  local.set $3
  loop $while-continue|0
   local.get $1
   local.get $3
   i32.lt_u
   if
    local.get $1
    local.get $5
    i32.add
    local.get $0
    local.get $1
    i32.add
    i32.load
    local.tee $4
    i32.store
    local.get $2
    local.get $4
    i32.const 1
    call $~lib/rt/itcms/__link
    local.get $1
    i32.const 4
    i32.add
    local.set $1
    br $while-continue|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $assembly/compact/collectKeyFiles (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 28
  memory.fill
  global.get $~lib/memory/__stack_pointer
  call $~lib/array/Array<~lib/string/String>#constructor
  local.tee $2
  i32.store
  loop $for-loop|0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
   local.get $4
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $0
    local.get $4
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=4
    local.get $1
    local.get $3
    i32.load offset=4
    local.tee $5
    i32.store offset=12
    i32.const 0
    local.set $3
    loop $for-loop|1
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=4
     local.get $5
     call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
     local.get $3
     i32.gt_s
     if
      i32.const 1904
      local.set $1
      global.get $~lib/memory/__stack_pointer
      i32.const 1904
      i32.store offset=16
      global.get $~lib/memory/__stack_pointer
      local.get $5
      i32.store offset=8
      local.get $5
      local.get $3
      call $~lib/array/Array<assembly/session/ConversationMessage>#__get
      local.set $6
      global.get $~lib/memory/__stack_pointer
      local.get $6
      i32.store offset=4
      block $break|2
       block $case2|2
        block $case1|2
         block $case0|2
          local.get $6
          i32.load8_u
          br_table $case0|2 $case1|2 $case2|2 $break|2
         end
         global.get $~lib/memory/__stack_pointer
         local.set $1
         global.get $~lib/memory/__stack_pointer
         local.get $5
         i32.store offset=8
         local.get $5
         local.get $3
         call $~lib/array/Array<assembly/session/ConversationMessage>#__get
         local.set $6
         global.get $~lib/memory/__stack_pointer
         local.get $6
         i32.store offset=4
         local.get $1
         local.get $6
         i32.load offset=4
         local.tee $1
         i32.store offset=16
         br $break|2
        end
        global.get $~lib/memory/__stack_pointer
        local.set $1
        global.get $~lib/memory/__stack_pointer
        local.get $5
        i32.store offset=8
        local.get $5
        local.get $3
        call $~lib/array/Array<assembly/session/ConversationMessage>#__get
        local.set $6
        global.get $~lib/memory/__stack_pointer
        local.get $6
        i32.store offset=4
        local.get $1
        local.get $6
        i32.load offset=16
        local.tee $1
        i32.store offset=16
        br $break|2
       end
       global.get $~lib/memory/__stack_pointer
       local.set $1
       global.get $~lib/memory/__stack_pointer
       local.get $5
       i32.store offset=8
       local.get $5
       local.get $3
       call $~lib/array/Array<assembly/session/ConversationMessage>#__get
       local.set $6
       global.get $~lib/memory/__stack_pointer
       local.get $6
       i32.store offset=4
       local.get $1
       local.get $6
       i32.load offset=28
       local.tee $1
       i32.store offset=16
      end
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $1
      call $assembly/compact/extractFileCandidates
      local.tee $6
      i32.store offset=20
      i32.const 0
      local.set $1
      loop $for-loop|3
       global.get $~lib/memory/__stack_pointer
       local.get $6
       i32.store offset=4
       local.get $6
       call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
       local.get $1
       i32.gt_s
       if
        global.get $~lib/memory/__stack_pointer
        local.get $2
        i32.store offset=4
        global.get $~lib/memory/__stack_pointer
        local.get $6
        i32.store offset=24
        local.get $6
        local.get $1
        call $~lib/array/Array<assembly/session/ConversationMessage>#__get
        local.set $7
        global.get $~lib/memory/__stack_pointer
        local.get $7
        i32.store offset=8
        local.get $2
        local.get $7
        call $~lib/array/Array<~lib/string/String>#includes
        i32.eqz
        if
         global.get $~lib/memory/__stack_pointer
         local.get $2
         i32.store offset=4
         global.get $~lib/memory/__stack_pointer
         local.get $6
         i32.store offset=24
         local.get $6
         local.get $1
         call $~lib/array/Array<assembly/session/ConversationMessage>#__get
         local.set $7
         global.get $~lib/memory/__stack_pointer
         local.get $7
         i32.store offset=8
         local.get $2
         local.get $7
         call $~lib/array/Array<~lib/string/String>#push
        end
        local.get $1
        i32.const 1
        i32.add
        local.set $1
        br $for-loop|3
       end
      end
      local.get $3
      i32.const 1
      i32.add
      local.set $3
      br $for-loop|1
     end
    end
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  i32.const 0
  global.set $~argumentsLength
  local.get $2
  call $~lib/array/Array<~lib/string/String>#sort@varargs
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
  i32.const 8
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $~lib/array/Array<~lib/string/String>#slice
   local.set $0
   global.get $~lib/memory/__stack_pointer
   i32.const 28
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $assembly/compact/inferCurrentWork (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
  i32.const 1
  i32.sub
  local.set $1
  block $folding-inner0 (result i32)
   loop $for-loop|0
    local.get $1
    i32.const 0
    i32.ge_s
    if
     global.get $~lib/memory/__stack_pointer
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $1
     call $~lib/array/Array<assembly/session/ConversationMessage>#__get
     local.set $3
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store
     local.get $2
     local.get $3
     call $assembly/compact/firstTextBlock
     local.tee $2
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=4
     local.get $2
     call $~lib/string/String#trim
     local.set $3
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store
     local.get $3
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     if
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      i32.const 200
      call $assembly/compact/truncateSummary
      br $folding-inner0
     end
     local.get $1
     i32.const 1
     i32.sub
     local.set $1
     br $for-loop|0
    end
   end
   i32.const 1904
  end
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/compact/summarizeBlock (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 40
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 40
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  block $break|0
   block $case3|0
    block $case2|0
     block $case1|0
      block $case0|0
       local.get $0
       i32.load8_u
       br_table $case0|0 $case1|0 $case2|0 $case3|0
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=4
      local.tee $0
      i32.store offset=4
      br $break|0
     end
     global.get $~lib/memory/__stack_pointer
     local.set $1
     global.get $~lib/memory/__stack_pointer
     i32.const 17648
     i32.store offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=36
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=12
     local.tee $2
     i32.store offset=32
     i32.const 17648
     local.get $2
     call $~lib/string/String.__concat
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=20
     global.get $~lib/memory/__stack_pointer
     i32.const 17696
     i32.store offset=24
     local.get $2
     i32.const 17696
     call $~lib/string/String.__concat
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=12
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=20
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=16
     local.tee $0
     i32.store offset=16
     local.get $2
     local.get $0
     call $~lib/string/String.__concat
     local.set $0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 17728
     i32.store offset=8
     local.get $1
     local.get $0
     i32.const 17728
     call $~lib/string/String.__concat
     local.tee $0
     i32.store offset=4
     br $break|0
    end
    global.get $~lib/memory/__stack_pointer
    local.set $2
    global.get $~lib/memory/__stack_pointer
    i32.const 17760
    i32.store offset=28
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=36
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=24
    local.tee $1
    i32.store offset=32
    i32.const 17760
    local.get $1
    call $~lib/string/String.__concat
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    i32.const 17808
    i32.store offset=24
    local.get $1
    i32.const 17808
    call $~lib/string/String.__concat
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    i32.const 17840
    i32.const 1904
    local.get $0
    i32.load8_u offset=32
    select
    local.tee $1
    i32.store offset=16
    local.get $3
    local.get $1
    call $~lib/string/String.__concat
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=28
    local.tee $0
    i32.store offset=8
    local.get $2
    local.get $1
    local.get $0
    call $~lib/string/String.__concat
    local.tee $0
    i32.store offset=4
    br $break|0
   end
   i32.const 1904
   local.set $0
   global.get $~lib/memory/__stack_pointer
   i32.const 1904
   i32.store offset=4
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 160
  call $assembly/compact/truncateSummary
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 40
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/compact/summarizeMessages (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 120
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 120
  memory.fill
  loop $for-loop|0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
   local.get $1
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    local.get $1
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    local.get $3
    i32.load
    i32.const 1
    i32.eq
    if
     local.get $5
     i32.const 1
     i32.add
     local.set $5
    else
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     local.get $1
     call $~lib/array/Array<assembly/session/ConversationMessage>#__get
     local.set $3
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store
     local.get $3
     i32.load
     i32.const 2
     i32.eq
     if
      local.get $6
      i32.const 1
      i32.add
      local.set $6
     else
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      local.get $0
      local.get $1
      call $~lib/array/Array<assembly/session/ConversationMessage>#__get
      local.set $3
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store
      local.get $4
      i32.const 1
      i32.add
      local.get $4
      local.get $3
      i32.load
      i32.const 3
      i32.eq
      select
      local.set $4
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  call $~lib/array/Array<~lib/string/String>#constructor
  local.tee $7
  i32.store offset=8
  loop $for-loop|1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
   local.get $2
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    local.get $2
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    local.get $1
    local.get $3
    i32.load offset=4
    local.tee $8
    i32.store offset=12
    i32.const 0
    local.set $3
    loop $for-loop|2
     global.get $~lib/memory/__stack_pointer
     local.get $8
     i32.store
     local.get $8
     call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
     local.get $3
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $8
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $8
      local.get $3
      call $~lib/array/Array<assembly/session/ConversationMessage>#__get
      local.tee $9
      i32.store offset=16
      i32.const 1904
      local.set $1
      global.get $~lib/memory/__stack_pointer
      i32.const 1904
      i32.store offset=20
      global.get $~lib/memory/__stack_pointer
      local.get $9
      i32.store
      local.get $9
      i32.load8_u
      i32.const 1
      i32.eq
      if
       global.get $~lib/memory/__stack_pointer
       local.get $9
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $9
       i32.load offset=12
       local.tee $1
       i32.store offset=20
      else
       global.get $~lib/memory/__stack_pointer
       local.get $9
       i32.store
       local.get $9
       i32.load8_u
       i32.const 2
       i32.eq
       if
        global.get $~lib/memory/__stack_pointer
        local.get $9
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $9
        i32.load offset=24
        local.tee $1
        i32.store offset=20
       end
      end
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store
      local.get $1
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      if (result i32)
       global.get $~lib/memory/__stack_pointer
       local.get $7
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $1
       i32.store offset=4
       local.get $7
       local.get $1
       call $~lib/array/Array<~lib/string/String>#includes
      else
       i32.const 1
      end
      i32.eqz
      if
       global.get $~lib/memory/__stack_pointer
       local.get $7
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $1
       i32.store offset=4
       local.get $7
       local.get $1
       call $~lib/array/Array<~lib/string/String>#push
      end
      local.get $3
      i32.const 1
      i32.add
      local.set $3
      br $for-loop|2
     end
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  i32.const 0
  global.set $~argumentsLength
  local.get $7
  call $~lib/array/Array<~lib/string/String>#sort@varargs
  global.get $~lib/memory/__stack_pointer
  call $~lib/array/Array<~lib/string/String>#constructor
  local.tee $3
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 16480
  i32.store offset=4
  local.get $3
  i32.const 16480
  call $~lib/array/Array<~lib/string/String>#push
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 16528
  i32.store offset=4
  local.get $3
  i32.const 16528
  call $~lib/array/Array<~lib/string/String>#push
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 16592
  i32.store offset=84
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=92
  local.get $0
  call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
  call $~lib/util/number/itoa32
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=88
  i32.const 16592
  local.get $1
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=76
  global.get $~lib/memory/__stack_pointer
  i32.const 16640
  i32.store offset=80
  local.get $1
  i32.const 16640
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=68
  local.get $5
  call $~lib/util/number/itoa32
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=72
  local.get $1
  local.get $2
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=60
  global.get $~lib/memory/__stack_pointer
  i32.const 16736
  i32.store offset=64
  local.get $1
  i32.const 16736
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=52
  local.get $6
  call $~lib/util/number/itoa32
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=56
  local.get $1
  local.get $2
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=44
  global.get $~lib/memory/__stack_pointer
  i32.const 16784
  i32.store offset=48
  local.get $1
  i32.const 16784
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=36
  local.get $4
  call $~lib/util/number/itoa32
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=40
  local.get $1
  local.get $2
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=28
  global.get $~lib/memory/__stack_pointer
  i32.const 16832
  i32.store offset=32
  local.get $1
  i32.const 16832
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $3
  local.get $1
  call $~lib/array/Array<~lib/string/String>#push
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
  i32.const 0
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 16864
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store offset=44
   global.get $~lib/memory/__stack_pointer
   i32.const 16928
   i32.store offset=48
   local.get $7
   i32.const 16928
   call $~lib/array/Array<~lib/string/String>#join
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=40
   i32.const 16864
   local.get $1
   call $~lib/string/String.__concat
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   i32.const 15312
   i32.store offset=32
   local.get $1
   i32.const 15312
   call $~lib/string/String.__concat
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $3
   local.get $1
   call $~lib/array/Array<~lib/string/String>#push
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $assembly/compact/collectRecentRoleSummaries
  local.tee $2
  i32.store offset=96
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
  i32.const 0
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 16992
   i32.store offset=4
   local.get $3
   i32.const 16992
   call $~lib/array/Array<~lib/string/String>#push
   i32.const 0
   local.set $1
   loop $for-loop|3
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store
    local.get $2
    call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
    local.get $1
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 17072
     i32.store offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=36
     local.get $2
     local.get $1
     call $~lib/array/Array<assembly/session/ConversationMessage>#__get
     local.set $4
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store offset=32
     i32.const 17072
     local.get $4
     call $~lib/string/String.__concat
     local.set $4
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store offset=4
     local.get $3
     local.get $4
     call $~lib/array/Array<~lib/string/String>#push
     local.get $1
     i32.const 1
     i32.add
     local.set $1
     br $for-loop|3
    end
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $assembly/compact/inferPendingWork
  local.tee $2
  i32.store offset=100
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
  i32.const 0
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 17312
   i32.store offset=4
   local.get $3
   i32.const 17312
   call $~lib/array/Array<~lib/string/String>#push
   i32.const 0
   local.set $1
   loop $for-loop|4
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store
    local.get $2
    call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
    local.get $1
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 17072
     i32.store offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=36
     local.get $2
     local.get $1
     call $~lib/array/Array<assembly/session/ConversationMessage>#__get
     local.set $4
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store offset=32
     i32.const 17072
     local.get $4
     call $~lib/string/String.__concat
     local.set $4
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store offset=4
     local.get $3
     local.get $4
     call $~lib/array/Array<~lib/string/String>#push
     local.get $1
     i32.const 1
     i32.add
     local.set $1
     br $for-loop|4
    end
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $assembly/compact/collectKeyFiles
  local.tee $1
  i32.store offset=104
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
  i32.const 0
  i32.gt_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 17440
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=44
   global.get $~lib/memory/__stack_pointer
   i32.const 16928
   i32.store offset=48
   local.get $1
   i32.const 16928
   call $~lib/array/Array<~lib/string/String>#join
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=40
   i32.const 17440
   local.get $1
   call $~lib/string/String.__concat
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   i32.const 15312
   i32.store offset=32
   local.get $1
   i32.const 15312
   call $~lib/string/String.__concat
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $3
   local.get $1
   call $~lib/array/Array<~lib/string/String>#push
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $assembly/compact/inferCurrentWork
  local.tee $1
  i32.store offset=108
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  if
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 17520
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=32
   i32.const 17520
   local.get $1
   call $~lib/string/String.__concat
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $3
   local.get $1
   call $~lib/array/Array<~lib/string/String>#push
  end
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 17584
  i32.store offset=4
  local.get $3
  i32.const 17584
  call $~lib/array/Array<~lib/string/String>#push
  i32.const 0
  local.set $1
  loop $for-loop|5
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
   local.get $1
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.set $2
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    local.get $1
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.set $4
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store
    local.get $2
    local.get $4
    i32.load
    call $assembly/session/messageRoleToString
    local.tee $4
    i32.store offset=112
    global.get $~lib/memory/__stack_pointer
    call $~lib/array/Array<~lib/string/String>#constructor
    local.tee $5
    i32.store offset=116
    i32.const 0
    local.set $2
    loop $for-loop|6
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=28
     local.get $0
     local.get $1
     call $~lib/array/Array<assembly/session/ConversationMessage>#__get
     local.set $6
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $6
     i32.load offset=4
     local.tee $6
     i32.store
     local.get $6
     call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
     local.get $2
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $5
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=40
      local.get $0
      local.get $1
      call $~lib/array/Array<assembly/session/ConversationMessage>#__get
      local.set $6
      global.get $~lib/memory/__stack_pointer
      local.get $6
      i32.store offset=36
      global.get $~lib/memory/__stack_pointer
      local.get $6
      i32.load offset=4
      local.tee $6
      i32.store offset=32
      local.get $6
      local.get $2
      call $~lib/array/Array<assembly/session/ConversationMessage>#__get
      local.set $6
      global.get $~lib/memory/__stack_pointer
      local.get $6
      i32.store offset=28
      local.get $6
      call $assembly/compact/summarizeBlock
      local.set $6
      global.get $~lib/memory/__stack_pointer
      local.get $6
      i32.store offset=4
      local.get $5
      local.get $6
      call $~lib/array/Array<~lib/string/String>#push
      local.get $2
      i32.const 1
      i32.add
      local.set $2
      br $for-loop|6
     end
    end
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 17072
    i32.store offset=44
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=48
    i32.const 17072
    local.get $4
    call $~lib/string/String.__concat
    local.set $2
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store offset=36
    global.get $~lib/memory/__stack_pointer
    i32.const 17808
    i32.store offset=40
    local.get $2
    i32.const 17808
    call $~lib/string/String.__concat
    local.set $2
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store offset=28
    global.get $~lib/memory/__stack_pointer
    local.get $5
    i32.store offset=36
    global.get $~lib/memory/__stack_pointer
    i32.const 17872
    i32.store offset=40
    local.get $5
    i32.const 17872
    call $~lib/array/Array<~lib/string/String>#join
    local.set $4
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=32
    local.get $2
    local.get $4
    call $~lib/string/String.__concat
    local.set $2
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store offset=4
    local.get $3
    local.get $2
    call $~lib/array/Array<~lib/string/String>#push
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|5
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 17904
  i32.store offset=4
  local.get $3
  i32.const 17904
  call $~lib/array/Array<~lib/string/String>#push
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 17952
  i32.store offset=4
  local.get $3
  i32.const 17952
  call $~lib/array/Array<~lib/string/String>#join
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 120
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/compact/stripTagBlock (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 18032
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 17984
  i32.store offset=12
  i32.const 18032
  i32.const 17984
  call $~lib/string/String.__concat
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 18064
  i32.store offset=4
  local.get $1
  local.get $2
  i32.const 18064
  call $~lib/string/String.__concat
  local.tee $1
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 18096
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 17984
  i32.store offset=12
  i32.const 18096
  i32.const 17984
  call $~lib/string/String.__concat
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 18064
  i32.store offset=4
  local.get $2
  local.get $3
  i32.const 18064
  call $~lib/string/String.__concat
  local.tee $2
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/string/String#indexOf
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $0
  local.get $2
  i32.const 0
  call $~lib/string/String#indexOf
  local.tee $3
  local.get $1
  i32.or
  i32.const 0
  i32.ge_s
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $0
   i32.const 0
   local.get $1
   call $~lib/string/String#substring
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=12
   local.get $3
   local.get $2
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   i32.add
   local.set $2
   i32.const 1
   global.set $~argumentsLength
   local.get $0
   local.get $2
   call $~lib/string/String#substring@varargs
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $1
   local.get $0
   call $~lib/string/String.__concat
   local.set $0
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/compact/extractTagBlock (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 18032
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 18128
  i32.store offset=12
  i32.const 18032
  i32.const 18128
  call $~lib/string/String.__concat
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 18064
  i32.store offset=4
  local.get $1
  local.get $2
  i32.const 18064
  call $~lib/string/String.__concat
  local.tee $1
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 18096
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 18128
  i32.store offset=12
  i32.const 18096
  i32.const 18128
  call $~lib/string/String.__concat
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 18064
  i32.store offset=4
  local.get $2
  local.get $3
  i32.const 18064
  call $~lib/string/String.__concat
  local.tee $2
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  block $folding-inner1 (result i32)
   block $folding-inner0
    local.get $0
    local.get $1
    i32.const 0
    call $~lib/string/String#indexOf
    local.tee $3
    i32.const 0
    i32.lt_s
    br_if $folding-inner0
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store
    local.get $3
    local.get $1
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    i32.add
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store offset=4
    local.get $0
    local.get $2
    local.get $1
    call $~lib/string/String#indexOf
    local.tee $2
    i32.const 0
    i32.lt_s
    br_if $folding-inner0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    local.get $1
    local.get $2
    call $~lib/string/String#substring
    br $folding-inner1
   end
   i32.const 1904
  end
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String#replace (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  block $folding-inner0 (result i32)
   local.get $4
   local.get $1
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   local.tee $3
   i32.le_u
   if
    local.get $3
    local.get $4
    i32.le_u
    if (result i32)
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $2
     local.get $0
     local.get $1
     local.get $0
     call $~lib/string/String.__eq
     select
    else
     local.get $0
    end
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $1
   i32.const 0
   call $~lib/string/String#indexOf
   local.tee $1
   i32.const -1
   i32.xor
   if (result i32)
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store
    local.get $4
    local.get $3
    i32.sub
    local.tee $6
    local.get $2
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    local.tee $5
    i32.add
    local.tee $4
    if (result i32)
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.const 1
     i32.shl
     i32.const 2
     call $~lib/rt/itcms/__new
     local.tee $7
     i32.store offset=8
     local.get $7
     local.get $0
     local.get $1
     i32.const 1
     i32.shl
     local.tee $4
     memory.copy
     local.get $4
     local.get $7
     i32.add
     local.get $2
     local.get $5
     i32.const 1
     i32.shl
     memory.copy
     local.get $7
     local.get $1
     local.get $5
     i32.add
     i32.const 1
     i32.shl
     i32.add
     local.get $0
     local.get $1
     local.get $3
     i32.add
     i32.const 1
     i32.shl
     i32.add
     local.get $6
     local.get $1
     i32.sub
     i32.const 1
     i32.shl
     memory.copy
     local.get $7
    else
     local.get $0
    end
   else
    local.get $0
   end
  end
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/compact/collapseBlankLines (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 28
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 17952
  i32.store offset=4
  i32.const 1
  global.set $~argumentsLength
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.const 17952
  call $~lib/string/String#split@varargs
  local.tee $0
  i32.store offset=8
  i32.const 1904
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=12
  loop $for-loop|0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
   local.get $3
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=16
    local.get $0
    local.get $3
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.set $4
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=4
    local.get $4
    call $~lib/string/String#trim
    local.set $4
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store
    local.get $1
    i32.const 0
    local.get $4
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    i32.eqz
    local.tee $4
    select
    i32.eqz
    if
     global.get $~lib/memory/__stack_pointer
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=24
     local.get $0
     local.get $3
     call $~lib/array/Array<assembly/session/ConversationMessage>#__get
     local.set $5
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     i32.const 17952
     i32.store offset=20
     local.get $5
     i32.const 17952
     call $~lib/string/String.__concat
     local.set $5
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=4
     local.get $1
     local.get $2
     local.get $5
     call $~lib/string/String.__concat
     local.tee $2
     i32.store offset=12
     local.get $4
     local.set $1
    end
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $assembly/compact/formatCompactSummary (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 40
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 40
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 17984
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $assembly/compact/stripTagBlock
  local.tee $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 18128
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $assembly/compact/extractTagBlock
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  if
   global.get $~lib/memory/__stack_pointer
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 16480
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=32
   i32.const 16480
   local.get $1
   call $~lib/string/String.__concat
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   i32.const 17904
   i32.store offset=24
   local.get $2
   i32.const 17904
   call $~lib/string/String.__concat
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 18176
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   call $~stack_check
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   local.get $1
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const -2
   i32.and
   local.set $2
   loop $while-continue|0
    local.get $2
    local.get $6
    i32.gt_u
    if (result i32)
     local.get $1
     local.get $6
     i32.add
     i32.load16_u
     call $~lib/util/string/isSpace
    else
     i32.const 0
    end
    if
     local.get $6
     i32.const 2
     i32.add
     local.set $6
     br $while-continue|0
    end
   end
   block $folding-inner0
    local.get $6
    i32.eqz
    br_if $folding-inner0
    local.get $2
    local.get $6
    i32.sub
    local.tee $4
    i32.eqz
    if
     i32.const 1904
     local.set $1
     br $folding-inner0
    end
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.const 2
    call $~lib/rt/itcms/__new
    local.tee $2
    i32.store offset=4
    local.get $2
    local.get $1
    local.get $6
    i32.add
    local.get $4
    memory.copy
    local.get $2
    local.set $1
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=24
   i32.const 18176
   local.get $1
   call $~lib/string/String.__concat
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=16
   local.get $3
   local.get $0
   local.get $5
   local.get $1
   call $~lib/string/String#replace
   local.tee $0
   i32.store offset=36
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=36
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $assembly/compact/collapseBlankLines
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/string/String#trim
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 40
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/compact/getCompactContinuationMessage (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 18224
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/compact/formatCompactSummary
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $3
  i32.const 18224
  local.get $0
  call $~lib/string/String.__concat
  local.tee $0
  i32.store offset=12
  local.get $2
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 18560
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.const 18560
   call $~lib/string/String.__concat
   local.tee $0
   i32.store offset=12
  end
  local.get $1
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 18672
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.const 18672
   call $~lib/string/String.__concat
   local.tee $0
   i32.store offset=12
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/session/ContentBlock#constructor (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 33
  i32.const 11
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $assembly/commands/SlashCommandSpec#set:summary
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $assembly/commands/SlashCommandSpec#set:argumentHint
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $assembly/session/ContentBlock#set:name
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $assembly/session/ContentBlock#set:input
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $assembly/session/ContentBlock#set:toolUseId
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $assembly/session/ContentBlock#set:toolName
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $assembly/session/ContentBlock#set:output
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8 offset=32
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=8
  local.get $0
  i32.const 1904
  call $assembly/commands/SlashCommandSpec#set:summary
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=8
  local.get $0
  i32.const 1904
  call $assembly/commands/SlashCommandSpec#set:argumentHint
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=8
  local.get $0
  i32.const 1904
  call $assembly/session/ContentBlock#set:name
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=8
  local.get $0
  i32.const 1904
  call $assembly/session/ContentBlock#set:input
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=8
  local.get $0
  i32.const 1904
  call $assembly/session/ContentBlock#set:toolUseId
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=8
  local.get $0
  i32.const 1904
  call $assembly/session/ContentBlock#set:toolName
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=8
  local.get $0
  i32.const 1904
  call $assembly/session/ContentBlock#set:output
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8 offset=32
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/compact/compactSession (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 52
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 52
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $assembly/compact/shouldCompact
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 1904
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 1904
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=12
   local.get $0
   call $assembly/session/Session#clone
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   i32.const 1904
   i32.const 1904
   local.get $0
   i32.const 0
   call $assembly/compact/CompactionResult#constructor
   local.set $0
   global.get $~lib/memory/__stack_pointer
   i32.const 52
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store
  local.get $3
  call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $3
  local.get $1
  i32.load
  i32.sub
  f64.convert_i32_s
  f64.const 0
  f64.max
  i32.trunc_sat_f64_s
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.const 0
  local.get $1
  call $~lib/array/Array<assembly/session/ConversationMessage>#slice
  local.tee $4
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $5
  i32.store
  i32.const 1
  global.set $~argumentsLength
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  block $2of2
   block $1of2
    block $0of2
     block $outOfRange
      global.get $~argumentsLength
      br_table $0of2 $1of2 $2of2 $outOfRange
     end
     unreachable
    end
    i32.const 0
    local.set $1
   end
   i32.const 2147483647
   local.set $2
  end
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $1
  local.get $2
  call $~lib/array/Array<assembly/session/ConversationMessage>#slice
  local.set $5
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  local.get $5
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $4
  call $assembly/compact/summarizeMessages
  local.tee $1
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $assembly/compact/formatCompactSummary
  local.tee $6
  i32.store offset=28
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.const 1
  local.get $5
  call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
  i32.const 0
  i32.gt_s
  call $assembly/compact/getCompactContinuationMessage
  local.tee $7
  i32.store offset=32
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  call $~lib/array/Array<assembly/session/ConversationMessage>#constructor
  local.tee $3
  i32.store offset=36
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1
  i32.const 12
  call $~lib/rt/__newArray
  local.tee $2
  i32.store offset=40
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.load offset=4
  i32.store offset=44
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  call $assembly/session/ContentBlock#constructor
  local.tee $8
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=8
  local.get $8
  local.get $7
  call $assembly/commands/SlashCommandSpec#set:summary
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  i32.const 0
  local.get $8
  call $~lib/array/Array<assembly/commands/SlashCommandSpec>#__set
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  i32.const 0
  local.get $2
  i32.const 0
  call $assembly/session/ConversationMessage#constructor
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $3
  local.get $2
  call $~lib/array/Array<~lib/string/String>#push
  i32.const 0
  local.set $2
  loop $for-loop|0
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
   local.get $2
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $5
    i32.store offset=8
    local.get $5
    local.get $2
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.set $7
    global.get $~lib/memory/__stack_pointer
    local.get $7
    i32.store offset=4
    local.get $3
    local.get $7
    call $~lib/array/Array<~lib/string/String>#push
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=48
  local.get $0
  i32.load
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  local.get $0
  local.get $3
  call $assembly/session/Session#constructor
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=12
  local.get $1
  local.get $6
  local.get $0
  local.get $4
  call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
  call $assembly/compact/CompactionResult#constructor
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 52
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/commands/resumeSupportedSlashCommands (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.const 6
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $assembly/commands/SlashCommandSpec#set:name
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 32
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  local.get $0
  local.get $3
  call $assembly/commands/SlashCommandSpec#set:name
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  local.get $3
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 32
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  local.get $0
  i32.store
  loop $for-loop|0
   global.get $~lib/memory/__stack_pointer
   global.get $assembly/commands/SLASH_COMMAND_SPECS
   local.tee $2
   i32.store offset=4
   local.get $2
   call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
   local.get $1
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    global.get $assembly/commands/SLASH_COMMAND_SPECS
    local.tee $2
    i32.store offset=8
    local.get $2
    local.get $1
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.set $2
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store offset=4
    local.get $2
    i32.load8_u offset=12
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     global.get $assembly/commands/SLASH_COMMAND_SPECS
     local.tee $2
     i32.store offset=12
     local.get $2
     local.get $1
     call $~lib/array/Array<assembly/session/ConversationMessage>#__get
     local.set $2
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=8
     local.get $0
     local.get $2
     call $~lib/array/Array<~lib/string/String>#push
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/commands/renderSlashCommandHelp (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 60
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 60
  memory.fill
  global.get $~lib/memory/__stack_pointer
  call $~lib/array/Array<~lib/string/String>#constructor
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 19280
  i32.store offset=8
  local.get $1
  i32.const 19280
  call $~lib/array/Array<~lib/string/String>#push
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 19328
  i32.store offset=8
  local.get $1
  i32.const 19328
  call $~lib/array/Array<~lib/string/String>#push
  loop $for-loop|0
   global.get $~lib/memory/__stack_pointer
   global.get $assembly/commands/SLASH_COMMAND_SPECS
   local.tee $0
   i32.store offset=4
   local.get $0
   call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
   local.get $2
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    global.get $assembly/commands/SLASH_COMMAND_SPECS
    local.tee $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    local.get $2
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.tee $3
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.load offset=8
    local.tee $0
    i32.store offset=4
    local.get $0
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    if
     global.get $~lib/memory/__stack_pointer
     local.set $4
     global.get $~lib/memory/__stack_pointer
     i32.const 17408
     i32.store offset=24
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=32
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.load
     local.tee $0
     i32.store offset=28
     i32.const 17408
     local.get $0
     call $~lib/string/String.__concat
     local.set $0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     i32.const 17376
     i32.store offset=20
     local.get $0
     i32.const 17376
     call $~lib/string/String.__concat
     local.set $5
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.load offset=8
     local.tee $0
     i32.store offset=8
     local.get $4
     local.get $5
     local.get $0
     call $~lib/string/String.__concat
     local.tee $0
     i32.store offset=36
    else
     global.get $~lib/memory/__stack_pointer
     i32.const 17408
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.load
     local.tee $0
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     i32.const 17408
     local.get $0
     call $~lib/string/String.__concat
     local.tee $0
     i32.store offset=36
    end
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    i32.const 19488
    i32.const 1904
    local.get $3
    i32.load8_u offset=12
    select
    local.tee $4
    i32.store offset=40
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    i32.const 19536
    i32.store offset=48
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=56
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.sub
    global.set $~lib/memory/__stack_pointer
    call $~stack_check
    global.get $~lib/memory/__stack_pointer
    i64.const 0
    i64.store
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    loop $while-continue|0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
     local.get $0
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     i32.const 20
     i32.lt_u
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      i32.const 17376
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.const 17376
      call $~lib/string/String.__concat
      local.tee $0
      i32.store
      br $while-continue|0
     end
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 12
    i32.add
    global.set $~lib/memory/__stack_pointer
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=52
    i32.const 19536
    local.get $0
    call $~lib/string/String.__concat
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=32
    global.get $~lib/memory/__stack_pointer
    i32.const 17376
    i32.store offset=44
    local.get $0
    i32.const 17376
    call $~lib/string/String.__concat
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=32
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.load offset=4
    local.tee $3
    i32.store offset=28
    local.get $0
    local.get $3
    call $~lib/string/String.__concat
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=16
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=20
    local.get $0
    local.get $4
    call $~lib/string/String.__concat
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $0
    call $~lib/array/Array<~lib/string/String>#push
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 17952
  i32.store offset=8
  local.get $1
  i32.const 17952
  call $~lib/array/Array<~lib/string/String>#join
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 60
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String#startsWith (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  local.set $3
  i32.const 0
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $3
  local.get $2
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  local.tee $3
  i32.add
  i32.lt_s
  if (result i32)
   i32.const 0
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   local.get $2
   local.get $1
   local.get $3
   call $~lib/util/string/compareImpl
   i32.eqz
  end
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/commands/splitWhitespace (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  call $~lib/array/Array<~lib/string/String>#constructor
  local.tee $2
  i32.store
  i32.const 1904
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=4
  loop $for-loop|0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $4
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   i32.lt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $0
    local.get $4
    call $~lib/string/String#charCodeAt
    local.tee $3
    i32.const 9
    i32.eq
    local.get $3
    i32.const 32
    i32.eq
    i32.or
    local.get $3
    i32.const 10
    i32.eq
    i32.or
    local.get $3
    i32.const 13
    i32.eq
    i32.or
    if
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=8
     local.get $1
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     if
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=12
      local.get $2
      local.get $1
      call $~lib/array/Array<~lib/string/String>#push
      global.get $~lib/memory/__stack_pointer
      i32.const 1904
      i32.store offset=4
      i32.const 1904
      local.set $1
     end
    else
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.set $6
     i32.const 1
     global.set $~argumentsLength
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.sub
     global.set $~lib/memory/__stack_pointer
     call $~stack_check
     global.get $~lib/memory/__stack_pointer
     i32.const 0
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 2
     i32.const 2
     call $~lib/rt/itcms/__new
     local.tee $5
     i32.store
     local.get $5
     local.get $3
     i32.store16
     global.get $~lib/memory/__stack_pointer
     i32.const 4
     i32.add
     global.set $~lib/memory/__stack_pointer
     global.get $~lib/memory/__stack_pointer
     local.get $5
     i32.store offset=12
     local.get $6
     local.get $1
     local.get $5
     call $~lib/string/String.__concat
     local.tee $1
     i32.store offset=4
    end
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  if
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=12
   local.get $2
   local.get $1
   call $~lib/array/Array<~lib/string/String>#push
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $assembly/commands/SlashCommand#constructor (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 13
  i32.const 19
  call $~lib/rt/itcms/__new
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $assembly/commands/SlashCommandSpec#set:summary
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $assembly/commands/SlashCommandSpec#set:argumentHint
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store8 offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=8
  local.get $1
  i32.const 1904
  call $assembly/commands/SlashCommandSpec#set:summary
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store offset=8
  local.get $1
  i32.const 1904
  call $assembly/commands/SlashCommandSpec#set:argumentHint
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store8 offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $assembly/commands/SlashCommand.parse (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 88
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 88
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/string/String#trim
  local.tee $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 17408
  i32.store offset=8
  block $folding-inner1
   block $folding-inner0
    local.get $1
    i32.const 17408
    call $~lib/string/String#startsWith
    i32.eqz
    br_if $folding-inner0
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store
    i32.const 1
    global.set $~argumentsLength
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.const 1
    call $~lib/string/String#substring@varargs
    local.tee $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    call $assembly/commands/splitWhitespace
    local.tee $2
    i32.store offset=16
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store
    local.get $2
    call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
    i32.eqz
    br_if $folding-inner0
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.const 0
    call $~lib/array/Array<assembly/session/ConversationMessage>#__get
    local.tee $0
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.set $3
    global.get $~lib/memory/__stack_pointer
    i32.const 24
    i32.sub
    global.set $~lib/memory/__stack_pointer
    call $~stack_check
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    i32.const 24
    memory.fill
    global.get $~lib/memory/__stack_pointer
    i32.const 17408
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    i32.const 17408
    local.get $0
    call $~lib/string/String.__concat
    local.tee $4
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $1
    call $~lib/string/String#trim
    local.tee $1
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=4
    block $folding-inner00
     local.get $1
     local.get $4
     call $~lib/string/String#startsWith
     i32.eqz
     if
      i32.const 1904
      local.set $1
      br $folding-inner00
     end
     global.get $~lib/memory/__stack_pointer
     local.set $5
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=4
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store offset=16
     local.get $4
     i32.const 20
     i32.sub
     i32.load offset=16
     i32.const 1
     i32.shr_u
     local.set $4
     i32.const 1
     global.set $~argumentsLength
     local.get $1
     local.get $4
     call $~lib/string/String#substring@varargs
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store
     local.get $5
     local.get $1
     call $~lib/string/String#trim
     local.tee $1
     i32.store offset=20
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 24
    i32.add
    global.set $~lib/memory/__stack_pointer
    local.get $3
    local.get $1
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 1792
    i32.store offset=8
    local.get $0
    i32.const 1792
    call $~lib/string/String.__eq
    if
     i32.const 0
     call $assembly/commands/SlashCommand#constructor
     local.set $0
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 1936
    i32.store offset=8
    local.get $0
    i32.const 1936
    call $~lib/string/String.__eq
    if
     i32.const 1
     call $assembly/commands/SlashCommand#constructor
     local.set $0
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 2048
    i32.store offset=8
    local.get $0
    i32.const 2048
    call $~lib/string/String.__eq
    if
     i32.const 2
     call $assembly/commands/SlashCommand#constructor
     local.set $0
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 2784
    i32.store offset=8
    local.get $0
    i32.const 2784
    call $~lib/string/String.__eq
    if
     i32.const 13
     call $assembly/commands/SlashCommand#constructor
     local.set $0
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 3312
    i32.store offset=8
    local.get $0
    i32.const 3312
    call $~lib/string/String.__eq
    if
     i32.const 16
     call $assembly/commands/SlashCommand#constructor
     local.set $0
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 3456
    i32.store offset=8
    local.get $0
    i32.const 3456
    call $~lib/string/String.__eq
    if
     i32.const 17
     call $assembly/commands/SlashCommand#constructor
     local.set $0
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 3600
    i32.store offset=8
    local.get $0
    i32.const 3600
    call $~lib/string/String.__eq
    if
     i32.const 18
     call $assembly/commands/SlashCommand#constructor
     local.set $0
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 3744
    i32.store offset=8
    local.get $0
    i32.const 3744
    call $~lib/string/String.__eq
    if
     i32.const 19
     call $assembly/commands/SlashCommand#constructor
     local.set $0
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 4080
    i32.store offset=8
    local.get $0
    i32.const 4080
    call $~lib/string/String.__eq
    if
     i32.const 4
     call $assembly/commands/SlashCommand#constructor
     local.set $0
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 5056
    i32.store offset=8
    local.get $0
    i32.const 5056
    call $~lib/string/String.__eq
    if
     i32.const 9
     call $assembly/commands/SlashCommand#constructor
     local.set $0
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 3888
    i32.store offset=8
    local.get $0
    i32.const 3888
    call $~lib/string/String.__eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 3
     call $assembly/commands/SlashCommand#constructor
     local.tee $0
     i32.store offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=8
     local.get $0
     local.get $1
     call $assembly/commands/SlashCommandSpec#set:summary
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 4240
    i32.store offset=8
    local.get $0
    i32.const 4240
    call $~lib/string/String.__eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 5
     call $assembly/commands/SlashCommand#constructor
     local.tee $0
     i32.store offset=32
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=8
     local.get $0
     local.get $1
     call $assembly/commands/SlashCommandSpec#set:summary
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 4448
    i32.store offset=8
    local.get $0
    i32.const 4448
    call $~lib/string/String.__eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 6
     call $assembly/commands/SlashCommand#constructor
     local.tee $0
     i32.store offset=36
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=8
     local.get $0
     local.get $1
     call $assembly/commands/SlashCommandSpec#set:summary
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 4608
    i32.store offset=8
    local.get $0
    i32.const 4608
    call $~lib/string/String.__eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 7
     call $assembly/commands/SlashCommand#constructor
     local.tee $0
     i32.store offset=40
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=8
     local.get $0
     local.get $1
     call $assembly/commands/SlashCommandSpec#set:summary
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 4816
    i32.store offset=8
    local.get $0
    i32.const 4816
    call $~lib/string/String.__eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 8
     call $assembly/commands/SlashCommand#constructor
     local.tee $0
     i32.store offset=44
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=8
     local.get $0
     local.get $1
     call $assembly/commands/SlashCommandSpec#set:summary
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 2176
    i32.store offset=8
    local.get $0
    i32.const 2176
    call $~lib/string/String.__eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 10
     call $assembly/commands/SlashCommand#constructor
     local.tee $0
     i32.store offset=48
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $2
     call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
     i32.const 1
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=52
      local.get $2
      i32.const 1
      call $~lib/array/Array<assembly/session/ConversationMessage>#__get
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=8
      local.get $0
      local.get $1
      call $assembly/commands/SlashCommandSpec#set:summary
     end
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 2352
    i32.store offset=8
    local.get $0
    i32.const 2352
    call $~lib/string/String.__eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 11
     call $assembly/commands/SlashCommand#constructor
     local.tee $0
     i32.store offset=56
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $2
     call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
     i32.const 1
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=52
      local.get $2
      i32.const 1
      call $~lib/array/Array<assembly/session/ConversationMessage>#__get
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=8
      local.get $0
      local.get $1
      call $assembly/commands/SlashCommandSpec#set:summary
     end
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 2624
    i32.store offset=8
    local.get $0
    i32.const 2624
    call $~lib/string/String.__eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     call $assembly/commands/SlashCommand#constructor
     local.tee $0
     i32.store offset=60
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=8
     local.get $0
     local.get $2
     call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
     i32.const 1
     i32.gt_s
     if (result i32)
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=64
      local.get $2
      i32.const 1
      call $~lib/array/Array<assembly/session/ConversationMessage>#__get
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      i32.const 19568
      i32.store offset=52
      local.get $1
      i32.const 19568
      call $~lib/string/String.__eq
     else
      i32.const 0
     end
     i32.store8 offset=12
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 2928
    i32.store offset=8
    local.get $0
    i32.const 2928
    call $~lib/string/String.__eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 14
     call $assembly/commands/SlashCommand#constructor
     local.tee $0
     i32.store offset=68
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $2
     call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
     i32.const 1
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=52
      local.get $2
      i32.const 1
      call $~lib/array/Array<assembly/session/ConversationMessage>#__get
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=8
      local.get $0
      local.get $1
      call $assembly/commands/SlashCommandSpec#set:summary
     end
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 3104
    i32.store offset=8
    local.get $0
    i32.const 3104
    call $~lib/string/String.__eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 15
     call $assembly/commands/SlashCommand#constructor
     local.tee $0
     i32.store offset=72
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $2
     call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
     i32.const 1
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=52
      local.get $2
      i32.const 1
      call $~lib/array/Array<assembly/session/ConversationMessage>#__get
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=8
      local.get $0
      local.get $1
      call $assembly/commands/SlashCommandSpec#set:summary
     end
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 5232
    i32.store offset=8
    local.get $0
    i32.const 5232
    call $~lib/string/String.__eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 20
     call $assembly/commands/SlashCommand#constructor
     local.tee $0
     i32.store offset=76
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $2
     call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
     i32.const 1
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=52
      local.get $2
      i32.const 1
      call $~lib/array/Array<assembly/session/ConversationMessage>#__get
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=8
      local.get $0
      local.get $1
      call $assembly/commands/SlashCommandSpec#set:summary
     end
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 5408
    i32.store offset=8
    local.get $0
    i32.const 5408
    call $~lib/string/String.__eq
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 21
     call $assembly/commands/SlashCommand#constructor
     local.tee $0
     i32.store offset=80
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $2
     call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
     i32.const 1
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=52
      local.get $2
      i32.const 1
      call $~lib/array/Array<assembly/session/ConversationMessage>#__get
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=8
      local.get $0
      local.get $1
      call $assembly/commands/SlashCommandSpec#set:summary
     end
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     local.get $2
     call $~lib/array/Array<assembly/session/ConversationMessage>#get:length
     i32.const 2
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=52
      local.get $2
      i32.const 2
      call $~lib/array/Array<assembly/session/ConversationMessage>#__get
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=8
      local.get $0
      local.get $1
      call $assembly/commands/SlashCommandSpec#set:argumentHint
     end
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 255
    call $assembly/commands/SlashCommand#constructor
    local.tee $1
    i32.store offset=84
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    local.get $1
    local.get $0
    call $assembly/commands/SlashCommandSpec#set:summary
    global.get $~lib/memory/__stack_pointer
    i32.const 88
    i32.add
    global.set $~lib/memory/__stack_pointer
    local.get $1
    return
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 88
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 0
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 88
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/commands/SlashCommandResult#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.const 18
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $2
  local.get $0
  call $assembly/commands/SlashCommandSpec#set:name
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $2
  local.get $1
  call $assembly/commands/SlashCommandSpec#set:summary
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $assembly/commands/handleSlashCommand (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 32
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 32
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $assembly/commands/SlashCommand.parse
  local.tee $0
  i32.store offset=4
  block $folding-inner1
   local.get $0
   i32.eqz
   br_if $folding-inner1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   block $folding-inner0
    local.get $0
    i32.load8_u
    i32.const 2
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=8
     global.get $~lib/memory/__stack_pointer
     local.get $1
     local.get $2
     call $assembly/compact/compactSession
     local.tee $0
     i32.store offset=12
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.load offset=12
     if
      global.get $~lib/memory/__stack_pointer
      local.set $1
      global.get $~lib/memory/__stack_pointer
      i32.const 19760
      i32.store offset=20
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=28
      local.get $0
      i32.load offset=12
      call $~lib/util/number/itoa32
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=24
      i32.const 19760
      local.get $2
      call $~lib/string/String.__concat
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      global.get $~lib/memory/__stack_pointer
      i32.const 19808
      i32.store offset=8
      local.get $1
      local.get $2
      i32.const 19808
      call $~lib/string/String.__concat
      local.tee $1
      i32.store offset=16
     else
      i32.const 19616
      local.set $1
      global.get $~lib/memory/__stack_pointer
      i32.const 19616
      i32.store offset=16
     end
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=20
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=8
     local.tee $0
     i32.store offset=8
     local.get $1
     local.get $0
     call $assembly/commands/SlashCommandResult#constructor
     local.set $0
     br $folding-inner0
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.load8_u
    i32.eqz
    if
     call $assembly/commands/renderSlashCommandHelp
     local.set $0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=20
     local.get $1
     call $assembly/session/Session#clone
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=8
     local.get $0
     local.get $1
     call $assembly/commands/SlashCommandResult#constructor
     local.set $0
     br $folding-inner0
    end
    br $folding-inner1
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 32
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 32
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $~lib/rt/__newArray (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.const 2
  i32.shl
  local.tee $3
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store
  i32.const 16
  local.get $1
  call $~lib/rt/itcms/__new
  local.tee $1
  local.get $2
  i32.store
  local.get $1
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $1
  local.get $3
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/util/number/itoa64 (param $0 i64) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $0
  i64.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 15152
   return
  end
  i64.const 0
  local.get $0
  i64.sub
  local.get $0
  local.get $0
  i64.const 63
  i64.shr_u
  i32.wrap_i64
  i32.const 1
  i32.shl
  local.tee $1
  select
  local.tee $0
  i64.const 4294967295
  i64.le_u
  if
   local.get $0
   i32.wrap_i64
   local.tee $2
   call $~lib/util/number/decimalCount32
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.const 1
   i32.shl
   local.get $1
   i32.add
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $3
   i32.store
   local.get $1
   local.get $3
   i32.add
   local.get $2
   local.get $4
   call $~lib/util/number/utoa_dec_simple<u32>
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i64.const 1000000000000000
   i64.lt_u
   if (result i32)
    local.get $0
    i64.const 100000000000
    i64.ge_u
    i32.const 10
    i32.add
    local.get $0
    i64.const 10000000000
    i64.ge_u
    i32.add
    local.get $0
    i64.const 100000000000000
    i64.ge_u
    i32.const 13
    i32.add
    local.get $0
    i64.const 10000000000000
    i64.ge_u
    i32.add
    local.get $0
    i64.const 1000000000000
    i64.lt_u
    select
   else
    local.get $0
    i64.const 10000000000000000
    i64.ge_u
    i32.const 16
    i32.add
    local.get $0
    i64.const -8446744073709551616
    i64.ge_u
    i32.const 18
    i32.add
    local.get $0
    i64.const 1000000000000000000
    i64.ge_u
    i32.add
    local.get $0
    i64.const 100000000000000000
    i64.lt_u
    select
   end
   local.tee $2
   i32.const 1
   i32.shl
   local.get $1
   i32.add
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $3
   i32.store
   local.get $1
   local.get $3
   i32.add
   local.set $4
   loop $do-loop|0
    local.get $4
    local.get $2
    i32.const 1
    i32.sub
    local.tee $2
    i32.const 1
    i32.shl
    i32.add
    local.get $0
    i64.const 10
    i64.rem_u
    i32.wrap_i64
    i32.const 48
    i32.add
    i32.store16
    local.get $0
    i64.const 10
    i64.div_u
    local.tee $0
    i64.const 0
    i64.ne
    br_if $do-loop|0
   end
  end
  local.get $1
  if
   local.get $3
   i32.const 45
   i32.store16
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
 )
 (func $~lib/util/number/itoa32 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  block $folding-inner0
   local.get $0
   i32.eqz
   if
    i32.const 15152
    local.set $0
    br $folding-inner0
   end
   i32.const 0
   local.get $0
   i32.sub
   local.get $0
   local.get $0
   i32.const 31
   i32.shr_u
   i32.const 1
   i32.shl
   local.tee $1
   select
   local.tee $3
   call $~lib/util/number/decimalCount32
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.const 1
   i32.shl
   local.get $1
   i32.add
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
   local.get $0
   local.get $1
   i32.add
   local.get $3
   local.get $2
   call $~lib/util/number/utoa_dec_simple<u32>
   local.get $1
   if
    local.get $0
    i32.const 45
    i32.store16
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/usage/pricingForModel (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/string/String#toLowerCase
  local.tee $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 14864
  i32.store offset=8
  block $__inlined_func$assembly/usage/pricingForModel$3
   block $folding-inner1 (result i32)
    local.get $0
    i32.const 14864
    call $~lib/string/String#includes
    if
     f64.const 1
     f64.const 5
     f64.const 1.25
     f64.const 0.1
     call $assembly/usage/ModelPricing#constructor
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 14896
    i32.store offset=8
    block $folding-inner0
     local.get $0
     i32.const 14896
     call $~lib/string/String#includes
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 14928
     i32.store offset=8
     local.get $0
     i32.const 14928
     call $~lib/string/String#includes
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     i32.const 12
     i32.add
     global.set $~lib/memory/__stack_pointer
     i32.const 0
     local.set $0
     br $__inlined_func$assembly/usage/pricingForModel$3
    end
    f64.const 15
    f64.const 75
    f64.const 18.75
    f64.const 1.5
    call $assembly/usage/ModelPricing#constructor
   end
   local.set $0
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/session/messageRoleFromString (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/session/messageRoleFromString
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/sandbox/filesystemIsolationModeFromStr (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 15920
  i32.store offset=4
  block $folding-inner0
   local.get $0
   i32.const 15920
   call $~lib/string/String.__eq
   if
    i32.const 0
    local.set $0
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 15952
   i32.store offset=4
   local.get $0
   i32.const 15952
   call $~lib/string/String.__eq
   if
    i32.const 1
    local.set $0
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 16000
   i32.store offset=4
   local.get $0
   i32.const 16000
   call $~lib/string/String.__eq
   if
    i32.const 2
    local.set $0
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 16048
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   i32.const 16048
   local.get $0
   call $~lib/string/String.__concat
   i32.const 16128
   i32.const 26
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/compact/compactSession (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $assembly/compact/compactSession
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/compact/estimateSessionTokens (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/compact/estimateSessionTokens
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/compact/shouldCompact (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $assembly/compact/shouldCompact
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/compact/formatCompactSummary (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/compact/formatCompactSummary
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/compact/getCompactContinuationMessage (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  local.get $2
  call $assembly/compact/getCompactContinuationMessage
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/commands/handleSlashCommand (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $0
  local.get $1
  local.get $2
  call $assembly/commands/handleSlashCommand
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
)
