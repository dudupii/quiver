---
type: regex
target: trace
match: contains
pattern: "\"name\"\\s*:\\s*\"(?:Write|Edit|NotebookEdit)\"\\s*,\\s*\"input\"\\s*:\\s*\\{\\s*\"(?:file_path|notebook_path)\"\\s*:\\s*\"[^\"]*\\.handovers/CURRENT\\.md"
---

The state file is modified through a write tool — Write (full rewrite) or
Edit (in place) both satisfy the contract. Matched against the run's trace
as a JSON tool_use block whose `file_path` names `CURRENT.md`; the exact-path
content graders above decide whether the modification was *correct*, this one
only witnesses the act. (`files` cannot be used here: it lists only files the
run created, and a scaffold-seeded CURRENT.md that Claude edits is invisible
to it — documented harness semantics.)
