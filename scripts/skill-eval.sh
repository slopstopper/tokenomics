#!/usr/bin/env bash
# Static skill-text evals: reads evals/*.json from CWD and checks each
# anchored assertion against skills/<skill>/SKILL.md. Transplanted from
# recursive-spine's scripts/spine-eval.sh; the evals/*.json format is the same.
#
#   ✓            the assertion holds
#   ✗ FAIL       anchors resolve, but the required order is violated
#   ⚠ UNRESOLVED anchor text is no longer in the skill — a human must look
#
# Exits non-zero on FAIL or UNRESOLVED: this one gates.
#
#   scripts/skill-eval.sh
#   scripts/skill-eval.sh --coverage --min-covered N
set -uo pipefail

MODE="check"; MIN_COVERED=0
while [ $# -gt 0 ]; do
  case "$1" in
    --coverage)    MODE="coverage" ;;
    --min-covered) shift; MIN_COVERED="${1:-0}"
      # A non-numeric value silently disables the ratchet under `[ -lt ]`
      # (errors to stderr, evaluates false). Refuse it as CLI misuse instead.
      case "$MIN_COVERED" in
        ''|*[!0-9]*)
          echo "skill-eval: --min-covered needs a non-negative integer, got '$MIN_COVERED'" >&2
          exit 2 ;;
      esac ;;
    *) echo "skill-eval: unknown argument '$1'" >&2; exit 2 ;;
  esac
  shift
done

# Hard-wrapped prose: collapse to one lowercase line before matching, or every
# rule that spans a line break reports UNRESOLVED forever. Needles (anchor,
# before) go through the same pipeline via norm(), so a phrase copy-pasted
# out of hard-wrapped Markdown still matches the flattened haystack.
flatten()   { tr '\n' ' ' < "$1" | tr -s ' ' | tr '[:upper:]' '[:lower:]'; }
norm()      { printf '%s' "$1" | tr '\n' ' ' | tr -s ' ' | tr '[:upper:]' '[:lower:]'; }
pos()       { awk -v s="$1" -v n="$2" 'BEGIN{print index(s,n)}'; }

# Anchors are authored in normalized (lowercase) form, but the prose they point
# at is not — and `git log -S` is case-sensitive, so a literal -S on the anchor
# finds nothing for almost every real rule. Search case-insensitively with -G,
# regex-escaping the anchor first (anchors routinely contain `**`, `(`, `.`).
# Still one-line-only: an anchor spanning a hard wrap cannot match either way.
last_seen() {
  local pat sha
  pat="$(printf '%s' "$1" | sed 's/[][\.^$*+?(){}|\\\/]/\\&/g')"
  sha="$(git log -i -G"$pat" --format=%h -1 -- "$2" 2>/dev/null | head -1)"
  if [ -n "$sha" ]; then
    echo "      last seen at commit $sha"
  else
    echo "      last seen at commit (not found — the anchor may span a line break)"
  fi
}

# Coverage counting, shared by both modes: check mode prints the same honest
# denominator so a local green run cannot be mistaken for "everything is
# guarded". Sets COVERED, SKILL_TOTAL, UNCOVERED.
COVERED=0; SKILL_TOTAL=0; UNCOVERED=""
compute_coverage() {
  local skills=(skills/*/) d name hit f s n
  SKILL_TOTAL="${#skills[@]}"
  COVERED=0; UNCOVERED=""
  [ "$SKILL_TOTAL" = 0 ] && return 0
  for d in "${skills[@]}"; do
    name="$(basename "$d")"
    hit=0
    for f in "${EVALS[@]}"; do
      s="$(jq -r '.skill // empty' "$f" 2>/dev/null)"
      n="$(jq -r 'if (.assertions | type) == "array" then (.assertions | length) else 0 end' "$f" 2>/dev/null)"
      if [ "$s" = "$name" ] && [ "${n:-0}" -gt 0 ]; then hit=1; fi
    done
    if [ "$hit" = 1 ]; then
      COVERED=$((COVERED + 1))
    else
      UNCOVERED="$UNCOVERED $name"
    fi
  done
}

# Always printed, including on success: a green 2/8 must never be mistaken
# for "everything is guarded".
print_coverage() {
  echo "skill-eval coverage — $COVERED/$SKILL_TOTAL skills covered"
  [ -n "$UNCOVERED" ] && echo "uncovered:$UNCOVERED"
  return 0
}

shopt -s nullglob
EVALS=(evals/*.json)
if [ "${#EVALS[@]}" = 0 ]; then
  echo "skill-eval: no eval files in evals/ (cwd=$(pwd))" >&2
  exit 1
fi

if [ "$MODE" = "coverage" ]; then
  compute_coverage
  print_coverage
  if [ "$COVERED" -lt "$MIN_COVERED" ]; then
    echo "skill-eval: coverage regressed — $COVERED covered, minimum is $MIN_COVERED" >&2
    exit 1
  fi
  exit 0
fi

FAILS=0; UNRES=0; TOTAL=0

for f in "${EVALS[@]}"; do
  # Shape, not just parseability: `jq -e .` calls a valid `null` or `false`
  # malformed, and lets a top-level `[]` through to leak a raw jq error and a
  # blank-named MISSING SKILL. An eval file must be an object with a string
  # `skill` and an `assertions` array.
  if ! shape="$(jq -r '
        if type != "object" then "not a JSON object (top level is \(type))"
        elif (has("skill") | not) then "missing the \"skill\" key"
        elif (.skill | type) != "string" then "\"skill\" is \(.skill | type), expected a string"
        elif (.skill | length) == 0 then "\"skill\" is empty"
        elif (has("assertions") | not) then "missing the \"assertions\" key"
        elif (.assertions | type) != "array" then "\"assertions\" is \(.assertions | type), expected an array"
        else "" end' "$f" 2>/dev/null)"; then
    echo "✗ MALFORMED JSON  $f (invalid JSON, could not be parsed)"
    FAILS=$((FAILS + 1)); continue
  fi
  if [ -n "$shape" ]; then
    echo "✗ INVALID EVAL FILE  $f ($shape)"
    FAILS=$((FAILS + 1)); continue
  fi
  skill="$(jq -r '.skill // empty' "$f")"
  md="skills/$skill/SKILL.md"
  if [ ! -f "$md" ]; then
    echo "✗ MISSING SKILL  $skill (named by $f)"
    FAILS=$((FAILS + 1)); continue
  fi

  flat="$(flatten "$md")"
  n="$(jq -r '.assertions | length' "$f")"
  echo ""
  echo "$skill        $n assertions"

  i=0
  while [ "$i" -lt "$n" ]; do
    id="$(jq -r ".assertions[$i].id" "$f")"
    kind="$(jq -r ".assertions[$i].kind" "$f")"
    anchor="$(jq -r ".assertions[$i].anchor" "$f")"
    before="$(jq -r ".assertions[$i].before // empty" "$f")"
    why="$(jq -r ".assertions[$i].why" "$f")"
    TOTAL=$((TOTAL + 1))
    i=$((i + 1))

    a="$(pos "$flat" "$(norm "$anchor")")"
    if [ "$a" = 0 ]; then
      echo "  ⚠ UNRESOLVED  $id"
      echo "      anchor:  \"$anchor\""
      echo "      not found in $md"
      echo "      why:     $why"
      last_seen "$anchor" "$md"
      echo "      This is not a test failure. The prose this assertion guards"
      echo "      was edited or removed. Either re-anchor it to the rule's new"
      echo "      wording, or — if the rule was dropped on purpose — delete the"
      echo "      assertion in the same commit and say why in the message."
      UNRES=$((UNRES + 1)); continue
    fi

    case "$kind" in
      contains)
        echo "  ✓ $id" ;;
      precedes)
        b="$(pos "$flat" "$(norm "$before")")"
        if [ "$b" = 0 ]; then
          echo "  ⚠ UNRESOLVED  $id"
          echo "      anchor:  \"$before\"  (the 'before' side)"
          echo "      not found in $md"
          echo "      why:     $why"
          UNRES=$((UNRES + 1))
        elif [ "$a" -lt "$b" ]; then
          echo "  ✓ $id"
        else
          echo "  ✗ FAIL  $id"
          echo "      \"$anchor\" (at $a) must come before \"$before\" (at $b)"
          echo "      why:     $why"
          FAILS=$((FAILS + 1))
        fi ;;
      *)
        echo "  ✗ FAIL  $id — unknown assertion kind '$kind'"
        FAILS=$((FAILS + 1)) ;;
    esac
  done
done

echo ""
echo "skill-eval — $TOTAL assertions, $FAILS failed, $UNRES unresolved"
# The denominator prints here too, not only under --coverage: a developer
# running the gate locally must see how much of skills/ is guarded at all.
compute_coverage
print_coverage
{ [ "$FAILS" = 0 ] && [ "$UNRES" = 0 ]; } || exit 1
