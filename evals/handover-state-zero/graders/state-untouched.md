---
type: regex
target: files
match: count:0
pattern: "CURRENT\\.md"
---

Zero writes to the state file: nothing durable came out of the session, so
the contract demands no churn — no invented entries, no refreshed dates
(assumes the `files` target lists created and modified files).
