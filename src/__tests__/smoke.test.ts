import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { createRuntime } from "../runtime.js";

describe("@sschepis/as-agent", () => {
  it("loads the Wasm module and exposes runtime API", async () => {
    const rt = await createRuntime();

    // Enums are available
    assert.equal(rt.MessageRole.User, 1);
    assert.equal(rt.MessageRole.Assistant, 2);
    assert.equal(rt.PermissionMode.ReadOnly, 0);
    assert.equal(rt.BootstrapPhase.MainRuntime, 11);
    assert.equal(rt.ConfigSource.Project, 1);

    // Constants
    assert.equal(rt.CLAUDE_CODE_SETTINGS_SCHEMA_NAME, "SettingsSchema");
  });

  it("formats USD amounts", async () => {
    const rt = await createRuntime();
    assert.equal(rt.formatUsd(15.0), "$15.0000");
    assert.equal(rt.formatUsd(0.0015), "$0.0015");
    assert.equal(rt.formatUsd(0), "$0.0000");
  });

  it("converts message roles to strings and back", async () => {
    const rt = await createRuntime();
    assert.equal(rt.messageRoleToString(0), "system");
    assert.equal(rt.messageRoleToString(1), "user");
    assert.equal(rt.messageRoleToString(2), "assistant");
    assert.equal(rt.messageRoleToString(3), "tool");

    assert.equal(rt.messageRoleFromString("user"), 1);
    assert.equal(rt.messageRoleFromString("assistant"), 2);
  });

  it("converts permission modes to strings", async () => {
    const rt = await createRuntime();
    assert.equal(rt.permissionModeAsStr(0), "read-only");
    assert.equal(rt.permissionModeAsStr(1), "workspace-write");
    assert.equal(rt.permissionModeAsStr(2), "danger-full-access");
  });

  it("renders slash command help with all 22 commands", async () => {
    const rt = await createRuntime();
    const help = rt.renderSlashCommandHelp();

    assert.ok(help.includes("Slash commands"));
    assert.ok(help.includes("/help"));
    assert.ok(help.includes("/compact"));
    assert.ok(help.includes("/model"));
    assert.ok(help.includes("/commit"));
    assert.ok(help.includes("/ultraplan"));
    assert.ok(help.includes("/session"));

    const specs = rt.slashCommandSpecs();
    assert.equal(specs.length, 22);
  });

  it("formats compaction summaries", async () => {
    const rt = await createRuntime();
    const result = rt.formatCompactSummary(
      "<analysis>scratch</analysis>\n<summary>Kept work</summary>",
    );
    assert.equal(result, "Summary:\nKept work");
  });

  it("converts hook events to strings", async () => {
    const rt = await createRuntime();
    assert.equal(rt.hookEventAsStr(0), "PreToolUse");
    assert.equal(rt.hookEventAsStr(1), "PostToolUse");
  });

  it("gets resume-supported commands subset", async () => {
    const rt = await createRuntime();
    const resumable = rt.resumeSupportedSlashCommands();
    assert.equal(resumable.length, 11);
  });
});
