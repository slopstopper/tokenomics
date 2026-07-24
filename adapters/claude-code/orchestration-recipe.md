# Orchestration recipe (Claude Code)

How a **controller session** runs the four switchpoints
(`../../reference/portable-method.md` §Switchpoints) with native Claude Code
subagents, and — the part that matters most — reads the per-tier spend
**roll-up straight from the transcripts** instead of estimating it. An
unautomated roll-up quietly rots and takes the method's falsifiability claim
with it, so the extraction step is the first-class deliverable here, not a
convenience.

A controller is a meso cycle running micro cycles (Layer 4). It dispatches on
briefs, never by forwarding raw context, and it aggregates subagent spend into
its **own** spend line — dispatch count and out-tokens by tier roll *up*.

## The loop, switchpoint by switchpoint

1. **Route.** For each unit of work, ask the routing test verbatim: **"If this
   is done slightly wrong, is it expensive?"** Yes → flagship. Clear contract
   with tests → mid. Mechanical with automated verification → small. Then the
   second axis: route down only as far as your gates reach — work with no cheap
   gate is flagship even when it looks mechanical. The crossing artifact is a
   queue line carrying a lane.
2. **Dispatch.** For work routed below the controller's own lane, fill a
   [micro brief](micro-brief-template.md) and pass it as the subagent's prompt
   (the Task / Agent tool). Set the subagent's model to the brief's target
   lane. Parallelize only independent, down-lane-verifiable work; parallel
   flagship dispatches are a smell. The crossing artifact is the brief.
3. **Return.** The subagent hands back a report and a reviewed diff when it
   meets its exit bar — or an early-return escalation artifact when it
   discovers the lane was wrong. Findings cross **inside the report**, never as
   leaked context (the Surfacing rule). The controller runs the project's gates
   on the returned diff before accepting it.
4. **Close.** At the session boundary, update the ledger and append the spend
   line. Promote any subagent finding that outlives the session up one cycle
   level (the gap register). The spend line's per-tier out-tokens come from the
   roll-up below — read, not estimated.

## Spend roll-up (re-verified 2026-07-24)

Claude Code writes per-message usage, including the model, to local
transcripts, in two places per session:

- **main loop:** `~/.claude/projects/<project-slug>/<session-id>.jsonl`
- **micro cycles (subagents):**
  `~/.claude/projects/<project-slug>/<session-id>/subagents/agent-*.jsonl`

(The `<project-slug>` is Claude Code's own encoding of the project path; list
`~/.claude/projects/` to find it. **Git worktrees get their own slug**,
distinct from the main checkout's — a session run in a worktree writes its
transcripts under the worktree's slug, so a roll-up pointed at the main
checkout's slug silently misses it. Paths are written relative to the home
directory here on purpose — never paste an absolute home path into a tracked
file.)

### The extraction

```sh
MAIN=~/.claude/projects/<project-slug>/<session-id>.jsonl
SUBS=~/.claude/projects/<project-slug>/<session-id>/subagents/agent-*.jsonl

cat $MAIN $SUBS | jq -rs '
  [ .[]
    | select(.message.usage != null)
    | { id:    (.message.id // .uuid),
        model: .message.model,
        out:   (.message.usage.output_tokens // 0) } ]
  | group_by(.id) | map(max_by(.out))          # <-- see "streaming" note
  | group_by(.model)
  | .[] | [ .[0].model, length, ([.[].out] | add) ] | @tsv'
```

Output is one row per model id: `model  message-count  output-tokens`. Map
each model id to its lane with the project's own lane mapping (the flagship /
mid / small table in the method doc), then sum output-tokens per lane for the
spend line. Ignore any non-model rows (e.g. a `<synthetic>` id carries no real
usage and sums to zero).

Count **dispatches** as the number of subagent files:

```sh
ls ~/.claude/projects/<project-slug>/<session-id>/subagents/agent-*.jsonl | wc -l
```

### Why `max_by(.out)` — the drift the old recipe hit

The 2026-07-06 recipe deduped streaming updates with `unique_by(.id)`. Claude
Code emits **one transcript line per streaming update**, all sharing the same
`message.id` but carrying a *growing* `output_tokens` (a single message shows
up as, e.g., `3` then `1064`). `unique_by(.id)` keeps an arbitrary — early,
partial — row, so it reported *tens* of tokens where the harness reported
*tens of thousands*. `group_by(.id) | map(max_by(.out))` keeps the **final**
(largest) count per message id, which is the true per-message output. This is
the fix flagged in the switchpoints spec's Known Risks and recorded in the
playbook's sixth-update spend line; it was re-verified on 2026-07-24 against a
real multi-dispatch session (subagent totals moved from double digits back
into the tens of thousands).

### Cross-check (required, not optional)

The transcript format is a harness internal, not a public contract, so **check
the extracted numbers against Claude Code's own reported usage blocks** (the
per-session usage summary the harness surfaces). Same order of magnitude →
trust the roll-up. A gap of orders of magnitude → the format has drifted
again; treat the harness usage blocks as the fallback source and re-derive the
`jq` before recording anything. **Record discrepancies, don't smooth them** —
a silent mismatch is exactly the rot this step exists to catch.

## Writing the spend line

Assemble the standard line (see the spend-ledger design spec,
`../../docs/design/2026-07-06-spend-ledger-design.md`):

```
spend: lane <planned>→<ran> · dispatches <N> · out-tokens flagship <F> / mid <M> / small <S> · cf-flagship <R> (prices <as-of date>)
```

- `F / M / S` are the per-lane sums from the roll-up (main loop **plus** all
  subagents — the controller's spend includes what it dispatched).
- Omit `cf-flagship` unless a **dated** price table is supplied; never quote
  the ratio without its price-table date and the token-volume assumption.
- **Records, not claims.** The roll-up never asserts savings against an
  unmeasured baseline — see the never-claim rules in the spend-ledger spec.

## Honest limit

This recipe reads Claude Code's internal transcript format and hook behavior,
verified as of 2026-07-24. The format is not a public contract and has drifted
once already (the `unique_by` → `max_by` fix above). Its job is to be
re-verified, not trusted: when the cross-check disagrees by orders of
magnitude, the recipe is what to fix, and harness-reported usage blocks are
the accepted fallback source.
