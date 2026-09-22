---
type: regex
target: trace
match: not_contains
pattern: "(?:\"name\"\\s*:\\s*\"(?:Write|Edit|NotebookEdit)\"\\s*,\\s*\"input\"\\s*:\\s*\\{\\s*\"(?:file_path|notebook_path)\"\\s*:\\s*\"[^\"]*\\.handovers/CURRENT\\.md(?![\\w.-])|\"command\"\\s*:\\s*\"(?:[^\"\\\\]|\\\\.)*(?:\\bsed\\s+-i(?:[^\"\\\\]|\\\\.)*|\\brm\\s+(?:[^\"\\\\]|\\\\.)*|>{1,2}\\s*[\"']?(?:[^\"\\\\\\s;&|]|\\\\.)*)\\.handovers/CURRENT\\.md(?![\\w.-]))"
---

Zero writes to the state file: nothing durable came out of the session, so
CURRENT.md must not be touched by any write tool — or by a shell write
aimed at it (sed -i / rm / redirection; tool-name guards alone cannot see
Bash, the gap no-shell-writes.md closes for the note). Reading it is fine
(the skill's contract asks the agent to check): the pattern anchors on a
Write/Edit/NotebookEdit tool_use whose `file_path` names CURRENT.md, or a
write-shaped Bash command targeting it, so a Read or a plain `cat` never
trips it, and the trailing lookahead keeps `CURRENT.md.bak`-style prefixes
from counting. (Was `target: files` + `count:0`, which was vacuous: that
target lists only files the run *creates*, so an edit to the seeded
CURRENT.md was invisible to it.)
