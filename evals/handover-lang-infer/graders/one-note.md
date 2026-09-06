---
type: regex
target: files
match: count:1
pattern: "\\.handovers/[^/]*\\.md"
---

Exactly one note file is created (the `.lang` memory file does not match; no
scaffold seeds anything in this case).
