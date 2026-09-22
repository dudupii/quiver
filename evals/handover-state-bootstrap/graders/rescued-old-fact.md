---
type: regex
target: {source: file, path: .handovers/CURRENT.md}
match: contains
pattern: "(?:GOLF-1|bubblewrap)"
---

The install-era durable fact from the OLDEST note is rescued into the state
file. This is the core bootstrap promise: still-true facts are not left
buried by note age (the session itself produced nothing durable, so the
fact can only have arrived via the full-history pass). Matched by substance
(bubblewrap) or by its note tag (GOLF-1) — distillation legitimately
paraphrases the tag away.
