# Orchestration recipe: the four switchpoints on Claude Code

How a controller session runs Route, Dispatch, Return, and Close
(`reference/portable-method.md` §Switchpoints, §Layer 4) with Claude
Code's native subagents, and how the spend roll-up is *read from the
transcripts, not estimated*. Verified as of **2026-07-24**; this file
reads harness internals that are not a public contract, so its job is to
be re-verified, not trusted.

The roll-up comes first in this file deliberately: it is the method's one
genuinely new obligation under orchestration, and the likeliest thing to
be silently skipped under friction. An unautomated roll-up quietly rots
and takes the ledger's falsifiability with it.

## The spend roll-up (run at Close, before writing the spend line)

Claude Code writes per-message usage, including the model id, to local
transcripts:

- main loop: `~/.claude/projects/<project-slug>/<session-id>.jsonl`
- subagent dispatches: `~/.claude/projects/<project-slug>/<session-id>/subagents/agent-*.jsonl`

Two format facts the aggregation depends on (both verified 2026-07-24):

1. **Usage lines are cumulative streaming updates.** The same message id
   appears on several lines, each carrying the running `output_tokens`
   total so far; only the *last* (equivalently: the maximum) is the
   message's true count. The 2026-07-06 recipe used first-occurrence
   dedupe (`unique_by`) and therefore under-reported — on the reference
   transcript below, by up to ~180× on subagent files. If you inherited
   that recipe, replace it.
2. **A `<synthetic>` pseudo-model appears** on harness-internal entries
   and carries no billable output; exclude it.

The roll-up, one command (fill in the two placeholders; the project slug
is the project's absolute path with `/` and `.` each replaced by `-`,
and worktrees get their own slug, distinct from the main checkout's):

```sh
S=~/.claude/projects/<project-slug>/<session-id>
cat "$S.jsonl" "$S"/subagents/agent-*.jsonl 2>/dev/null | jq -rs '
  [.[] | select(.message.usage != null)
       | {id: (.message.id // .uuid), model: .message.model,
          out: (.message.usage.output_tokens // 0)}]
  | group_by(.id) | map({model: .[0].model, out: ([.[].out] | max)})
  | map(select(.model != "<synthetic>"))
  | group_by(.model)
  | .[] | [.[0].model, length, ([.[].out] | add)] | @tsv'
```

Output is one row per model id: `<model-id> <message-count> <out-tokens>`.
Map model ids to flagship/mid/small via the method doc's dated mapping
table, then write the spend line per the ledger convention
(`docs/design/2026-07-06-spend-ledger-design.md`). The dispatch count is
the number of subagent transcripts:

```sh
ls "$S"/subagents/agent-*.jsonl 2>/dev/null | wc -l
```

**Cross-check (required, not optional):** compare the roll-up against the
harness's own usage reporting (`/cost`, the statusline, or the usage
summaries the harness prints during the session). Expect agreement in
order of magnitude, not to the token — the harness reports per-request
figures that bundle retries and tool turns differently. A gap within a
small factor is normal and gets recorded as-is; a gap of 100× or more
means the transcript format has drifted again, and the *usage blocks
become the fallback source* until the recipe is re-verified. Record
discrepancies in the spend line's notes; never smooth them.

Reference verification (2026-07-24, this repo's own W8/W10 transcripts,
9 subagent dispatches): old recipe read 3,599 / 1,131 / 94 out-tokens by
tier where the fixed recipe read 11,211 / 19,089 / 17,048, and
last-occurrence == max held for all 167 distinct message ids.

## Running the switchpoints with native subagents

**Route** — fires when the controller picks up work. The lane comes from
the playbook's queue line; apply the routing test ("if this is done
slightly wrong, is it expensive?") and the verification axis (route down
only as far as your gates reach) to anything not yet routed. Crossing
artifact: a queue line carrying a lane.

**Dispatch** — fires each time the controller hands work to a subagent
(the Task/Agent tool). Fill
[`micro-brief-template.md`](micro-brief-template.md) and paste the brief
as the subagent's entire task prompt — dispatch on briefs, never by
forwarding raw context. Choose the subagent's model per the brief's
to-lane, where the harness allows a per-dispatch model choice.
Parallelism rule: parallelize only work that is independent *and*
verifiable down-lane; parallel flagship dispatches are a smell.

**Return** — fires when a subagent's report comes back. Accept only the
report and the diff, run the brief's gates before building on it, and
treat findings inside the report as the only thing that crosses — leaked
context does not. A subagent that reports it cannot meet its exit bar has
returned early per the standing escalation clause: that return is cheap
and is not a failure; re-route the work up a lane rather than re-dispatching
the same brief.

**Close** — fires at the session boundary. Run the roll-up above, write
the ledger and spend lines (dispatch count and out-tokens by tier roll
*up* into the controller's own spend line), and promote the subagent
findings that outlive the session into the gap register — one cycle level
at a time.

## Never-claim reminder

The roll-up records composition; it never claims savings. Every
never-claim rule in `docs/design/2026-07-06-spend-ledger-design.md`
applies verbatim to orchestrated sessions.
