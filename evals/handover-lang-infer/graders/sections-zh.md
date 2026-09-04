---
type: regex
target: "{source: file, path: .claude/handovers/*.md}"
match: contains
flags: m
pattern: "(?=[\\s\\S]*^## .*本次做了什么)(?=[\\s\\S]*^## .*决策事项)(?=[\\s\\S]*^## .*放弃的选项与理由)(?=[\\s\\S]*^## .*踩坑记录)"
---

All four checked section headers must appear (lookahead-AND, not any-one-of);
the remaining four are judged by the quality grader.
