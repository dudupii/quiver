---
type: regex
target: trace
match: not_contains
pattern: "\"(tool|name)\"\\s*:\\s*\"(Write|Edit|NotebookEdit)\""
---

No Write/Edit/NotebookEdit tool call occurs anywhere in the run — a widened
reading window still writes nothing.
