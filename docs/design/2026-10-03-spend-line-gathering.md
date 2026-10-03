# Spend line: provisional fields for v0.5.0 (gathering, this repo only)

Status: **provisional, gathering.** Owner decision 2026-10-03: record six
extra fields in *this repo's* ledger so v0.5.0's open questions (#25 lane
semantics, #26 caching and compaction) are decided on data rather than
argument. Nothing here changes the adopter-facing template, the handoff
skill, or `2026-07-06-spend-ledger-design.md` yet; those change in v0.5.0,
after enough sessions have been recorded to show which fields earn their
place. The never-claim rules of the 2026-07-06 design apply unchanged.

## The extended line

One line, as before; fields that do not apply are omitted, not zeroed.

```
spend: lane <planned>→<ran> [escalation <cause>] · effort <tier> <level> · dispatches <N> (tiers: <tier>×<n>, …) · out-tokens <tier> <F> / … · in <tier> uncached <U> / cache-read <C> / cache-write <W> · compactions <K> · cf-flagship <R> (<price source>)
```

## The six fields

| Field | What it answers | Source | Extraction status (Claude Code 2.1.288, 2026-10-03) |
| ----- | --------------- | ------ | ------------------------------------------------- |
| `effort` per tier | #25: is effort a routing axis or a sizing knob? | each assistant transcript entry's top-level `effort` | **verified**: present on every entry |
| `in … uncached / cache-read / cache-write` | #26: what does a deliberate boundary forfeit? | `message.usage.{input_tokens, cache_read_input_tokens, cache_creation_input_tokens}`, de-duplicated by message id as the adapter recipe does for output | **verified** for the main session |
| `compactions` | #26: how often does the harness take a boundary the builder did not? | not yet known: no compaction occurred in the session this was verified on, so the event's shape is unseen | **unverified**: self-reported until a compaction is observed in a transcript |
| `escalation <cause>` (only when planned ≠ ran) | #25: separate *misclassified* (the routing test failed) from *under-provisioned* (class right, tier or effort insufficient) | the builder's or controller's judgment at Close | self-reported by design |
| `dispatches (tiers: …)` | catches silent tier inheritance (below) | the `model` field of each subagent transcript | **verified** for model; subagent **token counts are not** (below) |
| `cf-flagship` from the harness cost record | finally computes R | `cost-state.modelUsage[<model>].costUSD` | **partial**: present, but a lagging snapshot; see caveats |

## Findings from the first extraction (this session)

1. **Silent tier inheritance.** The session dispatched two read-only survey
   subagents without naming a model; both inherited the controller's tier
   and effort (flagship, medium). By the routing test they were mid- or
   small-lane work. Native dispatch makes the expensive default the silent
   one: nothing in the transcript or the gates flags it. Candidate fix (a
   v0.5.0 item, not done here): the adapter's micro-brief makes the
   receiving tier a required field.
2. **Subagent output tokens are not in subagent transcripts.** Their
   assistant entries hold only streaming partials (`stop_reason: null`,
   `output_tokens` 3 to 16); final usage is never written there. The
   adapter recipe's per-tier roll-up therefore under-reports dispatched
   work on this harness version. This is a recurrence: the playbook's
   sixth update (2026-07-23) recorded the same drift, and W10 fixed it.
   The recipe breaks with harness updates, so each new harness version
   needs a re-verification run, not a one-off patch. The harness's task-completion notice does
   report a per-subagent total (all token types, not output alone).
3. **The cost record lags.** `cost-state` is a periodic snapshot: at
   extraction its output total (64,673) trailed the main transcript's
   (72,229). Read the last entry at Close, and expect it to be
   incomplete for a session still running.
4. **Cache reads dwarf output by volume** (main session at extraction:
   output 72,229; cache reads 14,685,480; about 200×). The 2026-07-06
   design's reason for an output-only unit ("least distorted by caching")
   is now a testable assumption, not a settled one: that is #26.

## cf-flagship from the harness: what it is and is not

- It is Claude Code's own estimate of each model's cost at its built-in
  **API list prices**, dated only by the harness version. tokenomics still
  ships no price numbers; the price source is named in the line instead.
- It is **not** what a subscription costs. For a subscription builder the
  scarce resource is usage-limit allowance, and how allowance maps to list
  price is not public. R from list prices is a proxy for mix, nothing more.
- It covers input and cache as well as output, so R computed from it is a
  broader ratio than the 2026-07-06 definition (output only). Recording it
  alongside, not instead of, keeps the two comparable until #26 decides.
- Never-claim rule 4 applies with the source named: R is quoted with its
  price source, its date, and the same-token-volume assumption, or not at
  all.

## Decision (owner, 2026-10-03): API list price, option B

Gather with the harness's API list-price estimate (option B); choose
between B and a dated price table in the method doc (option C) in v0.5.0.

The owner's reasoning, recorded because it is the method's purpose: the
method was built to stretch a subscription's usage allowance, spending the
top tier only where it is genuinely needed and passing everything else
down. Per-model allowance cost is not observable; API list price is the
only per-model cost that is. It is honest for API users directly, and for
subscription users it is the best available proxy.

**The proxy assumption, stated so it can be checked:** allowance
consumption between tiers scales roughly like API list price between
tiers. Unverified. R is therefore an *API-price-weighted tier mix*; the
ledger never claims allowance saved.

## Finding: the mapping merges the two top tiers

The method doc's mapping table puts the top two model tiers in one Flagship row.
The method was designed around separating exactly those two (use the
top tier only where it is clearly worth it), so the decision it was built
for is the one its three lanes cannot express: four tiers, three lanes. Two consequences:

- **R's denominator is ambiguous.** "All-flagship" can mean the top tier
  or the merged two-tier lane. This session ran the second tier, so against the
  lane R is 1.00 and against the top tier R is below 1.
- **Option B cannot always compute R.** The harness record prices only the
  models a session actually used. A session that never touches the top
  tier carries no top-tier price, so the counterfactual against it cannot
  come from the record alone. The reference tier's price must come from
  somewhere else. That is an argument for C, at least for the reference
  tier's row.

Both belong to #25 (what a lane names) and are recorded there.
