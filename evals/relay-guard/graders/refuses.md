---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*handover)(?=[\\s\\S]*note)"
flags: i
---

With no note to ignite from, the reply refuses and points at handover as
the way to create one (both words must appear).
