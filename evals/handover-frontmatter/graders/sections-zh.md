---
type: regex
target: "{source: file, path: .claude/handovers/*.md}"
match: contains
flags: m
pattern: "(?=[\\s\\S]*^## .*本次做了什么)(?=[\\s\\S]*^## .*决策事项)(?=[\\s\\S]*^## .*放弃的选项与理由)(?=[\\s\\S]*^## .*踩坑记录)(?=[\\s\\S]*^## .*学到的东西)(?=[\\s\\S]*^## .*下一步)(?=[\\s\\S]*^## .*建议使用的技能)(?=[\\s\\S]*^## .*相关文件)"
---

All eight section headers must be present (lookahead-AND, not any-one-of).
