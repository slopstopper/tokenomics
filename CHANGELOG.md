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

_Nothing yet._ v0.5.0 ("routing axes") is being scoped: lane as class of
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
