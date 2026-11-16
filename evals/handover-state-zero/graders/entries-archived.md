---
type: regex
target: {source: file, path: .handovers/CURRENT.archive.md}
match: contains
pattern: "(?=[\\s\\S]*HOTEL-4[^\\)]*confirmed 2026-04-10)(?=[\\s\\S]*INDIA-5[^\\)]*confirmed 2026-04-10)"
---

Both seeded entries (confirmed 2026-04-10, over the 90-day backstop at any
plausible run date) are aged into the archive with their ORIGINAL dates
verbatim — relocation is not an edit. This is the "zero-writes never blocks
aging" pin: the session produced nothing durable, yet the projection is
still maintained. Bounded `[^)]*` keeps each match on its entry line.
