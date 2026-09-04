---
type: regex
target: "{source: file, path: .claude/handovers/*.md}"
match: contains
flags: m
pattern: "^## .*(本次做了什么|决策事项|放弃的选项与理由|踩坑记录)"
---

Headers included, the whole note follows the inferred language.
