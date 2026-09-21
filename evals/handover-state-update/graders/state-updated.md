---
type: regex
target: files
match: count:1
pattern: "CURRENT\\.md"
---

The state file is modified exactly once (assumes the `files` target lists
created and modified files). A handover that writes the note but skips the
CURRENT.md contract fails here.
