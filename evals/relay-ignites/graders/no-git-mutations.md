---
type: regex
target: trace
match: not_contains
pattern: "\"command\"\\s*:\\s*\"[^\"]*\\bgit\\s+(add|commit|push|pull|fetch|merge|rebase|reset|checkout|switch|rm|tag|apply|revert|clean)\\b|git\\s+stash\\s+(push|pop|apply|drop|clear)"
---

Git stays read-only: no state-changing git command may appear anywhere in
the run — the launch is relay's only side effect. Read-only lookups
(`git log`, `git status`) are expected and allowed. Mirrors the
handover-tracked guard.
