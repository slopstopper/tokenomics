# Claude Code adapter

*One implementation of the portable core (`../../reference/portable-method.md`)
for Claude Code. Everything here is optional and opt-in; the method does not
depend on any of it (see [`../README.md`](../README.md) for the quarantine
rule).*

**Verified as of 2026-07-24** against Claude Code's local transcript format
and hook API. These are internal formats, not a public contract — re-verify
after a harness update; the spend-extraction step in the recipe below tells
you how to tell when it has drifted.

## What's here

| File | Switchpoint it serves | What it does |
| ---- | --------------------- | ------------ |
| [`sessionstart-hook.sh`](sessionstart-hook.sh) | — (before Route) | Injects the playbook pointer as session context, so a session opens on the playbook instead of re-exploring the repo (Layer 2, rule 2). |
| [`micro-brief-template.md`](micro-brief-template.md) | Dispatch | The handoff-spec contract at micro size — what a controller hands a native subagent. |
| [`orchestration-recipe.md`](orchestration-recipe.md) | all four | How a controller session runs Route / Dispatch / Return / Close with native subagents, and reads (not estimates) the per-tier spend roll-up from the transcripts. |

## Installing the SessionStart hook

The hook is an **optional extra, never a default.** It is not wired into the
plugin manifest; you add it to a project yourself.

Add this to the project's `.claude/settings.json` (merge into any existing
`hooks` block):

```json
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "startup|clear",
        "hooks": [
          { "type": "command", "command": "sh adapters/claude-code/sessionstart-hook.sh" }
        ]
      }
    ]
  }
}
```

At session start Claude Code runs the command and adds its stdout to the
session context — here, the one-line instruction to read the playbook and
pick up the next queue item in the running lane. The `matcher` limits the
hook to fresh contexts (`startup` and `clear`): on `resume` and `compact`
work is already mid-item, and "start on the next unclaimed item" is the
wrong nudge there. The command path is relative
to the project root; adjust it if you vendor the adapter elsewhere. If the
playbook lives somewhere other than `docs/model-effectiveness-playbook.md`,
set `TOKENOMICS_PLAYBOOK` to the real path; the hook stays silent when the
file doesn't exist, so installing it before bootstrapping is harmless.

**Uninstall:** remove that `SessionStart` entry from `.claude/settings.json`
(or delete the whole `hooks` block if it holds nothing else). Nothing else in
the project references the hook.

**Verify:** run the script directly — `sh adapters/claude-code/sessionstart-hook.sh`
— and confirm it prints the playbook pointer; then start a fresh session in a
project that has it wired and confirm the pointer appears in the opening
context. Both are cheap checks; do them after any harness update.
