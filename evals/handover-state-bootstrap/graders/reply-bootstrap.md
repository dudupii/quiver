---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*CURRENT)(?=[\\s\\S]*GOLF-1)"
---

The closing reply reports the bootstrap: it mentions CURRENT and a rescued
fact (lookahead-AND). Backfilling the projection silently fails the
visibility contract.
