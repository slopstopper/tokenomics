# Changelog

All notable changes to tokenomics. Format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/); versions are
pre-1.0 SemVer (a change to method semantics or a new capability bumps the
minor; fix-only bumps the patch).

**v0.4.0 is the first tagged release.** v0.1.0 through v0.3.2 were
version-labelled in commits and the manifest but never tagged or released;
their entries below are reconstructed from the playbook's done ledger and
the merged PRs, and are kept for the record, not as installable versions.

## [Unreleased]

### Added

- **Skill-text evals**: `scripts/skill-eval.sh` (transplanted from
  recursive-spine's `spine-eval.sh`) checks 48 anchored assertions in
  `evals/*.json` against the three skills on every PR: the verbatim routing
  test, the invent-nothing rules, the never-claim rules, early return, and
  the switchpoint order. Coverage is 3/3 skills and may not regress. These
  check that the doctrine is still written down, not that a model follows
  it; behavioural evals wait on #25.
- **Provisional spend-line fields, gathered in this repo only**
  (`docs/design/2026-10-03-spend-line-gathering.md`): effort, cache split,
  compactions, escalation cause, dispatch tiers, and a cf-flagship figure
  from the harness's list-price cost record. Adopter-facing changes wait for
  v0.5.0 and the data. First extraction found that native subagent dispatch
  silently inherits the controller's tier, and that subagent output tokens
  are not recoverable from subagent transcripts (G12).
- **Boundary nudges, skill text** (W15 step 1,
  [#30](https://github.com/slopstopper/tokenomics/issues/30)): at Dispatch,
  Return, and Close the tokenomics-handoff skill re-scores the operator's
  own session and may suggest clearing it, compacting it, or switching its
  tier. The agent leads: it speaks up whenever the re-score says change,
  at every boundary and on long-cycle signs, dispatches lower-class work
  to the mapped tier itself, and gets the operator's own commands (clear,
  compact, switch model) ready so the operator only types them. If told
  not now, it raises it again at the next boundary. Staying is a valid
  answer. A clear or compact comes after the state is written down, with
  an offer to write the handover as a file (written on yes; for a
  switch-tier nudge, the down-tier handoff spec). Nudges trigger on
  boundaries and observable signs, never on a context percentage.
  tokenomics-method teaches the four rules; the method doc's §Switchpoints
  gains one anchoring paragraph, no new layer. 14 eval assertions added
  (63 in all). Opt-in hooks and a status-line recipe are later steps.

### Changed

- **The person using the method is now the "operator"**, not the
  "builder" ([#35](https://github.com/slopstopper/tokenomics/issues/35),
  part of the family rename in
  [#34](https://github.com/slopstopper/tokenomics/issues/34)). "builder"
  becomes the name of a v0.5.0 routing class. Live guidance changed (the
  three skills, the method doc, eval rationales, the current playbook
  sections); dated records (design specs, plans, ledger update lines, this
  changelog's released entries) keep the word as written. Sibling repos
  rename on their own schedules, so for a while they may still say
  "builder" for the person.
- **Routing axes: a lane is now a class of work, not a model tier**
  ([#25](https://github.com/slopstopper/tokenomics/issues/25), spec in
  `docs/design/2026-10-03-routing-axes-design.md`). This is a change of
  meaning, not an addition. The three lanes flagship / mid / small were
  tier names doing double duty; there are now four classes, named
  **pathfinder, navigator, builder, keeper** (labels `lane:pathfinder` and
  so on). The single routing question ("if this is done slightly wrong, is
  it expensive?") becomes three: new ground, consequence, and
  verification. The class is the count of yeses (3 pathfinder, 2
  navigator, 1 builder, 0 keeper), with a veto: irreversible and
  unverifiable work is pathfinder whatever the count. The class is
  re-scored at every boundary (Route, Dispatch, Return, Close), so passing
  work down after a decision is made, and passing it up on escalation,
  follow from re-scoring rather than from separate rules. Which tier
  serves which class is the operator's mapping, set in their playbook: the
  method ships classes and no default mapping, and the bootstrap interview
  now asks for it. The method doc keeps one dated example mapping, now
  four rows. The "lane-scarcity rule" is renamed the tier-scarcity rule.
  The spend line's lane field now records the class (planned at Route →
  class it ran as after re-scoring). The eval anchors for the routing
  test were re-anchored to the new wording, and 13 assertions were added.
  - **Migration, if you used the three-lane names.** Your playbook's
    queue, issue labels and spend lines may say flagship / mid / small as
    lanes. Those were tier names; the work they described is now scored.
    Re-score each open queue item with the three questions rather than
    renaming one-for-one: most flagship items will land as pathfinder or
    navigator, most mid items as builder, most small items as keeper, but
    the count decides. Then fill in the class → tier mapping table in your
    playbook's Model routing section (the template has it). With two
    tiers, map four classes onto two. Rename labels to
    `lane:pathfinder` / `lane:navigator` / `lane:builder` /
    `lane:keeper`. The spend line's `cf-flagship` field keeps its name.
    Dated records written under the old names stay as written.
- **Examples and the Claude Code adapter follow the classes.** The
  analytical-desk example is re-routed under the four classes (its open
  queue re-scored, its Model routing rewritten with the desk's own
  mapping); the domain gallery, the micro-brief template and the
  orchestration recipe use the three questions; the recipe's spend
  roll-up sums output per tier through the operator's mapping.
- **The spend line's entry field, re-landed**
  ([#39](https://github.com/slopstopper/tokenomics/issues/39)). `entry
  <pointer|ad-hoc>` leads the spend line and records how a session opened,
  so "protocol followed vs. lapsed" is computable from the ledger. It was
  directed on 2026-07-06 as v0.3.3 (#7), but #7 merged into an
  already-merged stacked branch and never reached `main`; v0.3.3 was never
  part of the shipped history.
- **The code example is archived**, moved to
  `examples/archive/abstracted-playbook-v0.4/` unchanged. It abstracts a
  real project's playbook under the old lane names, and re-routing it
  would invent routing calls that project never made.

### Planned

v0.5.0 ("routing axes") is being scoped: lane as class of
work rather than model tier
([#25](https://github.com/slopstopper/tokenomics/issues/25)), prompt caching
against the compression thesis, and auto-compaction as an uncontrolled
compression boundary ([#26](https://github.com/slopstopper/tokenomics/issues/26)).

## [0.4.0] — 2026-10-03

Everything merged since v0.3.2, released for the first time.

### Added

- **Switchpoint taxonomy + Layer 4 controller contract** (W8,
  [#14](https://github.com/slopstopper/tokenomics/pull/14)): Route, Dispatch,
  Return, Close as named trigger/rule/artifact contracts; controller
  discipline, dispatch contract with a worked micro brief, parallelism and
  surfacing rules. Named rules, not a fifth layer.
- **Skills wiring** (W9, [#16](https://github.com/slopstopper/tokenomics/pull/16)):
  tokenomics-method teaches the four switchpoints; tokenomics-handoff labels
  its modes as Dispatch/Close and gains Return-side early-return guidance;
  tokenomics-bootstrap gains an orchestration interview question.
- **Claude Code adapter** (W10, [#18](https://github.com/slopstopper/tokenomics/pull/18),
  [#20](https://github.com/slopstopper/tokenomics/pull/20)): `adapters/claude-code/`
  with an opt-in SessionStart playbook-pointer hook, a micro-brief template,
  and an orchestration recipe that reads (not estimates) the per-tier spend
  roll-up from transcripts. Everything in `adapters/` is optional; the
  method does not depend on it.
- **The seam: composing with a tracking convention** (W11,
  [#21](https://github.com/slopstopper/tokenomics/pull/21)): co-installed with
  an issue-tracker-first convention such as recursive-spine, the tracker
  owns work state and tokenomics owns spend. tokenomics-bootstrap gains a
  detection-gated interop offer.
- **When this doesn't pay** (W6, [#22](https://github.com/slopstopper/tokenomics/pull/22)):
  the threshold below which the discipline is ceremony (no tier
  differential, single-context work, throwaway output).
- **Bootstrap salvage path** (W7, [#24](https://github.com/slopstopper/tokenomics/pull/24)):
  mid-project entry; an existing TODO/notes pile is carried into the first
  queue verbatim, lanes left unrouted.
- **Reader-feedback pass** ([#12](https://github.com/slopstopper/tokenomics/pull/12)):
  the verification axis ("route down only as far as your gates reach") made
  explicit, a second non-code worked example (an analytical desk) and a
  domain gallery, `docs/why.md`, and skill and CI hardening.
- **Release harness**: `.github/workflows/release.yml` cuts the tag and
  GitHub release automatically when `plugin.json`'s version changes on
  `main`; `RELEASING.md` documents it; a new CI gate keeps the manifest,
  this changelog, and the README status in agreement.

### Changed

- **Licence** ([#10](https://github.com/slopstopper/tokenomics/pull/10)):
  the slopstopper family formula, CC BY 4.0 for prose and Apache-2.0 for CI
  plumbing. Previously published versions (v0.1.0 to v0.3.2) remain MIT.
- README framing leads with the thesis (context economics, with token spend
  as the payoff) ([#13](https://github.com/slopstopper/tokenomics/pull/13)).
- README install now leads with the family marketplace
  (`tokenomics@slopstopper`); the repo's own marketplace still works.
- Repo URLs point at `slopstopper/tokenomics`
  ([#8](https://github.com/slopstopper/tokenomics/pull/8)).

### Known gaps carried into this release

Stated so the version is not read as more mature than it is:

- One source project; no controlled comparison against alternatives (G3).
- The spend ledger's counterfactual-flagship figure has never been
  computed: every recorded spend line omits it for want of a dated price
  table. The savings claim is falsifiable in design, not yet in data.
- Sessions can route from a stale playbook copy (G10, open).

## [0.3.2] — 2026-07-06 (untagged)

### Changed

- Compression-forward reframe (W5,
  [#6](https://github.com/slopstopper/tokenomics/pull/6)): README and method
  doc lead with context economics; tier arithmetic presented as its first
  application.

## [0.3.1] — 2026-07-06 (untagged)

### Added

- Escalation rule and verification axis (W4,
  [#5](https://github.com/slopstopper/tokenomics/pull/5)): a cycle that
  cannot meet its exit bar returns early; standing escalation clause in the
  handoff template and skill.

## [0.3.0] — 2026-07-06 (untagged)

### Added

- Spend-ledger convention (W1,
  [#4](https://github.com/slopstopper/tokenomics/pull/4)): a minimal
  per-session spend line, the counterfactual-flagship ratio, and the
  never-claim rules.
- Repo protocol: branch + PR flow, CI gates, CONTRIBUTING
  ([#1](https://github.com/slopstopper/tokenomics/pull/1)); adopter feedback
  route ([#3](https://github.com/slopstopper/tokenomics/pull/3)).

## [0.2.0] — 2026-07-06 (untagged)

### Added

- The cycle: macro/meso/micro nesting, the compression thesis, the
  up-channel rule, and a scale-invariant handoff template. The repo begins
  dogfooding its own playbook.

## [0.1.0] — 2026-07-06 (untagged)

### Added

- Initial extraction: portable method doc, three skills (method,
  bootstrap, handoff), playbook and handoff-spec templates, an abstracted
  worked example.
