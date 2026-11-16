---
type: regex
target: {source: file, path: .handovers/CURRENT.md}
match: not_contains
pattern: "AGED-FACT"
---

Archive means move, not copy: once demoted, the aged entry leaves the
working set entirely.
