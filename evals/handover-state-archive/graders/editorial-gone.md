---
type: regex
target: {source: file, path: .handovers/CURRENT.md}
match: not_contains
pattern: "STALE-THREAD"
---

A completed thread leaves the working set entirely — the next session's
brief should not carry "finish the FLAG_X cutover" as a live fact after the
session reported it done.
