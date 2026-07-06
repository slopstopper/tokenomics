# Spend ledger — design spec (W1, v0.3)

Date: 2026-07-06
Status: accepted (owner-approved; designed in a flagship session, mechanical
half executed down-tier per the queue's lane note — this spec is itself the
handoff artifact)
Closes: G1 in `../model-effectiveness-playbook.md`

## What this is

The convention that makes the method's savings claims falsifiable: one
line per session recording what actually ran, plus one derived ratio with a
stated assumption. **Records, not claims.** The ledger may never assert
savings against a baseline that was not measured.

## The two claims, separated

1. **Composition (recorded, v0.3):** which tiers the session's tokens
   actually ran on, and whether the lane the queue named is the lane that
   ran. Extractable mechanically; requires no discipline beyond session
   close.
2. **Savings (not recorded, pre-registered for later):** any claim of the
   form "the method saved X vs. not using it" needs a baseline — before/after
   adoption in one project, or protocol-followed vs. protocol-lapsed
   sessions. Those analyses are named in §Pre-registered analyses and may
   only be computed when the data exists. Until then the ledger carries no
   savings language.

## The spend line

One line, appended to the session's ledger entry at close (Mode B of the
handoff skill):

```
spend: entry <pointer|ad-hoc> · lane <planned>→<ran> · dispatches <N> · out-tokens flagship <F> / mid <M> / small <S> · cf-flagship <R> (prices <as-of date>)
```

- **entry pointer|ad-hoc** — how the session opened: `pointer` if it
  entered on the playbook pointer (or a handoff spec) and took a queue
  item; `ad-hoc` otherwise. This field is what makes analysis A2 (§below)
  computable from the ledger alone, instead of relying on the builder
  remembering which sessions lapsed. Old lines may be retro-tagged where
  the entry mode is known, labeled `(retro-tagged)`.
- **lane planned→ran** — the queue item's lane vs. what actually executed;
  a mismatch is a finding, not a footnote.
- **dispatches** — count of micro cycles (subagent tasks) the session spawned.
- **out-tokens by tier** — output tokens per tier from the extraction
  recipe. Output tokens are the primary unit (they dominate cost and are
  least distorted by caching); input/cache totals may be kept in a fuller
  per-session record if the builder wants them, but the ledger line stays
  one line.
- **cf-flagship R** — the counterfactual-flagship cost ratio (§below), with
  the price table's as-of date. Omit the ratio rather than compute it
  against an undated price table.

## Extraction recipe (verified 2026-07-06 against Claude Code)

Claude Code writes per-message usage, including the model, to local
transcripts. Two locations per project:

- main loop: `~/.claude/projects/<project-slug>/*.jsonl`
- micro cycles: `~/.claude/projects/<project-slug>/<session-id>/subagents/agent-*.jsonl`

Entries repeat per streaming update, so aggregation must dedupe by message
id. Reference aggregation (jq):

```sh
cat <files> | jq -rs '
  [.[] | select(.message.usage != null)
       | {id: (.message.id // .uuid), model: .message.model,
          out: (.message.usage.output_tokens // 0)}]
  | unique_by(.id) | group_by(.model)
  | .[] | [.[0].model, length, ([.[].out] | add)] | @tsv'
```

Map model ids to tiers via the project's own lane mapping. Community
tooling (e.g. `ccusage`) that aggregates the same transcripts is an
acceptable substitute where its numbers can be spot-checked against the
reference aggregation.

**Portability caveat (honest limit):** this reads Claude Code's internal
transcript format, verified as of 2026-07-06. The format is not a public
contract and may change; the recipe's job is to be re-verified, not
trusted. Builders on other harnesses need an equivalent source (API billing
export, OTel metrics) — the spend line's fields are harness-neutral even
though the recipe is not.

## The counterfactual-flagship ratio

The one derived number the ledger may carry:

```
R = Σ_t (out_tokens_t × price_t) / Σ_t (out_tokens_t × price_flagship)
```

- **The price table is an input, not a constant** — supplied by the
  builder, dated, and referenced in the line (`prices <as-of>`). Prices
  change and differ by billing shape; the method ships no price numbers,
  the same way it ships no model names outside one dated mapping table.
- **The stated assumption** (must accompany any use of R in prose): R
  assumes the same token volume would have been produced had the flagship
  run everything. Roughly fair for spec-backed implementation and
  mechanical work; weaker for open-ended reasoning, where a flagship might
  use fewer turns. R is therefore a *mix* ratio, not a measured saving.
- **The one sentence R supports:** "the same deliverables, gates green, at
  R of all-flagship token cost." Nothing stronger.

## Never-claim rules

The ledger and any prose citing it may never:

1. assert savings against an unmeasured baseline ("saved 60%" with no
   before/after or lapse comparison);
2. compare R across different projects as if it measured method quality
   (mix depends on the work's nature);
3. include test/throwaway sessions in adopter-facing numbers without
   labeling them;
4. quote R without its price-table date and the token-volume assumption.

## Pre-registered analyses (compute only when the data exists)

- **A1 — adoption before/after:** within one project, tier mix and
  dispatch count per session before vs. after the playbook existed.
  Confound: work nature shifts over a project's life; report alongside the
  queue items' lanes, not raw.
- **A2 — protocol-followed vs. lapsed:** sessions the spend line marks
  `entry pointer` vs. `entry ad-hoc` (the in-ledger source; the feedback
  form's "what rotted first" is the adopter-side source).
  Direction of interest: lapsed sessions spend a higher flagship share for
  the same lane of work.
- Both are descriptive comparisons with named confounds — no causal
  language in reporting them.

## First data point (illustrative, recorded at design time)

From this repo's own build session (2026-07-06, the session that shipped
v0.1→v0.3; spans build work and owner conversation, so approximate and
labeled as such): main loop flagship ≈ 242k output tokens; micro cycles —
small ≈ 1.1k, mid ≈ 8.1k, capable-tier review ≈ 2.0k output tokens across
17 dispatches. Composition only; no R quoted because the session predates
the convention's price-table input.

## Mechanical half (executed down-tier from this spec)

1. `reference/playbook-template.md` — the ledger-update instruction gains
   the spend line with its field placeholders.
2. `skills/tokenomics-handoff/SKILL.md` Mode B — new close step: run the
   extraction recipe (or accept the builder's numbers), write the spend
   line, refuse savings language per the never-claim rules.
3. `reference/portable-method.md` — Layer 2's ledger rule and §The cycle
   gain one short paragraph each: the spend line exists, records not
   claims, R's assumption named.
4. Repo playbook — W1 → done with this spec; G1 → design closed,
   implementation shipped; first-data-point line added to the Done ledger.
5. `plugin.json` → 0.3.0; README status paragraph updated.
