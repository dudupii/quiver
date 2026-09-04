---
type: regex
target: files
match: count:1
pattern: "\\.claude/handovers/[^/]*\\.md"
---

A new note is written despite the directory not being a git repository.
Assumes the `files` target lists files the run created; the seeded
`2026-01-01_0000.md` must not count. If this grader fails with count 2 on the
first gated run, the `files` target enumerates all sandbox files — tighten the
pattern then.
