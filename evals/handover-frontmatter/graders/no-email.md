---
type: regex
target: "{source: file, path: .claude/handovers/*.md}"
match: not_contains
pattern: "example\\.com|[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
---

No email anywhere in the note — the seeded commit identity's address must not
leak into `author`.
