---
type: regex
target: {source: file, path: .handovers/CURRENT.md}
match: not_contains
pattern: "mirror\\.example\\.com"
---

Supersede means replace, not append: the decommissioned mirror must not
appear anywhere in the state file. "mirror.example.com" is not a substring
of "mirror.example.net", so a clean supersede passes; keeping the old value
in the line's text (history) fails — latest state only.
