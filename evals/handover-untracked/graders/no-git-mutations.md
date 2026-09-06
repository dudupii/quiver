---
type: regex
target: trace
match: not_contains
pattern: "\"command\"\\s*:\\s*\"[^\"]*\\bgit\\s+(add|commit|push|pull|merge|rebase|reset|checkout|switch|rm|tag|apply|revert|clean)\\b|git\\s+stash\\s+(push|pop|apply|drop|clear)"
---

The skill never mutates git state: no state-changing git command may
appear anywhere in the run. Read-only lookups are expected and allowed —
including `git stash list`, `git branch -a`, `git fetch`, config/rev-parse/
ls-files/check-ignore/log.
