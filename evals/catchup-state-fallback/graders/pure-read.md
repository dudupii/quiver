---
type: regex
target: files
match: count:0
pattern: "handovers/"
---

Zero files under either handover directory are created or modified —
fallback mode must not spontaneously create CURRENT.md (that write belongs
to handover alone). Assumes the `files` target lists files the run created
or modified; the seeded notes and `.lang` must not count.
