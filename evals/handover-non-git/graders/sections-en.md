---
type: regex
target: "{source: file, path: .claude/handovers/*.md}"
match: contains
flags: m
pattern: "(?=[\\s\\S]*^## .*What was done)(?=[\\s\\S]*^## .*Decisions)(?=[\\s\\S]*^## .*Discarded options and why)(?=[\\s\\S]*^## .*Gotchas)"
---

All four checked section headers must appear (lookahead-AND, not any-one-of);
the remaining four are judged by the quality grader.
