---
type: regex
target: trace
match: not_contains
pattern: "\"command\"\\s*:\\s*\"[^\"]*\\bgit\\s+(add|commit|push|pull|fetch|merge|rebase|reset|checkout|switch|stash|rm|tag|apply|revert|clean)"
---

The skill never mutates git state: no state-changing git command may appear
anywhere in the run. Read-only lookups (config, rev-parse, ls-files,
check-ignore, log) are expected and allowed.
