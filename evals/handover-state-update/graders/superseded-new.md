---
type: regex
target: {source: file, path: .handovers/CURRENT.md}
match: contains
pattern: "mirror\\.example\\.net"
---

The superseded entry carries the NEW truth: the current-state file must show
mirror.example.net. Exact-path file grading works here because CURRENT.md is
a deterministic filename (unlike timestamped notes).
