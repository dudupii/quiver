---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*CURRENT)(?=[\\s\\S]*[Aa]rchiv)"
---

The closing receipt reports the aging: it mentions CURRENT and the archive
(lookahead-AND). Demoting both standing facts silently would fail the
visibility contract.
