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
cat <<'POINTER'
Read docs/model-effectiveness-playbook.md, then start on the next
unclaimed item in the work queue that matches your lane.
POINTER
