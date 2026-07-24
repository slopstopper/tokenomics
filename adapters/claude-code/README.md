# Claude Code adapter

Verified as of: **2026-07-24**, against Claude Code's local transcript
format and hooks system on that date. Everything in this directory is
**optional and opt-in** — nothing here installs by default, nothing is
bundled into the plugin manifest, and the portable method works without
any of it. This adapter reads harness internals that are not a public
contract; re-verify before relying on it (see the quarantine rule in
[`../README.md`](../README.md)).

## Contents

- [`sessionstart-hook.sh`](sessionstart-hook.sh) — injects the playbook
  pointer at session start, closing the gap where session-start
  discipline depended on the builder remembering the protocol.
- [`micro-brief-template.md`](micro-brief-template.md) — the
  handoff-spec contract at micro size, for controller→subagent
  dispatches.
- [`orchestration-recipe.md`](orchestration-recipe.md) — how a
  controller session runs the four switchpoints with native subagents,
  and the verified spend roll-up commands.

## Installing the SessionStart hook

The hook prints the playbook pointer to stdout; Claude Code injects a
SessionStart hook's stdout into the session's context. It fires on
`startup` and `clear` (fresh contexts), not on `resume` or `compact`
(where mid-task work is already in flight and "start on the next queue
item" would be the wrong nudge).

1. Copy the script into the adopting project:

   ```sh
   mkdir -p .claude/hooks
   cp adapters/claude-code/sessionstart-hook.sh .claude/hooks/tokenomics-sessionstart.sh
   chmod +x .claude/hooks/tokenomics-sessionstart.sh
   ```

2. Register it in the project's `.claude/settings.json` (create the file
   if it doesn't exist; merge the `hooks` key if it does):

   ```json
   {
     "hooks": {
       "SessionStart": [
         {
           "matcher": "startup|clear",
           "hooks": [
             {
               "type": "command",
               "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/tokenomics-sessionstart.sh"
             }
           ]
         }
       ]
     }
   }
   ```

3. If the project's playbook is not at the default
   `docs/model-effectiveness-playbook.md`, set `TOKENOMICS_PLAYBOOK` in
   the project's environment (e.g. via `env` in `.claude/settings.json`)
   to the real path. The hook stays silent when the playbook file does
   not exist, so installing it before bootstrapping the playbook is
   harmless.

## Uninstalling

Delete `.claude/hooks/tokenomics-sessionstart.sh` and remove the
`SessionStart` entry from `.claude/settings.json`. The hook keeps no
state.
