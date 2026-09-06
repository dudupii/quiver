---
type: regex
target: last_message
match: not_contains
pattern: "commit (the|this) note|git add|git push"
flags: i
---

With the handover directories untracked/ignored, the reply issues no
commit/push call-to-action. Narrating git lookups or explaining why no
suggestion is made is fine — only the suggestion itself fails.
