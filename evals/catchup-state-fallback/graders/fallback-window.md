---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*OSCAR-0)(?=[\\s\\S]*PAPA-1)(?=[\\s\\S]*QUEBEC-2)"
---

Without CURRENT.md the default window stays the latest THREE notes across
dates: OSCAR-0 (two notes back, on a different date than the newest) must
still reach the brief alongside PAPA-1 and QUEBEC-2 (lookahead-AND, not
any-one-of). This is the guard against same-date-group semantics leaking
into fallback mode — that leak would silently shrink the window to one
note.
