---
type: regex
target: "{source: file, path: .claude/handovers/*.md}"
match: contains
pattern: "---\nauthor: Test User\nbranch: main\ncommit: [0-9a-f]{7,40}\nlang: zh\ncontinues: 2026-01-01_0000\\.md\n---"
---

The new note carries the full frontmatter block in the documented field order,
with real values from the seeded repo: author from `user.name`, branch `main`,
the seeded commit's short sha, the zh argument, and `continues` pointing at the
legacy note (most recent note at write time).
