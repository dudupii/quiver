---
type: regex
target: files
match: count:1
pattern: "\\.handovers/\\d{4}-[^/]*\\.md"
---

Exactly one timestamped note is created. The digit-anchored pattern excludes
`CURRENT.md` and `.lang` (neither starts with a year), so this counts notes
only.
