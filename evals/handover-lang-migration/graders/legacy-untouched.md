---
type: regex
target: files
match: count:0
pattern: "claude/handovers"
---

Nothing under the legacy `.claude/handovers/` directory is created or
modified — the old `.lang` (ja) is read, never rewritten or moved.
