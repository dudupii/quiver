---
type: regex
target: files
match: count:0
pattern: "\\.claude/handovers/"
---

Zero files under the handover directory are created or modified — no new
note, no `.lang` rewrite (the pattern covers everything under the dir,
`.lang` included). Assumes the `files` target lists files the run created;
the four seeded notes and `.lang` must not count. If this grader fails with
count 4 or 5 on the first gated run, the `files` target enumerates all
sandbox files — tighten the pattern then.
