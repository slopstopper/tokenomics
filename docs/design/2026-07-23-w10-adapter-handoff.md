# Handoff spec: W10 — adapters/claude-code/ (Ring 2)

*A handoff spec is complete when the receiving tier can execute without
asking the sending tier anything and without re-deriving any decision.*

Standing escalation clause, part of every handoff at every scale: if the
work turns out to fail the receiving lane's routing test, stop and hand
back early with what was learned: an early return is cheap; pushing
through is not. For this item the likeliest escalation is the
extraction-recipe re-verification (see Decisions): that return is
expected to be cheap and is not a failure.

- Scale: meso (session→session)
- From lane: flagship → To lane: mid (escalate on recipe design)
- Date: 2026-07-23  ·  Playbook item: W10

## Goal

A new top-level `adapters/claude-code/` directory ships the first
executable ring: a quarantine README, a SessionStart hook that injects
the playbook pointer (closing G2 and absorbing W2), a micro-brief
template matching Layer 4's dispatch contract, and an orchestration
recipe that runs the four switchpoints with native subagents and
automates the spend roll-up. After W10, orchestrated sessions can
produce the verified evidence G9 waits on.

## Context pointers

- `docs/design/2026-07-23-switchpoints-design.md` §Ring 2 (the scope
  contract) and §Known risks (roll-up automation ordering).
- `reference/portable-method.md` §Switchpoints and §Layer 4's controller
  contract (what the recipe must operationalize).
- `reference/handoff-spec-template.md` (the micro-brief template derives
  from it: same sections, micro-sized).
- `docs/design/2026-07-06-spend-ledger-design.md` (spend-line format and
  the 2026-07-06 extraction recipe W10 re-verifies).
- Playbook rows W10, G2, G9.

## Decisions already made (do not re-derive)

- **Quarantine rule** heads the `adapters/` README: everything under
  `adapters/` is a dated implementation of the portable core; the method
  never depends on it (spec §Design constraints; same pattern as the
  method doc's dated model-mapping table).
- **Roll-up automation ships first**, before any convenience feature: an
  unautomated roll-up quietly rots and takes the falsifiability claim
  with it (spec §Known risks; final-review triage of the v0.4 branch).
- **The 2026-07-06 jq recipe has drifted**: verified 2026-07-23 during
  the W8 build, it under-reports subagent out-tokens on the current
  transcript format (observed: tens of tokens where harness usage
  blocks reported tens of thousands). W10 re-verifies against live
  transcripts and updates the recipe; harness-reported usage blocks are
  the accepted cross-check and fallback source. Recorded in the
  playbook's sixth-update spend line.
- **The hook is an optional extra with install notes, never a default**
  (W2's original framing, carried into the spec's Ring 2; everything in
  the adapter is opt-in).
- **The micro-brief template drops no section**: it is the scale-
  invariant handoff contract at micro size, per Layer 4's dispatch
  contract and the worked example already shipped in the method doc.
- **Honest-limit language carries over** from the spend-ledger spec: the
  adapter reads harness internals that are not a public contract; its
  job is to be re-verified, not trusted (spec §Ring 2).
- G2 closes with this item's PR number; G9 does not close here — it
  closes at the first post-W10 session that records a verified,
  recipe-extracted roll-up (playbook G9 status text).

## Deliverables

- `adapters/README.md`: the quarantine rule, one paragraph, plus the
  child listing.
- `adapters/claude-code/README.md`: install notes; dated "verified as
  of" line; the optional/opt-in framing.
- `adapters/claude-code/sessionstart-hook.*`: a SessionStart hook
  injecting the playbook pointer ("Read
  `docs/model-effectiveness-playbook.md`, then start on the next
  unclaimed item in the work queue that matches your lane."), with
  install/uninstall notes.
- `adapters/claude-code/micro-brief-template.md`: the dispatch-contract
  template for subagent briefs.
- `adapters/claude-code/orchestration-recipe.md`: how a controller
  session runs Route/Dispatch/Return/Close with native subagents,
  including the re-verified spend-extraction commands and the
  usage-block cross-check.

## Gates

- CI `gates` workflow green on the PR (links, privacy, quarantine,
  manifests; note the privacy gate bans home-directory paths in tracked
  Markdown: transcript paths in the recipe must be written relative to
  the home directory, e.g. `~/.claude/projects/...`).
- Hook verified by installing it in a scratch project and observing the
  injected pointer at session start; result recorded in the PR body.
- Recipe verified against at least one real transcript with subagent
  dispatches, numbers cross-checked against harness usage blocks;
  discrepancies recorded, not smoothed.
- Close per session protocol: W10 status, G2 closed with PR number, date
  line, spend line.

## Out of scope

- The recursive-spine interop (W11) and any second-harness adapter.
- Changes to `reference/portable-method.md`, the skills, or the
  templates: the adapter implements the shipped contract, it does not
  amend it.
- Making the hook a default or bundling it into the plugin manifest.
- Savings claims of any kind: the recipe records, never claims.
