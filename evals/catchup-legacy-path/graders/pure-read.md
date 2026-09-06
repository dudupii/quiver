---
type: regex
target: files
match: count:0
pattern: "handovers/"
---

Zero files under either handover directory are created or modified — reading
legacy notes must not materialize `.handovers/` or touch `.lang`. Assumes the
`files` target lists files the run created; the seeded note must not count.
