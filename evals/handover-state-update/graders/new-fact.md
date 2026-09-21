---
type: regex
target: {source: file, path: .handovers/CURRENT.md}
match: contains
pattern: "8080"
---

The session's new durable fact (dev server exposes only port 8080) is added
to the state file — knowledge that must outlive the note that first
captured it.
