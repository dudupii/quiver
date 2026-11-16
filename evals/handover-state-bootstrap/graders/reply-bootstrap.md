---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*CURRENT)(?=[\\s\\S]*(?:GOLF-1|bubblewrap))(?=[\\s\\S]*[Aa]rchiv)"
---

The closing reply reports the bootstrap: it mentions CURRENT, a rescued
fact, and the archive the aging split filled (lookahead-AND). Backfilling
the projection silently fails the visibility contract. The fact is matched
by substance (bubblewrap) or by its note tag (GOLF-1) — agents legitimately
paraphrase the tag away when distilling the entry.
