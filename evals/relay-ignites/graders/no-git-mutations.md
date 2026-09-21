---
type: regex
target: trace
match: not_contains
pattern: "\"command\"\\s*:\\s*\"[^\"]*\\bgit\\s+(add|commit|push|pull|fetch|merge|rebase|reset|checkout|switch|rm|tag|apply|revert|clean|restore|branch|mv|worktree)\\b|\"command\"\\s*:\\s*\"[^\"]*\\bgit\\s+stash\\b(?!\\s+list\\b)"
---

Git stays read-only: no state-changing git command may appear in any Bash
command value — both halves of the pattern are anchored to the `command`
JSON key so prose or a Read of a note cannot trip them. Read-only lookups
are expected and allowed: `git log`, `git status`, `git stash list`.
Mirrors the handover-tracked guard, extended with restore/branch/mv/
worktree and stash (bare or mutating subcommand; `list` exempt).
