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
  `gates` check must be green. Self-merge once green is the normal path,
  this is a solo-maintained repo; review is welcome but not required.

## Gates (CI, `.github/workflows/gates.yml`)

- Plugin manifests parse and keep their required fields.
- Every skill's frontmatter `name` matches its directory.
- Every relative markdown link resolves.
- Privacy sweep: the method's source project stays unnamed and
  unidentifiable until it is released.
- Concrete model names appear only in the method doc's single, dated
  mapping table: lanes are flagship/mid/small everywhere else.

## Constraints that are not up for PR

- The worked example is an abstraction and must always be labeled as one.
- Maturity claims stay honest: practice report, one source project, no
  controlled comparison (until there is one, see the playbook's gap
  register).
