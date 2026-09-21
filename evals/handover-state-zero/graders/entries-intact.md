---
type: regex
target: {source: file, path: .handovers/CURRENT.md}
match: contains
pattern: "(?=[\\s\\S]*HOTEL-4)(?=[\\s\\S]*INDIA-5)"
---

Both seeded entries are still present (lookahead-AND): even if the
files-target semantics were to miss a same-content rewrite, the content
itself confirms nothing was dropped (lookahead-AND, not any-one-of).
