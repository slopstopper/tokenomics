# W8: Switchpoint Taxonomy + Layer 4 Controller Contract — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Ship Rings 1a and 1b of the v0.4 spec — the four named switchpoints and the deepened Layer 4 controller contract in `reference/portable-method.md` — and register the phase (G8/G9, W8–W11) in the playbook.

**Architecture:** Two prose insertions into the method doc (a new §Switchpoints between §The cycle and §Layer 1; a new controller-contract subsection inside §Layer 4), then a playbook registration pass. All text is drafted verbatim in this plan; execution is insertion + gate verification, not composition.

**Tech Stack:** Markdown only. Verification = the repo's CI gates run locally (link resolution, privacy sweep, model-name quarantine).

## Global Constraints

- Spec of record: `docs/design/2026-07-23-switchpoints-design.md` — do not re-derive decisions recorded there.
- Names are exactly: **Route, Dispatch, Return, Close**; the collective noun is **switchpoints** (one word, lowercase mid-sentence).
- The taxonomy names existing rules only; if an insertion seems to require new doctrine, stop and escalate (standing escalation clause).
- No concrete model names anywhere outside the method doc's existing mapping table (CI gate).
- No absolute home-directory paths or source-project terms in any Markdown (CI privacy gate) — use repo-relative paths everywhere, including in this plan's own text. (Gate patterns in this plan's quoted commands are split with shell string concatenation so this tracked file passes the gates it quotes.)
- Prose style: ~72-column wrap, em-dash-heavy declarative sentences, matching the surrounding document.
- Playbook update is append/status-only in spirit: add rows and lines; rewrite nothing that already stands.

---

### Task 1: §Switchpoints section in the method doc

**Files:**
- Modify: `reference/portable-method.md` (insert between the §The cycle closing paragraph — the sentence ending "see `handoff-spec-template.md`." — and the `## Layer 1 — Routing` heading)

**Interfaces:**
- Consumes: existing §The cycle and Layer names (referenced, not restated).
- Produces: heading anchor `## Switchpoints` and the four names Route/Dispatch/Return/Close, exactly as spelled here — Task 2 and Task 3 reference them.

- [ ] **Step 1: Insert the section**

Insert this text verbatim, preceded and followed by one blank line:

```markdown
## Switchpoints

The rules above were always positional — they fire at particular
points in the cycle, not continuously. A **switchpoint** is one of
those points made addressable: the place where work switches lane,
tier, or direction, and where a rule stated elsewhere in this method
is applied. Naming the switchpoints is what makes the method
orchestratable: anything that can observe a switchpoint — a builder,
a controller model, a hook — can enforce the rule that belongs to it.

Every switchpoint carries the same three-part contract: a **trigger
condition** (what you observe), the **rule that fires** (nothing
below is new doctrine — the taxonomy names rules this document
already states), and the **crossing artifact** (nothing crosses a
switchpoint except a distilled artifact).

| Switchpoint | Trigger | Rule that fires | Crossing artifact |
| ----------- | ------- | --------------- | ----------------- |
| **Route** | scope time — work is about to be assigned a lane | the routing test and its verification axis (Layer 1) | a queue line carrying a lane |
| **Dispatch** | a controller hands work down — session to session, or controller to subagent | the spec-first rule (Layer 2); the lane-scarcity rule (Layer 4) | a handoff spec or task brief |
| **Return** | the receiving tier meets its exit bar — or discovers it cannot | the project's gates on the success path; the escalation rule on the failure path | a report and reviewed diff, or an early-return escalation artifact |
| **Close** | a cycle boundary — the session or the arc ends | the compression point; the ledger and spend-line update (Layer 2, rule 4) | a ledger line plus spend line |

Switchpoints are not a fifth layer. They are the cycle's boundary
events (§The cycle) made addressable — Route and Dispatch on the way
down, Return and Close on the way up. Route and Close mark a cycle's
own boundaries; Dispatch and Return mark the boundaries of every
cycle it runs beneath itself. Return's two paths — the verified exit
and the early escalation — are the same crossing in opposite moods,
and both land one level up, never further.
```

- [ ] **Step 2: Run the link and quarantine gates**

Run from the repo root:

```sh
for f in $(git ls-files '*.md'); do dir=$(dirname "$f"); for l in $(grep -oE '\]\([^) ]+\)' "$f" | sed -E 's/\]\((.+)\)/\1/'); do case "$l" in http://*|https://*|mailto:*|\#*) continue ;; esac; t="${l%%#*}"; [ -z "$t" ] && continue; [ -e "$dir/$t" ] || echo "BROKEN: $f -> $l"; done; done
grep -rniE 'ves''ka|gd''elt|astro''nom|/Use''rs/' --include='*.md' . ; echo "privacy exit: $?"
```

Expected: no `BROKEN:` lines; privacy grep finds nothing (exit 1, so `privacy exit: 1`).

- [ ] **Step 3: Commit**

```sh
git add reference/portable-method.md
git commit -m "method(W8): switchpoint taxonomy — Route, Dispatch, Return, Close"
```

---

### Task 2: Layer 4 controller contract

**Files:**
- Modify: `reference/portable-method.md` (inside `## Layer 4 — Tiered orchestration`: insert after the existing four bullets, before the paragraph beginning "The cycle has one governing rule")

**Interfaces:**
- Consumes: switchpoint names from Task 1 (Dispatch, Return, Close) and the handoff template file name `handoff-spec-template.md`.
- Produces: the four rule names **controller discipline / dispatch contract / parallelism rule / surfacing rule** — W9 (skills wiring) will teach these by name.

- [ ] **Step 1: Insert the contract**

Insert this text verbatim:

```markdown
Layer 4's loop is governed by a controller contract — four rules that
hold whenever one context is running cycles beneath itself, whatever
the harness:

- **Controller discipline.** A controller is a meso cycle running
  micro cycles. It dispatches on briefs, never by forwarding raw
  context, and it aggregates sub-agent spend into its own spend line —
  dispatch count and out-tokens by tier roll *up*, so the ledger stays
  truthful when work is parallelized.
- **Dispatch contract.** A micro brief is the handoff-spec template at
  its smallest size — the contract is scale-invariant, so no section
  is dropped, only shortened. A worked micro brief, whole:

  > Handoff: Q-17 status-table refresh · micro · mid → small
  > **Goal:** the six status rows in the catalog doc match the done
  > ledger. **Context pointers:** the catalog doc; the playbook's done
  > ledger; nothing else. **Decisions already made:** row order stays
  > (readers link to anchors); status wording copied verbatim from the
  > ledger. **Deliverables:** the catalog doc, status column only.
  > **Gates:** link gate green; diff touches one column. **Out of
  > scope:** every other column and all surrounding prose. Standing
  > escalation clause applies.

- **Parallelism rule.** Parallelize only work that is independent
  *and* verifiable down-lane. Parallel flagship dispatches are a
  smell: work that needs flagship judgment usually needs the one
  context that holds the frame.
- **Surfacing rule.** Sub-agent findings cross at Return inside the
  report, never as leaked context; the controller promotes the
  findings that outlive the session at Close. This is the
  one-level-at-a-time escalation property (§The cycle), restated for
  orchestration.
```

- [ ] **Step 2: Re-run both gates from Task 1 Step 2**

Same commands, same expected output (no `BROKEN:`, privacy grep empty). Also confirm the model-name quarantine still holds:

```sh
grep -rlE 'Fab''le|Op''us|Son''net|Hai''ku' --include='*.md' . | grep -vx './reference/portable-method.md'; echo "quarantine exit: $?"
```

Expected: no file list; `quarantine exit: 1`.

- [ ] **Step 3: Commit**

```sh
git add reference/portable-method.md
git commit -m "method(W8): Layer 4 controller contract — discipline, dispatch, parallelism, surfacing"
```

---

### Task 3: Playbook registration — G8/G9, W8–W11, frame corollary

**Files:**
- Modify: `docs/model-effectiveness-playbook.md`

**Interfaces:**
- Consumes: gap/queue table shapes already in the file; spec queue table in `docs/design/2026-07-23-switchpoints-design.md`.
- Produces: gap IDs G8/G9 and queue IDs W8–W11 that W9–W11 sessions will claim.

- [ ] **Step 1: Append two gap-register rows** (after the G7 row):

```markdown
| G8 | Orchestration mechanics undocumented — Layer 4 was four bullets and the micro cycle had no dispatch contract | method-doc half shipped (W8); skills half open (W9) | high (method semantics) |
| G9 | Orchestration claims lack orchestrated evidence — no ledger session yet records an aggregated multi-dispatch spend line | open — evidence begins at the first post-W10 orchestrated session | medium (credibility) |
```

- [ ] **Step 2: Update the Now queue**

Change W2's Status cell to: `absorbed into W10 (the adapter ships the hook)`. Then append after the W7 row:

```markdown
| W8 | **Switchpoint taxonomy + Layer 4 controller contract.** Rings 1a–1b of `docs/design/2026-07-23-switchpoints-design.md`. | G8 (with W9) | flagship | 1 session | done — 2026-07-23 |
| W9 | **Skills wiring.** Method skill teaches the four switchpoints; handoff skill reframes Mode A/B as Dispatch/Close and gains Return-side early-return guidance; bootstrap gains the orchestration interview section (interop mode excluded — W11). | G8 (with W8) | mid | 1 session | open — executes from the spec + W8's shipped text |
| W10 | **`adapters/claude-code/` (Ring 2).** Quarantine README; SessionStart hook (absorbs W2); micro-brief template; orchestration recipe with automated spend roll-up first. | G2; enables G9 | mid, escalate on recipe design | 1 session | open |
| W11 | **Recursive-spine interop seam (Ring 3).** Method-doc seam section + bootstrap interop mode. | — (spec §Ring 3) | flagship (seam design) | 1 session | open |
```

- [ ] **Step 3: Append the frame corollary** (one sentence at the end of §Strategic frame):

```markdown
Post-v0.4 corollary: every named switchpoint invites ceremony around
it, so W6's not-worth-it threshold grows more important as
orchestration lands, not less.
```

- [ ] **Step 4: Done-ledger entry + date line + spend line**

Append to the Done table:

```markdown
| W8 | Switchpoint taxonomy (Route, Dispatch, Return, Close — trigger/rule/artifact contract) + Layer 4 controller contract (controller discipline, dispatch contract with worked micro brief, parallelism rule, surfacing rule). Do-not-re-derive: switchpoints are named rules, not new doctrine, and are not a fifth layer. | flagship | done — 2026-07-23 |
```

Rewrite the "Last updated" line to lead with W8 (push the current text down as "Prior update", matching the existing stacking pattern), and append the session's real spend line extracted per the recipe in `docs/design/2026-07-06-spend-ledger-design.md` — values are runtime data, never invented; omit `cf-flagship` unless a dated price table is at hand.

- [ ] **Step 5: Run all three gate commands** (links, privacy, quarantine — from Tasks 1–2). Expected: all clean.

- [ ] **Step 6: Commit**

```sh
git add docs/model-effectiveness-playbook.md
git commit -m "playbook: register v0.4 phase — G8/G9, W8 done, W9–W11 queued, W2 absorbed"
```

---

### Task 4: Ship

- [ ] **Step 1:** Push the branch and open a PR titled `method(W8): switchpoint taxonomy + Layer 4 controller contract — v0.4.0`, body pointing at the spec. Confirm the `gates` workflow is green before merge.
