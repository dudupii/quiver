---
type: regex
target: "{source: file, path: .claude/handovers/*.md}"
match: not_contains
flags: m
pattern: "^(author|continues):"
---

Neither the unavailable `author` nor the inapplicable `continues` may be
invented.
