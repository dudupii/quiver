---
type: regex
target: files
match: count:0
pattern: "handovers/"
---

Zero files under either handover directory are created or modified —
CURRENT.md included. Assumes the `files` target lists files the run
created or modified; the seeded notes, CURRENT.md, and `.lang` must not
count.
