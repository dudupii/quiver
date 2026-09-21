---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*KILO-6)(?=[\\s\\S]*LIMA-7)"
---

The whole same-date group is read, not just the newest note: KILO-6 (the
16:00 note) and LIMA-7 (the 19:30 note) both reach the brief
(lookahead-AND, not any-one-of). A same-day sibling handoff — the
concurrent-agent gap — must never be missed.
