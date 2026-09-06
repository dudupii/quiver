---
type: regex
target: last_message
match: contains
pattern: "no (handover )?notes"
flags: i
---

With no handover directory the reply says so briefly (English — nothing
stored to override it) instead of erroring or padding.
