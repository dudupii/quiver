---
type: regex
target: trace
match: contains
pattern: "^(?=[\\s\\S]*OMNI-7)(?=[\\s\\S]*本次做了什么)(?=[\\s\\S]*决策事项)(?=[\\s\\S]*放弃的选项与理由)(?=[\\s\\S]*踩坑记录)(?=[\\s\\S]*学到的东西)(?=[\\s\\S]*下一步)(?=[\\s\\S]*建议使用的技能)(?=[\\s\\S]*相关文件)"
---

Emphasis, not selection: with a focus present the note — written through the
Write tool call, whose payload rides in the trace — still contains all eight
section headers in Chinese AND carries the focus thread (OMNI-7) itself
(lookahead-AND, not any-one-of).
