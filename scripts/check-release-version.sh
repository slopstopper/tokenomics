#!/usr/bin/env bash
# Reads .claude-plugin/plugin.json .version (from CWD), asserts strict X.Y.Z
# semver, and prints it. Loud failure otherwise. Used by the release workflow.
set -uo pipefail

VER="$(jq -r '.version // empty' .claude-plugin/plugin.json 2>/dev/null || true)"
if [ -z "$VER" ]; then
  echo "check-release-version: no .version in .claude-plugin/plugin.json (cwd=$(pwd))" >&2
  exit 1
fi
if ! printf '%s' "$VER" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$'; then
  echo "check-release-version: version '$VER' is not strict X.Y.Z semver" >&2
  exit 1
fi
printf '%s' "$VER"
