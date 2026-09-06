---
type: regex
target: files
match: count:0
pattern: "handovers/"
---

Zero files under either handover directory (`.handovers/` or legacy `.claude/handovers/`) are created or modified. Assumes the
`files` target lists files the run created; the seeded notes and `.lang`
must not count.
