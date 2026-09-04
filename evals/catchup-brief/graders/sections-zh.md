---
type: regex
target: last_message
match: contains
flags: m
pattern: "(?=[\\s\\S]*^## .*当前状态)(?=[\\s\\S]*^## .*待办线索与下一步)(?=[\\s\\S]*^## .*仍有效的踩坑记录)(?=[\\s\\S]*^## .*建议行动)"
---

All four brief sections must be present in Chinese, the language stored in
the seeded `.claude/handovers/.lang` (lookahead-AND, not any-one-of).
