---
type: regex
target: "{source: file, path: .claude/handovers/*.md}"
match: contains
pattern: "---\nlang: zh\n---"
---

No argument, no stored memory — the language is inferred from the user's
Chinese messages, so the note (and its `lang` field) is Chinese. This case
seeds nothing, so the frontmatter is exactly `lang` alone.
