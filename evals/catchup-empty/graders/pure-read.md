---
type: regex
target: files
match: count:0
pattern: "handovers/"
---

Neither handover directory (`.handovers/` nor legacy `.claude/handovers/`)
is silently materialized, no `.lang` memory is written. Assumes the `files`
target lists files the run created.
