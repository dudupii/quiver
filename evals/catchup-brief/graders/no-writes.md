---
type: regex
target: trace
match: not_contains
pattern: "\"(tool|name)\"\\s*:\\s*\"(Write|Edit|NotebookEdit)\""
---

No Write/Edit/NotebookEdit tool call occurs anywhere in the run — catchup
needs to write nothing, so this single assertion covers the modification
half of the pure-read guarantee (the `files`-target grader proves nothing
was created). Reads are expected and unaffected.
