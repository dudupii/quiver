---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*(?:CAPDELTA-55|pass 55))"
---

The newest commit of the delta is folded in — capping keeps the recent end
of the range, never the whole thing vague. Either spelling counts: the
commit token (`CAPDELTA-55`) or its subject tail (`pass 55`) — a brief may
cite HEAD by sha and pass number without repeating the token prefix.
