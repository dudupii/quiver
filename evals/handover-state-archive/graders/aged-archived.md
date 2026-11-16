---
type: regex
target: {source: file, path: .handovers/CURRENT.archive.md}
match: contains
pattern: "AGED-FACT[^\\)]*confirmed 2026-06-18"
---

The over-90-days entry is archived with its ORIGINAL confirmation date — the
age backstop demotes, it never edits. A refreshed date or a rewritten line
fails this pin. Bounded `[^)]*` keeps the match on the entry's single line.
