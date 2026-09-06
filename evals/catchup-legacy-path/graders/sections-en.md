---
type: regex
target: last_message
match: contains
flags: m
pattern: "(?=[\\s\\S]*^## .*Current state)(?=[\\s\\S]*^## .*Open threads and next steps)(?=[\\s\\S]*^## .*Active gotchas)(?=[\\s\\S]*^## .*Suggested actions)"
---

All four brief sections in English (inferred from the English prompt — no
`.lang` memory is seeded), built from the legacy-path notes (lookahead-AND).
