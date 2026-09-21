---
type: regex
target: {source: file, path: .handovers/CURRENT.md}
match: contains
pattern: "FOXTROT-2[^\\)]*confirmed 2026-04-10"
---

The untouched canary survives byte-for-byte: the FOXTROT-2 entry keeps its
ORIGINAL confirmation date. This is the "dates must not lie" pin — a run
that helpfully refreshes untouched dates (or rewrites the line) fails.
Bounded `[^)]*` keeps the match on the entry's single line.
