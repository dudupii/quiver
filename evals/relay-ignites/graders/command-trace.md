---
type: regex
target: trace
match: contains
pattern: "(?=[\\s\\S]*stub-bin/claude[^\\n]*--bg)(?=[\\s\\S]*stub-bin/claude[^\\n]*--name[^\\n]*toggle)(?=[\\s\\S]*stub-bin/claude[^\\n]*\\.handovers/2026-01-02_0500\\.md)"
---

The launch command, as it rides in the trace, carries the full contract on
one line: the stub launcher path, the background flag, a name that derives
from the toggle thread, and the seed pointing at the newest note's path.
Each lookahead is anchored to the launcher path so a Read/Glob of the note
elsewhere in the trace cannot satisfy the path requirement
(lookahead-AND, not any-one-of). The trace is one JSON message per line,
which is what makes the `[^\n]*` anchors meaningful.
