---
name: catchup
description: Read the latest handover notes and reply with a four-section catch-up brief — current state, open threads, gotchas, suggested actions. Use when starting or taking over work in a project that has handover notes, or when the user says "catchup", "catch me up", "接班".
argument-hint: "[N|deep]"
---

# Catch-up Brief

Read the latest handover notes and brief the incoming session, in-conversation. Strictly read-only — that is what makes auto-triggering safe.

## Reading the notes

1. List `*.md` files in `.handovers/` and in legacy `.claude/handovers/` (pre-0.4.0), merge the lists, and sort by filename; on a filename tie the `.handovers/` copy wins; `.lang`, `CURRENT.md`, and `CURRENT.archive.md` are not notes.
2. **State mode** — `.handovers/CURRENT.md` exists: read it first. It is the project's current state — a bounded **working set**, one durable fact per line, latest state only, each with its confirmation date and source note. Its sibling `CURRENT.archive.md` holds the demoted overflow; the default read does **not** open it — the brief points at it instead. Then read **every note sharing the newest note's date prefix** (concurrent agents hand off same-day; the group, not just the newest note, is the event layer). A numeric argument replaces the group with the latest N notes (`/catchup 5`).
3. **Fallback** — no `CURRENT.md`: read the latest N notes — default 3; a numeric argument widens the window (`/catchup 5`).
4. Notes without frontmatter (legacy format) are read like any other.
5. If neither directory exists, or there are neither notes nor a `CURRENT.md`, say so briefly in the resolved language and stop. Never invent content. A `CURRENT.md` with no notes left is still briefed from — the projection is what matters.

## Deep mode

`/catchup deep` — the word `deep` alone; it never combines with a number — reads everything the default deliberately truncates:

- **State layer**: the working set **plus the full archive** (`CURRENT.archive.md`), when the archive exists. Archived facts brief with their own dates and sources — demoted, not discarded.
- **Git delta**: uncapped — the whole `<commit>..HEAD` range.
- **Note layer**: unchanged — still the newest-date group. Depth beyond that is `/catchup N`'s job, not deep's.

Fallback mode (no `CURRENT.md`): deep means an uncapped delta plus the archive if present; the note window stays as-is.

## Git delta

If the newest note's frontmatter carries a `commit`, read `git log <commit>..HEAD --oneline -n 50` and fold those commits into Current state as what happened since the last handover, citing shas. When the range holds more than 50, fold only the newest 50 — count the rest with `git rev-list --count <commit>..HEAD` and say so in one pointer line (see The brief), never list the remainder. Deep mode reads the range uncapped. No `commit` field, not a git repo, an empty range, or a commit git cannot resolve — say nothing about git delta; never invent commits.

## Language resolution

1. An explicit language request in the conversation wins.
2. Otherwise read `.handovers/.lang`, then legacy `.claude/handovers/.lang`; use the first that exists.
3. Otherwise infer from the user's messages.
4. Otherwise English.

Never persist the language — handover is the sole writer of `.lang`.

## Read-only

No file writes of any kind, no git state changes, nothing persisted — in every mode, deep included. After a run both handover directories (including every `.lang`, `CURRENT.md`, and `CURRENT.archive.md`) are byte-identical.

## The brief

Four sections, in order, all localized:

<section-table>

| # | en | ja | zh |
|---|---|---|---|
| 1 | Current state | 現在の状況 | 当前状态 |
| 2 | Open threads and next steps | 未解決のスレッドと次のステップ | 待办线索与下一步 |
| 3 | Active gotchas | 今も有効なハマりどころ | 仍有效的踩坑记录 |
| 4 | Suggested actions | 推奨アクション | 建议行动 |

</section-table>

- Synthesize; cite note filenames so every claim traces back.
- Facts from `CURRENT.md` ride **with their confirmation dates** — surface the date next to each state fact; never grade freshness against a threshold. Dates are honest; cutoffs are false precision. A state entry outranks what an older note claims — the projection is later than the event.
- When the newest-date group holds more than one note, say so — count and authors (frontmatter `author`) — so same-day parallel handoffs are visible at a glance.
- Next steps come from the notes' "Next steps" sections, gotchas from "Gotchas". Drop threads a later note already resolved.
- Close with at most three pointer lines — one-liners, present only when the pool they point at is non-empty: older notes beyond the group → their count and `/catchup N`; commits omitted by the 50 cap → the omitted count and an offer of the full list; a non-empty archive → its entry count and `/catchup deep`. Pointers, never content: the default brief stays bounded.
- Facts only, no fabrication: if the notes don't say it, the brief doesn't say it.
