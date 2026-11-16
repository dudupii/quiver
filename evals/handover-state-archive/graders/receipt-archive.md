---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*CURRENT)(?=[\\s\\S]*[Aa]rchiv)"
---

The closing receipt reports the archive outcome: it mentions the state file
and the archive (lookahead-AND, not any-one-of). Demotions never land
silently — same rule as adds and supersedes.
