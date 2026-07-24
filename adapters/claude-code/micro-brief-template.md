# Micro-brief template (controller → subagent)

This is [`../../reference/handoff-spec-template.md`](../../reference/handoff-spec-template.md)
at micro size — the handoff contract is scale-invariant, so no section is
dropped, only shortened to a sentence or two. Paste the filled brief as
the subagent's task prompt (the Dispatch switchpoint's crossing
artifact). An empty "Decisions already made" means the dispatch is not
ready, at this scale like any other.

```text
Handoff: <item ID + one-line title> · micro · <controller lane> → <subagent lane>

Goal: <one sentence: what exists when this dispatch returns.>
Context pointers: <the exact files the subagent must read; nothing else.>
Decisions already made: <every settled choice, one line each — this is
  what spares the subagent re-deriving them.>
Deliverables: <the exact files/sections the subagent may create or modify.>
Gates: <the check the controller runs on the returned report and diff
  before accepting it.>
Out of scope: <what the subagent must not touch, even if tempting.>

Standing escalation clause: if this work fails your lane's routing test,
stop and return early with what was learned — an early return is cheap;
pushing through is not.
```

A worked example at this scale lives in
[`../../reference/portable-method.md`](../../reference/portable-method.md)
§Layer 4 (the Q-17 status-table refresh brief).
