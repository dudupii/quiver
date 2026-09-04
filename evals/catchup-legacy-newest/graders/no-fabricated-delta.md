---
type: regex
target: last_message
match: not_contains
pattern: "skeleton"
---

The newest note has no `commit` field, so there is no delta anchor: the
seeded history's only commit ("fetch: skeleton") must not be cited as new
work. A plain "nothing new since the last handover" sentence passes; only
invented content fails.
