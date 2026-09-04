---
type: regex
target: "{source: file, path: .claude/handovers/*.md}"
match: contains
pattern: "---\nlang: en\ncontinues: 2026-01-01_0000\\.md\n---"
---

Outside git the note degrades gracefully: only the always-available fields
remain, in the documented order (`lang`, then `continues`).
