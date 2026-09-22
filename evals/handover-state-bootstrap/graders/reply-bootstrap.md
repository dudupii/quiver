---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*CURRENT)(?=[\\s\\S]*(?:GOLF-1|bubblewrap))"
---

The closing reply reports the bootstrap: it mentions CURRENT and a rescued
fact (lookahead-AND). Backfilling the projection silently fails the
visibility contract. The fact is matched by substance (bubblewrap) or by
its note tag (GOLF-1) — agents legitimately paraphrase the tag away when
distilling the entry.
