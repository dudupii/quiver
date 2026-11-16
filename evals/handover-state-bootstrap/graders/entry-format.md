---
type: regex
target: {source: file, path: .handovers/CURRENT.archive.md}
match: contains
pattern: "\\(confirmed 20[0-9]{2}-[0-9]{2}-[0-9]{2} \\| source: [0-9]{4}-"
---

Every entry carries the fixed shape — confirmed date and source note in the
one-line format — so the file stays greppable and machine-parseable. The
archive is the right target here: every seed note is months old, so the
aging split that follows the bootstrap places every entry in the archive;
the one-line format must survive the move (relocation is not an edit).
