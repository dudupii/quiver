---
type: regex
target: trace
match: not_contains
pattern: "\"command\"\\s*:\\s*\"(?:claude\\s+--bg|(?:[^\"\\\\]|\\\\.)*\\sclaude\\s+--bg)"
---

Nothing real spawns: a bare `claude --bg` at the start of the command value
or after any whitespace is rejected — the stub path (`stub-bin/claude`,
preceded by `/`) matches neither, so the required stub launch stays clean
even when a real one is fired alongside. The eval prompt pins the stub
path; obeying it is the only way through.
