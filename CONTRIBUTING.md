# Contributing

## Feedback from adopters

Ran the method on your own project? Open an
[adopter-feedback issue](https://github.com/slopstopper/tokenomics/issues/new?template=feedback.yml), shape and
scale are enough, you don't need to name your project. What you report
routes into the playbook's gap register and the W3 adopter-feedback pass:
the method's own up-channel, applied to itself.

## Changes

This repo runs its own method, the working protocol lives in
[`docs/model-effectiveness-playbook.md`](docs/model-effectiveness-playbook.md)
and the method it follows in
[`reference/portable-method.md`](reference/portable-method.md).

## Flow

- Branch before any change. Prefixes: `method/` (the portable method or
  templates), `skills/` (the three skills), `docs/`, `fix/`,
  `protocol/` (repo process itself).
- One idea per branch; PR to `main`. `main` is protected: PRs only, and the
  `gates` check must be green.
- **Every PR has a human review before it merges** (owner, 2026-10-06,
  all slopstopper repos). Green gates are necessary, never sufficient.
  The owner reviews and merges, including PRs opened under their own
  account. An agent session opens PRs and answers review; it never merges
  or approves. This is a process rule, not branch protection: with one
  contributor, required approvals would lock the owner out of their own
  PRs.

## Gates (CI, `.github/workflows/gates.yml`)

- Plugin manifests parse and keep their required fields.
- Versions agree: `plugin.json`, the newest `CHANGELOG.md` section, and the
  README's Status section name the same version.
- Every skill's frontmatter `name` matches its directory.
- Skill-text evals (`scripts/skill-eval.sh`, assertions in `evals/*.json`):
  the rules each skill must keep (the three routing questions verbatim,
  invent-nothing, never-claim) are still present and in order. An `UNRESOLVED` result means
  guarded prose was edited: re-anchor the assertion to the new wording, or,
  if the rule was dropped on purpose, delete the assertion in the same
  commit and say why. Coverage may not fall below all three skills.
- Every relative markdown link resolves.
- Privacy sweep: the method's source project stays unnamed and
  unidentifiable until it is released.
- Concrete model names appear only in the method doc's single, dated
  mapping table: elsewhere, work is routed by the four classes
  (pathfinder, navigator, builder, keeper) and models by tier.

## Releases

Bump the version in `plugin.json` and, after human review, merge; the tag
and GitHub release follow automatically. See [`RELEASING.md`](RELEASING.md).

## Constraints that are not up for PR

- The worked example is an abstraction and must always be labeled as one.
- Maturity claims stay honest: practice report, one source project, no
  controlled comparison (until there is one, see the playbook's gap
  register).
