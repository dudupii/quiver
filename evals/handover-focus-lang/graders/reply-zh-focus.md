---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*\\.handovers/)(?=[\\s\\S]*[一-鿿])(?=[\\s\\S]*OMNI-7)"
---

The `zh` token sets the note's language — the reply narrates in Chinese and
names the `.handovers/` path — and the focus thread (OMNI-7, the payment
callback) is carried into the note.
