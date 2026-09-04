---
name: catchup
description: Read the latest handover notes and reply with a four-section catch-up brief — current state, open threads, gotchas, suggested actions. Use when starting or taking over work in a project that has handover notes, or when the user says "catchup", "catch me up", "接班".
argument-hint: "[N]"
---

# Catch-up Brief

Read the latest handover notes and brief the incoming session, in-conversation. Strictly read-only — that is what makes auto-triggering safe.

## Reading the notes

1. List `*.md` files in `.claude/handovers/` and sort by filename; `.lang` is not a note.
2. Read the latest N notes — default 3; a numeric argument widens the window (`/catchup 5`).
3. Notes without frontmatter (legacy format) are read like any other.
4. If the directory is missing or has no notes, say so briefly in the resolved language and stop. Never invent content.

## Language resolution

1. An explicit language request in the conversation wins.
2. Otherwise read `.claude/handovers/.lang` if it exists.
3. Otherwise infer from the user's messages.
4. Otherwise English.

Never persist the language — handover is the sole writer of `.lang`.

## Read-only

No file writes of any kind, no git state changes, nothing persisted. After a run the handover directory (including `.lang`) is byte-identical.

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
- Next steps come from the notes' "Next steps" sections, gotchas from "Gotchas". Drop threads a later note already resolved.
- Facts only, no fabrication: if the notes don't say it, the brief doesn't say it.
