---
type: regex
target: files
match: count:1
pattern: "CURRENT\\.md"
---

The bootstrap creates the state file exactly once — a first handover in a
repo with notes but no CURRENT.md must not skip the one-time backscan.
