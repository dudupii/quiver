---
type: regex
target: "{source: file, path: .claude/handovers/*.md}"
match: contains
flags: m
pattern: "^## .*(本次做了什么|决策事项|放弃的选项与理由|踩坑记录)"
---

All eight sections must be present in Chinese; four header lines are checked
deterministically, the rest by the quality grader.
