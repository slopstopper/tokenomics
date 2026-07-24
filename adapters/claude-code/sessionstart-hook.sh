#!/usr/bin/env sh
# tokenomics — Claude Code SessionStart hook.
#
# Emits the playbook pointer to stdout; Claude Code adds a SessionStart
# command hook's stdout to the opening session context. This enforces
# Layer 2, rule 2 ("open with the playbook pointer, not 'explore the repo'").
#
# Opt-in only: wire this via .claude/settings.json (see README.md). It is not
# a default and is not bundled into the plugin manifest. Re-verify against the
# harness's hook API after an update — this reads no internals, but the way a
# SessionStart hook's output reaches context is a harness detail, not a
# public contract.
#
# The pointer path is relative to the project root (the session's cwd).
# Override with TOKENOMICS_PLAYBOOK when the playbook lives elsewhere. The
# hook stays silent when the file doesn't exist (a pointer to a missing
# playbook is worse than none) and exits 0 either way, so it never blocks
# a session.
PLAYBOOK="${TOKENOMICS_PLAYBOOK:-docs/model-effectiveness-playbook.md}"

if [ -f "$PLAYBOOK" ]; then
  printf 'Read %s, then start on the next unclaimed item in the work queue that matches your lane.\n' "$PLAYBOOK"
fi

exit 0
