---
type: regex
target: files
match: count:0
pattern: "handovers/"
---

Zero files under either handover directory (`.handovers/` or legacy `.claude/handovers/`) are created or modified — archive included: a deep read
never rewrites `CURRENT.md` or `CURRENT.archive.md`. Assumes the `files`
target lists files the run created; the seeded files must not count.
