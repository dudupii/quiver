---
type: regex
target: {source: file, path: .handovers/.lang}
match: contains
flags: m
pattern: "^zh$"
---

The resolved language is persisted to the NEW `.handovers/.lang`.
