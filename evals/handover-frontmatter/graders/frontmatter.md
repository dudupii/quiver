---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*Test User)(?=[\\s\\S]*main)(?=[\\s\\S]*[0-9a-f]{7})(?=[\\s\\S]*2026-01-01_0000\\.md)"
---

The reply cites the full metadata chain: author, branch, commit sha, and
`continues` resolving the seeded legacy note (which lives in the OLD
`.claude/handovers/` directory — the dual-path read this case locks).
