# Adapters

**Quarantine rule.** Everything under `adapters/` is a dated
implementation of the portable core for one specific harness. The method
never depends on anything here: `reference/portable-method.md`, the
skills, and the templates are complete without it — the same quarantine
the lane names already apply to concrete model names. Adapters read
harness internals that are not a public contract; each one carries a
"verified as of" date, and its job is to be re-verified, not trusted. If
an adapter rots, the method has lost nothing.

## Children

- [`claude-code/`](claude-code/README.md) — Claude Code: an optional
  SessionStart hook that injects the playbook pointer, a micro-brief
  template for subagent dispatches, and an orchestration recipe with the
  automated spend roll-up.
