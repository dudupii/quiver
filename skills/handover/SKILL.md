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
3. Otherwise infer the language from the user's messages in this session; when they are mixed or unclear, fall back to `en`.

When the language came from an argument, persist it to `.claude/handovers/.lang` (creating the directory if needed) so the next run defaults to it. Write the entire note — including section headers — in the resolved language.

## Rules

- **Reference, don't duplicate**: never copy content already captured in other artifacts (specs, plans, ADRs, issues, commits, diffs, earlier handovers). Link by path instead.
- **Redact secrets**: no API keys, tokens, passwords, or personal data in the note. Before writing, scan the draft for credential patterns — `sk-…`, `ghp_…`/`gho_…`, `AKIA…`, `xox[bap]-…`, `-----BEGIN … PRIVATE KEY-----`, `password: …` — and rewrite any hit: keep the fact, drop the value.
- **Read-only git**: never run a state-changing git command (`add`, `commit`, `push`, `checkout`, …) and never edit `.gitignore` — git's only role in this skill is read-only lookup.
- Facts only, bullets over prose, no speculation.
- The **Discarded options** section is the most valuable one: it stops the next session from re-litigating settled questions.

## Note format

The note file starts with a YAML frontmatter block, then the eight sections:

```yaml
---
author: dupi          # git config user.name — never the email
branch: main          # current branch
commit: 71b50e8       # short HEAD sha
lang: zh              # language this note is written in
continues: 2026-02-17_1430.md   # most recent existing note at write time
---
```

Metadata rules:

- `author`, `branch`, `commit` are collected with read-only git commands. When a lookup fails or comes back empty (for example in a non-git directory), silently omit that field — never error, never substitute a guess.
- **No email**: never read or write `git config user.email`; `author` is `user.name` only.
- `lang` is always present.
- `continues` names the most recent existing `*.md` note in `.claude/handovers/` by filename order at write time; the `.lang` memory file is not a note. Omit it when there is no prior note.
- Notes without frontmatter (written before this convention) are still valid `continues` targets.

## Process

1. Review what this session did.
2. Collect note metadata with read-only lookups: `git config user.name`, `git branch --show-current`, `git rev-parse --short HEAD`, and the latest existing note filename (omit fields whose lookup fails).
3. Ensure `.claude/handovers/` exists.
4. Write the note — frontmatter block, then every section — to `.claude/handovers/YYYY-MM-DD_HHmm.md` (e.g. `2026-02-17_1430.md`). On name collision append `_2`, `_3`, …
5. Persist the resolved language if it was set by argument.
6. Sharing check (read-only): if `git ls-files .claude/handovers/` lists tracked notes and the new note is not gitignored (`git check-ignore -q <note>` exits non-zero), close with a single line in the resolved language suggesting to commit the note so teammates can see it. If the directory is gitignored or untracked, or this is not a git repository, say nothing about git.

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
