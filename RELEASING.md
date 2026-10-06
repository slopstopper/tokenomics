# Releasing tokenomics

Releases are automatic. **Never tag by hand.**

## To cut a release

In the PR that ships the change (or a small release PR after it):

1. Bump `"version"` in `.claude-plugin/plugin.json` (strict `X.Y.Z`).
2. Move the `## [Unreleased]` notes in `CHANGELOG.md` into a new
   `## [X.Y.Z] — YYYY-MM-DD` section, and leave `[Unreleased]` empty.
3. Make the README's `## Status` section name `**vX.Y.Z**` (bold; that is
   what the gate looks for).
4. The owner reviews; the PR merges to `main` (an agent session merges
   only when the owner explicitly asks, via admin bypass).

The `gates` check refuses a PR where those three disagree
(`scripts/check-version-agreement.sh`), so a half-done bump cannot merge.

On merge, `.github/workflows/release.yml` fires because `plugin.json`
changed, and:

- reads the version and **no-ops if `vX.Y.Z` already exists** (so re-runs,
  and merges that touch `plugin.json` without bumping it, are safe);
- **gates** by re-running the whole `gates.yml` suite (a release never
  passes a narrower gate than a PR);
- creates tag `vX.Y.Z` and a **GitHub release** whose notes are that
  version's CHANGELOG section.

slopstopper.org picks up the new version through its daily
`sync-site.yml` run (GitHub Releases API), so there is nothing to push.

## Versioning

Pre-1.0 SemVer: a change to method semantics or a new capability bumps the
minor; a fix-only release bumps the patch. A change to what a lane, tier, or
switchpoint *means* is always at least a minor bump, because adopters'
playbooks are written against those meanings.

## After a release

- The family marketplace (`slopstopper/marketplace`) carries tokenomics'
  description separately. If this release changed how tokenomics describes
  itself, update that copy to match.
- Yanking (rare): delete the GitHub release and its tag
  (`gh release delete vX.Y.Z --cleanup-tag`).

The pattern is recursive-spine's version-triggered release harness,
transplanted (pollen record `version-triggered-release`). Plugin and docs
repos release automatically on a version bump. Package repos that publish to
npm or PyPI, like plumb-line, keep a human-pushed tag instead.
