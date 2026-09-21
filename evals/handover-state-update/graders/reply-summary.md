---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*CURRENT)(?=[\\s\\S]*mirror\\.example\\.net)"
---

The closing reply reports the state-file change: it mentions CURRENT and the
superseded value (lookahead-AND, not any-one-of). A silent state update —
note echoed, projection changed invisibly — fails.
