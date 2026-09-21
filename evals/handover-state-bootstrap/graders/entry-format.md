---
type: regex
target: {source: file, path: .handovers/CURRENT.md}
match: contains
pattern: "\\(confirmed 20[0-9]{2}-[0-9]{2}-[0-9]{2} \\| source: [0-9]{4}-"
---

Every entry carries the fixed shape — confirmed date and source note in the
one-line format — so the file stays greppable and machine-parseable.
