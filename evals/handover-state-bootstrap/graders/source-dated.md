---
type: regex
target: {source: file, path: .handovers/CURRENT.archive.md}
match: contains
pattern: "confirmed 2026-01-05 \\| source: 2026-01-05_0900\\.md"
---

Bootstrap dates each entry at its SOURCE note's date, not the run date —
the pass projects, it does not re-confirm. The GOLF-1 entry carries the
January date of the note it was distilled from; a bootstrap that stamps
today's date on backfilled history fails the "dates must not lie" pin.
