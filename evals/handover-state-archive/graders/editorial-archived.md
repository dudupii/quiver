---
type: regex
target: {source: file, path: .handovers/CURRENT.archive.md}
match: contains
pattern: "STALE-THREAD[^\\)]*confirmed 2026-11-15"
---

The session completed the FLAG_X thread, so its entry is ARCHIVED — not
superseded (the fact's truth never changed; the thread closed) — and the
move is relocation, not edit: text and confirmation date verbatim. A run
that refreshes the date to today, or keeps the entry in the working set as
a "done" fact, fails. This is the archive-vs-supersede precedence pin.
