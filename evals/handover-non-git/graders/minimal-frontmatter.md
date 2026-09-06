---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*\\.handovers/)(?=[\\s\\S]*lang)"
---

Non-git directory: git lookups fail and their fields are silently omitted,
so the reply must not present any `author`/`branch`/`commit` value — only
the note path and language remain.
