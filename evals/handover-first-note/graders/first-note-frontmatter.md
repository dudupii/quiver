---
type: regex
target: "{source: file, path: .claude/handovers/*.md}"
match: contains
pattern: "---\nbranch: main\ncommit: [0-9a-f]{7,40}\nlang: en\n---"
---

With no stored `user.name` and no prior note, `author` and `continues` are
omitted and the documented field order is preserved (`branch`, `commit`,
`lang`).
