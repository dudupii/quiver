---
type: regex
target: "{source: file, path: .claude/handovers/*.md}"
match: contains
flags: m
pattern: "(?=[\\s\\S]*^## .*What was done)(?=[\\s\\S]*^## .*Decisions)(?=[\\s\\S]*^## .*Discarded options and why)(?=[\\s\\S]*^## .*Gotchas)(?=[\\s\\S]*^## .*Learnings)(?=[\\s\\S]*^## .*Next steps)(?=[\\s\\S]*^## .*Suggested skills)(?=[\\s\\S]*^## .*Related files)"
---

All eight section headers must be present (lookahead-AND, not any-one-of).
