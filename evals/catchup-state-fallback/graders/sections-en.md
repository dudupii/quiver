---
type: regex
target: last_message
match: contains
flags: m
pattern: "(?=[\\s\\S]*^## .*Current state)(?=[\\s\\S]*^## .*Open threads)(?=[\\s\\S]*^## .*Active gotchas)(?=[\\s\\S]*^## .*Suggested actions)"
---

All four brief sections are present in English (lookahead-AND, not
any-one-of) — the fallback brief keeps its shape and language (from
`.lang` memory).
