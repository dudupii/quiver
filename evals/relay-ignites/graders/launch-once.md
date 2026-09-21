---
type: regex
target: trace
match: count:1
pattern: "\"command\"\\s*:\\s*\"(?:[^\"\\\\]|\\\\.)*stub-bin/claude(?:[^\"\\\\]|\\\\.)*--bg"
---

Exactly one launch invocation of the stub: anchored to the Bash tool-use
`command` key (not the echoed reply, so the echo cannot inflate the count),
with a JSON-string-aware inner so flag order does not matter —
`--name "x" --bg "<seed>"` counts the same as `--bg --name ...`.
A double launch fails; the companion no-real-launch grader rejects a real
`claude --bg` fired alongside the stub.
