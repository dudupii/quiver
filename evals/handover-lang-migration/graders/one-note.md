---
type: regex
target: files
match: count:1
pattern: "\\.handovers/[^/]*\\.md"
---

Exactly one note file is created, in the NEW `.handovers/` directory (the
`.lang` memory file does not match).
