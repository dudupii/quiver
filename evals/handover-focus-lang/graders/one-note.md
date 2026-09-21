---
type: regex
target: files
match: count:1
pattern: "\\.handovers/\\d{4}-[^/]*\\.md"
---

Exactly one note file is created — the `.lang` memory file, though also
written here (see lang-memory.md), does not match the `.md` pattern. No
scaffold seeds anything in this case.
