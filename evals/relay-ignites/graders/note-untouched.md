---
type: regex
target: files
match: count:0
pattern: "handovers/"
---

Zero writes under either handover directory: no new note, no `.lang`.
Assumes the `files` target lists paths created during the run — the seeded
note must not count — and that this grader therefore covers creation only;
the modification half (editing the seeded note in place) is covered by the
trace-level no-writes grader.
