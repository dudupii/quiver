---
type: regex
target: files
match: count:1
pattern: "\\.handovers/\\d{4}-[^/]*\\.md"
---

The note is still written — a session with nothing durable still gets its
event-log entry (digit-anchored pattern counts notes only, excluding
CURRENT.md and .lang).
