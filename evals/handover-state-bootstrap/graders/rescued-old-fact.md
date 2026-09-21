---
type: regex
target: {source: file, path: .handovers/CURRENT.md}
match: contains
pattern: "GOLF-1"
---

The install-era durable fact from the OLDEST note is rescued into the state
file. This is the core bootstrap promise: still-true facts are not left
buried by note age (the session itself produced nothing durable, so GOLF-1
can only have arrived via the full-history pass).
