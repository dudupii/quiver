---
type: regex
target: files
match: count:1
pattern: "\\.claude/handovers/[^/]*\\.md"
---

Exactly one note file is created (assumes the `files` target lists files the
run created, not pre-seeded ones — there are no seeded notes in this case).
