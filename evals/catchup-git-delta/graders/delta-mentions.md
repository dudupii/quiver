---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*DELTA-MARKER-ONE)(?=[\\s\\S]*DELTA-MARKER-TWO)"
---

Both post-handover commits reach the brief (lookahead-AND): the newest note's
recorded `commit`..HEAD range is exactly the two DELTA-MARKER commits, and
"what happened since the last handover" must include both.
