---
type: regex
target: trace
match: not_contains
pattern: "\"(tool|name)\"\\s*:\\s*\"(Write|Edit|NotebookEdit)\""
---

No Write/Edit/NotebookEdit tool call occurs anywhere in the run — relay's
zero-writes rule (the note stays byte-identical, `.lang` included). Same
idiom as catchup's pure-read guard; the launch command itself is a Bash
call and is expected.
