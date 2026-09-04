---
type: regex
target: "{source: file, path: .claude/handovers/*.md}"
match: contains
flags: m
pattern: "^## .*(What was done|Decisions|Discarded options and why|Gotchas)"
---

The note is still a well-formed English handover — redaction trims values,
not structure.
