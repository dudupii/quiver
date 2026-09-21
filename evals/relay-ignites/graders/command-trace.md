---
type: regex
target: trace
match: contains
pattern: "(?=[\\s\\S]*stub-bin/claude)(?=[\\s\\S]*--bg)(?=[\\s\\S]*--name)(?=[\\s\\S]*\\.handovers/2026-01-02_0500\\.md)"
---

The launch tool call, as it rides in the trace, carries the full contract:
the stub launcher path, the background flag, a descriptive name, and the
seed pointing at the newest note's path — a pointer, not a copy
(lookahead-AND, not any-one-of).
