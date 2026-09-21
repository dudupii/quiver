---
type: regex
target: last_message
match: contains
flags: m
pattern: "(?=[\\s\\S]*^## .*当前状态)(?=[\\s\\S]*^## .*待办线索与下一步)(?=[\\s\\S]*^## .*仍有效的踩坑记录)(?=[\\s\\S]*^## .*建议行动)"
---

All four brief sections are present in Chinese (lookahead-AND, not
any-one-of) — state mode changes what is read, not the brief's shape.
