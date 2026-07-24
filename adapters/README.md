# Adapters

Everything under `adapters/` is a **dated implementation** of the portable
core (`../reference/portable-method.md`, the skills, the templates) for one
specific harness. The method never depends on any adapter: the switchpoints,
the routing test, the spend line, and the handoff contract are all
harness-neutral, and an adapter only wires them to the buttons a particular
tool actually has. This is the same quarantine the method already applies to
model names — concrete tools, like concrete model generations, turn over
faster than the rules do, so they live behind a boundary and carry a
"verified as of" date.

An adapter reads harness internals that are not a public contract. Its job is
to be **re-verified, not trusted**: when the harness changes its transcript
format or hook API, the adapter is what breaks, and the fix is local to this
directory.

## Children

| Adapter | Harness | What it ships |
| ------- | ------- | ------------- |
| [`claude-code/`](claude-code/README.md) | Claude Code | SessionStart playbook-pointer hook, a micro-brief template for subagent dispatches, and an orchestration recipe with an automated spend roll-up. |
