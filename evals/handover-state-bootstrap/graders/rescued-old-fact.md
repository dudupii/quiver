---
type: regex
target: {source: file, path: .handovers/CURRENT.archive.md}
match: contains
pattern: "(?:GOLF-1|bubblewrap)"
---

The install-era durable fact from the OLDEST note is rescued into the
projection. This is the core bootstrap promise: still-true facts are not
left buried by note age (the session itself produced nothing durable, so
the fact can only have arrived via the full-history pass). It lands in the
ARCHIVE, not the working set: bootstrap confirms each entry at its source
note's date, and every seed note is over the 90-day backstop at run time,
so the aging split that runs right after the backscan demotes the whole
first generation. Matched by substance (bubblewrap) or by its note tag
(GOLF-1) — distillation legitimately paraphrases the tag away.
