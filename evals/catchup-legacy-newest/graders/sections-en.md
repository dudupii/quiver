---
type: regex
target: last_message
match: contains
flags: m
pattern: "(?=[\\s\\S]*^## .*Current state)(?=[\\s\\S]*^## .*Open threads and next steps)(?=[\\s\\S]*^## .*Active gotchas)(?=[\\s\\S]*^## .*Suggested actions)"
---

The brief still renders all four sections (lookahead-AND) — a legacy newest
note degrades silently, not fatally.
