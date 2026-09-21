---
name: handover
description: Write a session handover note at the end of a session or milestone — what was done, decisions, discarded options and why, gotchas, learnings, next steps, suggested skills. User-requested only - invoke when the user explicitly says "handover", "交接", "引き継ぎ", or clearly asks for a handover note; a session merely ending is NOT a trigger. Never invoke on your own initiative.
argument-hint: "[en|ja|zh] [focus]"
disable-model-invocation: true
---

# Session Handover

Generate a handover note for this session's work, in the resolved language, weighted toward the focus when one was passed.

## Note locations: read old, write new

Notes live in `.handovers/` at the project root. The legacy `.claude/handovers/` (pre-0.4.0) is still **read** — for prior notes and the language memory — but never written. Never move, rename, or delete a legacy note; migration is the user's business. The directory also holds the current-state file `CURRENT.md` (below); it and `.lang` are not notes.

## Argument parsing

The argument (when present) splits into an optional language token and an optional free-text focus:

- If the **first token** is exactly `en`, `ja`, or `zh`, it is the language; **everything after it** is the focus. `/handover zh finalize the release` → language `zh`, focus `finalize the release`.
- Otherwise the **entire argument** is the focus and the language resolves through the usual chain below. `/handover fix login bug` → focus `fix login bug`, language inferred.
- An empty argument means neither: uniform-depth note, language as usual.

## Language resolution

1. If the argument carried a language token, use it.
2. Otherwise read `.handovers/.lang`, then legacy `.claude/handovers/.lang`; use the first that exists.
3. Otherwise infer the language from the user's messages in this session; when they are mixed or unclear, fall back to `en`.

When the language came from an argument token, persist it to `.handovers/.lang` (creating the directory if needed) so the next run defaults to it. Write the entire note — including section headers — in the resolved language.

## Focus

The focus names what the next session will concentrate on. It shapes emphasis only:

- **Emphasis, not selection**: write every section as usual. Deepen the threads the focus touches — richer entries under *What was done* / *Gotchas*, the focused thread's items at the top of *Next steps* — and condense unrelated threads to their essentials.
- The focus licenses no other change: no dropping or inventing facts, and every rule in **Rules** (reference-don't-duplicate, redaction, facts-only) applies unchanged.

## Rules

- **Reference, don't duplicate**: never copy content already captured in other artifacts (specs, plans, ADRs, issues, commits, diffs, earlier handovers). Link by path instead. Its live-state corollary: never restate what a read-only `git`/`gh` query answers at read time (branch tips, PR mergeability, open-issue counts) — in the note or the state file; record only what the query cannot return: intent and waiting-points. Frontmatter `branch`/`commit` are the exception — they anchor the note in history, they do not describe current state.
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
- `continues` names the most recent existing `*.md` note across `.handovers/` and legacy `.claude/handovers/` (new path wins a filename tie) by filename order at write time; `.lang` memory files and `CURRENT.md` are not notes. Omit it when there is no prior note.
- Notes without frontmatter (written before this convention) are still valid `continues` targets, in either directory.

## Current-state file: `CURRENT.md`

Notes are the **event log** and the system of record; `CURRENT.md` is the **state projection** — what a fresh session needs to know *now*. One line per durable fact, latest state only:

```
- <fact, one telegraphic line> (confirmed YYYY-MM-DD | source: <note filename>)
```

Flat list, no sections, no frontmatter. The fact text is written in the run's resolved language; the `confirmed`/`source` markers stay in English so every line stays greppable. Superseding replaces the line in place (new value, new date, new source); refuting deletes it; the old value survives in git history and in the source note.

**Durable vs temporal** — the judgment the projection asks for:

- **Durable** (belongs in `CURRENT.md`): standing facts a future session still needs — environment requirements, standing constraints, the current state of things that evolved (a dependency's version, the working install path), verification status that outlives the session.
- **Temporal** (stays in the note only): one-off events, process detail of superseded intermediate states, anything a read-only query answers at read time, anything already captured elsewhere by path.

**The update contract** — hard rules:

1. Add facts that became durable this session.
2. Supersede entries whose truth this session changed.
3. Delete entries this session refuted.
4. **Untouched entries are never edited and their `confirmed` dates never refreshed** — a date may only change when the fact itself was re-confirmed. Dates must not lie.
5. Zero writes when the session produced nothing durable — never invent entries for the sake of writing.

**Bootstrap**: when notes exist but `CURRENT.md` does not (first run after the upgrade, or a repo that never adopted it), perform a one-time full pass over every note in both directories, distill the durable facts into entries confirmed today, each pointing at its original source note. Later runs are incremental only.

**Concurrent writes**: re-read `CURRENT.md` immediately before writing and merge this session's changes into what was just read — no locks. Invariant that makes every failure recoverable: the notes are the system of record, `CURRENT.md` is a rebuildable projection; when in doubt about its integrity, the bootstrap pass is the recovery path.

When the run changed the state file (including a bootstrap), the closing reply lists the changes — one line each: added, superseded, deleted (bootstrap: the entry count).

## Process

1. Review what this session did, weighing each thread against the focus (if any) to decide its depth.
2. Collect note metadata with read-only lookups: `git config user.name`, `git branch --show-current`, `git rev-parse --short HEAD`, and the latest existing note filename across both directories (omit fields whose lookup fails).
3. Ensure `.handovers/` exists.
4. Write the note — frontmatter block, then every section — to `.handovers/YYYY-MM-DD_HHmm.md` (e.g. `2026-02-17_1430.md`). On name collision append `_2`, `_3`, …
5. Maintain `CURRENT.md` per its section — bootstrap when it is absent and notes exist, otherwise the incremental contract (re-read, merge, write).
6. Persist the resolved language to `.handovers/.lang` if it was set by argument.
7. Sharing check (read-only): if `git ls-files .handovers/ .claude/handovers/` lists tracked notes and `git check-ignore -q <note>` reports the new note as not ignored, close with a single line in the resolved language suggesting to commit the note so teammates can see it. If both directories are gitignored or untracked, or this is not a git repository, say nothing about git.

## Sections

Include every section, in order. When a section has nothing, write the "none" placeholder in the note's language.

Section guidance beyond the table:

- **Verification tags** (*What was done*, *Next steps*): key claims carry their verification status — `…shipped in abc1234 (verified: 20/20 gold samples)` vs `…released (unverified: install not confirmed)`. The next session must be able to tell confirmed-working from shipped-but-never-exercised.
- **Related files** — when the project keeps a session memory directory, list it plus the memory files this session touched, so agents that do not auto-load it can find the durable knowledge.

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
