---
type: regex
target: last_message
match: not_contains
pattern: "(?i)since the last handover"
---

With an empty commit..HEAD range there is no delta to report, so the brief
does not frame anything as "since the last handover" — no invented commits,
no empty delta section.
