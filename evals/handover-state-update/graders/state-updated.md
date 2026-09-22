---
type: regex
target: trace
match: contains
pattern: "(?:\"name\"\\s*:\\s*\"(?:Write|Edit|NotebookEdit)\"\\s*,\\s*\"input\"\\s*:\\s*\\{\\s*\"(?:file_path|notebook_path)\"\\s*:\\s*\"[^\"]*\\.handovers/CURRENT\\.md(?![\\w.-])|\"command\"\\s*:\\s*\"(?:[^\"\\\\]|\\\\.)*(?:\\bsed\\s+-i(?:[^\"\\\\]|\\\\.)*|\\brm\\s+(?:[^\"\\\\]|\\\\.)*|>{1,2}\\s*[\"']?(?:[^\"\\\\\\s;&|]|\\\\.)*)\\.handovers/CURRENT\\.md(?![\\w.-]))"
---

The state file is modified through a write tool — Write (full rewrite) or
Edit (in place) both satisfy the contract — or, equivalently, through a
shell write aimed at it (sed -i / rm / redirection, the no-shell-writes
idiom), so a compliant run cannot false-fail on mechanism. Matched against
the run's trace as a JSON tool_use block whose `file_path` names
`CURRENT.md`, or a Bash `command` writing it. The trailing lookahead keeps
`CURRENT.md.bak`-style prefixes from counting. The exact-path content
graders above decide whether the modification was *correct*; this one only
witnesses the act. (`files` cannot be used here: it lists only files the
run created, and a scaffold-seeded CURRENT.md that Claude edits is
invisible to it — documented harness semantics.)
