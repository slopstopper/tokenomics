#!/usr/bin/env bash
# Asserts the three places a version is claimed agree (run from repo root):
#   .claude-plugin/plugin.json .version   (the release trigger)
#   CHANGELOG.md's newest released section  ## [X.Y.Z]
#   README.md's ## Status section names **vX.Y.Z** (bold, so a forward
#     mention like "Next: vX.Y.Z" cannot satisfy it)
# The drift this guards against is real: before v0.4.0 the manifest said
# 0.3.2, the README said v0.3, and the ledger said v0.4, with no tags at all.
set -uo pipefail

VER="$(bash scripts/check-release-version.sh)" || exit 1

TOP="$(grep -m1 -oE '^## \[[0-9]+\.[0-9]+\.[0-9]+\]' CHANGELOG.md | tr -d '#[] ')"
if [ "$TOP" != "$VER" ]; then
  echo "version drift: plugin.json says $VER, CHANGELOG.md's newest section says '${TOP:-none}'" >&2
  exit 1
fi

if ! awk '/^## Status/{s=1;next} /^## /{s=0} s' README.md | grep -qF "**v$VER**"; then
  echo "version drift: README.md ## Status does not name **v$VER**" >&2
  exit 1
fi

echo "versions agree: $VER"
