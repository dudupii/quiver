---
type: regex
target: "{source: file, path: .claude/handovers/*.md}"
match: contains
flags: m
pattern: "^## .*(What was done|Decisions|Discarded options and why|Gotchas)"
---

The eight-section structure is unchanged by the missing metadata.
