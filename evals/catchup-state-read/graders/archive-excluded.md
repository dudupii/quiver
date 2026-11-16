---
type: regex
target: last_message
match: not_contains
pattern: "ARCHIVE-POOL"
---

Archived facts do not leak into the default brief. The markers exist only
in `CURRENT.archive.md`; the default read is the working set plus the
newest-date notes — the archive is pointed at, not hauled in.
