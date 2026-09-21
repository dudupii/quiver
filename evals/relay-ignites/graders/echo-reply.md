---
type: regex
target: last_message
match: contains
pattern: "(?=^[^\\n]*stub-bin/claude[^\\n]*--bg[^\\n]*$)(?=^[^\\n]*stub-bin/claude[^\\n]*--name[^\\n]*$)(?=^[^\\n]*stub-bin/claude[^\\n]*(?:toggle|contrast|regression)[^\\n]*$)(?=^[^\\n]*stub-bin/claude[^\\n]*\\.handovers/2026-01-02_0500\\.md[^\\n]*$)"
flags: m
---

The reply echoes the exact launch command: background flag, a name
carrying the toggle thread, and the note path in the seed — each element
sharing one line with the launcher path, order among the flags free
(matching launch-once's flag-order tolerance). Line-scoped lookaheads
with the multiline flag: prose that merely mentions the pieces, with no
launcher path on the line, does not pass.
