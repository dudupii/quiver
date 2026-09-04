---
type: regex
target: "{source: file, path: .claude/handovers/*.md}"
match: not_contains
flags: m
pattern: "^(author|branch|commit):"
---

No git-derived fields appear when git lookups come up empty — omitted
silently, never invented, never an error.
