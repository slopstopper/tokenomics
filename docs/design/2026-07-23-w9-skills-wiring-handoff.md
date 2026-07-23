# Handoff spec: W9 — skills wiring (switchpoints)

*A handoff spec is complete when the receiving tier can execute without
asking the sending tier anything and without re-deriving any decision.*

Standing escalation clause, part of every handoff at every scale: if the
work turns out to fail the receiving lane's routing test, stop and hand
back early with what was learned: an early return is cheap; pushing
through is not.

- Scale: meso (session→session)
- From lane: flagship → To lane: mid
- Date: 2026-07-23  ·  Playbook item: W9

## Goal

The three skills teach and apply the switchpoint taxonomy W8 shipped:
`tokenomics-method` teaches the four switchpoints alongside the four
layers; `tokenomics-handoff` names its modes as switchpoints and gains
Return-side early-return guidance; `tokenomics-bootstrap` interviews for
orchestration. G8's skills half closes.

## Context pointers

- `docs/design/2026-07-23-switchpoints-design.md` §Ring 1c (the scope
  contract for this item) and §Known risks (ceremony risk: wire in the
  minimum that teaches, not a ritual per switchpoint).
- `reference/portable-method.md` §Switchpoints (the taxonomy table) and
  §Layer 4's controller contract (the four rule names).
- The three `skills/*/SKILL.md` as they stand on `main` now: PR #12
  swept them since the spec was written (punctuation: colons, not
  em-dashes) and touched bootstrap's interview wording.
- Playbook row W9 in `docs/model-effectiveness-playbook.md`.

## Decisions already made (do not re-derive)

- Names are exactly **Route, Dispatch, Return, Close**; collective noun
  **switchpoints**, one word, lowercase mid-sentence (spec §Ring 1a;
  chosen over "moments" to avoid colliding with recursive-spine's
  moments map).
- Mode mapping is fixed: handoff skill Mode A *is* the Dispatch
  switchpoint, Mode B *is* the Close switchpoint: label them as such
  rather than inventing new modes (spec §Ring 1c).
- Return guidance lives in the handoff skill (the tier that writes
  handoffs is the tier that recognizes a failing lane test mid-cycle);
  its artifact is the early-return escalation artifact of
  §Switchpoints, and it lands one level up, never further.
- Bootstrap's new interview section asks orchestration questions only
  (sub-agents available? controller pattern in use?); the
  recursive-spine interop mode is **W11**, not W9 (spec §Ring 1c states
  the exclusion).
- Skills point at the method doc's shipped text; they never restate the
  taxonomy at length: no new doctrine may enter via skill prose (spec
  §Design constraints, "names, not inventions").
- Controller-contract rule names are fixed vocabulary: **controller
  discipline, dispatch contract, parallelism rule, surfacing rule**
  (shipped in Layer 4; teach by these names).
- Style: skills use colon punctuation post-PR #12; do not reintroduce
  em-dashes into skill files.
- Frontmatter `description` fields may be updated to mention
  switchpoints, but `name` fields must keep matching their directories
  (CI gate).

## Deliverables

- `skills/tokenomics-method/SKILL.md`: a compact switchpoints teaching
  block (the four names, trigger → rule → artifact shape, pointer to
  §Switchpoints); description frontmatter updated to include them.
- `skills/tokenomics-handoff/SKILL.md`: Mode A/B labeled as
  Dispatch/Close; a short Return subsection (recognize the failing lane
  test mid-cycle; write the early-return artifact: what was tried, what
  broke, what decision is needed; hand up one level).
- `skills/tokenomics-bootstrap/SKILL.md`: one orchestration interview
  section whose answers land in the generated playbook's model-routing
  section; no interop questions.

## Gates

- CI `gates` workflow green on the PR: skill frontmatter names match
  directories, frontmatter YAML valid, relative links resolve, privacy
  sweep clean, no concrete model names outside the method doc.
- Self-check before PR: every switchpoint or rule name used in a skill
  appears verbatim in `reference/portable-method.md` (no new doctrine).
- Close per session protocol: W9 status, G8 status, date line, spend
  line.

## Out of scope

- The recursive-spine interop mode (W11) and `adapters/` (W10).
- `reference/portable-method.md`, the templates, and the examples.
- Any playbook edit beyond the session-close ledger update.
- Em-dash reintroduction or broader style edits to the skills.
