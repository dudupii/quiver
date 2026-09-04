---
type: regex
target: files
match: count:0
pattern: "\\.claude/handovers/"
---

Zero files under the handover directory are created or modified. Assumes the
`files` target lists files the run created; the seeded notes and `.lang`
must not count.
