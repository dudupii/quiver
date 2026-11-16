---
type: regex
target: {source: file, path: .handovers/CURRENT.md}
match: not_contains
pattern: "(?:HOTEL-4|INDIA-5|confirmed 20)"
---

The working set ends empty: both seeded entries are gone from CURRENT.md
(moved, not copied), and nothing was invented in their place — a
zero-durable session adds no entries. Aging is maintenance of the
projection, not entry invention.
