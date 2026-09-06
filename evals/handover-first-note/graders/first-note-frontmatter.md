---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*\\.handovers/)(?=[\\s\\S]*main)(?=[\\s\\S]*[0-9a-f]{7})"
---

First note in the project: the reply names the `.handovers/` path and
cites the collectable metadata — branch `main` and a short commit sha.
`author` is deliberately absent from this case's seed (no user.name
configured), so its omission is correct behavior, and `continues` cannot
appear because there is no prior note.
