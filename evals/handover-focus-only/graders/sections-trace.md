---
type: regex
target: trace
match: contains
pattern: "^(?=[\\s\\S]*OMNI-8)(?=[\\s\\S]*What was done)(?=[\\s\\S]*Decisions)(?=[\\s\\S]*Discarded options and why)(?=[\\s\\S]*Gotchas)(?=[\\s\\S]*Learnings)(?=[\\s\\S]*Next steps)(?=[\\s\\S]*Suggested skills)(?=[\\s\\S]*Related files)"
---

Emphasis, not selection: with a focus-only argument the note — written
through the Write tool call, whose payload rides in the trace — still
contains all eight section headers in English AND carries the focus thread
(OMNI-8) itself (lookahead-AND, not any-one-of).
