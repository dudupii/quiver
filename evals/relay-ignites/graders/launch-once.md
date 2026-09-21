---
type: regex
target: trace
match: count:1
pattern: "\"command\"\\s*:\\s*\"[^\"]*stub-bin/claude[^\"]*--bg"
---

Exactly one launch invocation: anchored to the Bash tool-use `command` key
(not the echoed reply), so a double launch or a stray second invocation
fails while the echo in the final message does not inflate the count.
