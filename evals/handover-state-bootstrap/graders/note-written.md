---
type: regex
target: files
match: count:1
pattern: "\\.handovers/\\d{4}-[^/]*\\.md"
---

Exactly one timestamped note is created — and, because the count includes
modified files, none of the four seeded notes is touched by the backscan
(reading them is required; editing them is forbidden).
