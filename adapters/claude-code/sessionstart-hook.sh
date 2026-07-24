#!/bin/sh
# tokenomics SessionStart hook — injects the playbook pointer at session
# start, so the session protocol no longer depends on the builder
# remembering it. Opt-in only; install/uninstall notes in README.md
# alongside this file.
#
# Claude Code runs SessionStart hooks from the project directory and
# injects their stdout into the session context. This script prints the
# pointer only when the playbook file actually exists, and exits 0
# either way so a missing playbook never blocks a session.

PLAYBOOK="${TOKENOMICS_PLAYBOOK:-docs/model-effectiveness-playbook.md}"

if [ -f "$PLAYBOOK" ]; then
  printf 'Read `%s`, then start on the next unclaimed item in the work queue that matches your lane.\n' "$PLAYBOOK"
fi

exit 0
