---
type: regex
target: files
match: count:0
pattern: "\\.claude/"
---

Nothing under `.claude/` is created — the missing handover directory is not
silently materialized, no `.lang` memory is written. Assumes the `files`
target lists files the run created.
