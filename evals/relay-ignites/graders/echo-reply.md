---
type: regex
target: last_message
match: contains
pattern: "stub-bin/claude[^\\n]*--bg[^\\n]*--name[^\\n]*(?:toggle|contrast|regression)[^\\n]*\\.handovers/2026-01-02_0500\\.md"
---

The reply echoes the exact launch command on one line: stub path, background
flag, a name carrying the toggle thread, and the note path in the seed.
A single regex, not scattered lookaheads — prose that merely mentions the
pieces without the command itself does not pass.
