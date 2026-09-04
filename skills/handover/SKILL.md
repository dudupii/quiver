---
name: handover
description: Write a session handover note at the end of a session or milestone — what was done, decisions, discarded options and why, gotchas, learnings, next steps, suggested skills. Use when wrapping up a session or when the user says "handover", "交接", "引き継ぎ".
argument-hint: "[en|ja|zh]"
disable-model-invocation: true
---

# Session Handover

Generate a handover note for this session's work, in the resolved language.

## Language resolution

1. If the user passed `en`, `ja`, or `zh` as the argument, use it.
2. Otherwise read `.claude/handovers/.lang` (project-level memory); if it exists, use the stored language.
3. Otherwise default to `en`.

When the language came from an argument, persist it to `.claude/handovers/.lang` (creating the directory if needed) so the next run defaults to it. Write the entire note — including section headers — in the resolved language.

## Rules

- **Reference, don't duplicate**: never copy content already captured in other artifacts (specs, plans, ADRs, issues, commits, diffs, earlier handovers). Link by path instead.
- **Redact secrets**: no API keys, tokens, passwords, or personal data in the note.
- Facts only, bullets over prose, no speculation.
- The **Discarded options** section is the most valuable one: it stops the next session from re-litigating settled questions.

## Process

1. Review what this session did.
2. Ensure `.claude/handovers/` exists.
3. Write the note to `.claude/handovers/YYYY-MM-DD_HHmm.md` (e.g. `2026-02-17_1430.md`). On name collision append `_2`, `_3`, …
4. Persist the resolved language if it was set by argument.

## Sections

Include every section, in order. When a section has nothing, write the "none" placeholder in the note's language.

<section-table>

| # | en | ja | zh |
|---|---|---|---|
| 1 | What was done | 今回やったこと | 本次做了什么 |
| 2 | Decisions | 決定事項 | 决策事项 |
| 3 | Discarded options and why | 捨てた選択肢と理由 | 放弃的选项与理由 |
| 4 | Gotchas | ハマりどころ | 踩坑记录 |
| 5 | Learnings | 学び | 学到的东西 |
| 6 | Next steps (mark priorities) | 次にやること（優先度付き） | 下一步（带优先级） |
| 7 | Suggested skills — which skills the next session should invoke, and for what | 次に使うべきスキル（何に使うか） | 建议使用的技能（用来做什么） |
| 8 | Related files — paths of the main files touched | 関連ファイル（パス一覧） | 相关文件（路径清单） |

</section-table>
