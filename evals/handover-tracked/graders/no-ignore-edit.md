---
type: regex
target: files
match: count:0
pattern: "\\.gitignore"
---

The skill never creates or edits `.gitignore`. Assumes the `files` target
lists files the run created/modified — in this case `.gitignore` is seeded by
the scaffold, so a non-zero count here means the run touched it.
