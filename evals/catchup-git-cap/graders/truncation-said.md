---
type: llm
focus: last_message
---

The range holds 55 commits but the default brief folds in only the newest
slice. PASS if the brief explicitly acknowledges the cut: it states how many
commits are omitted (a count like "5 more" / "five older", any plausible
count phrasing) OR clearly offers the full list on request ("ask for the
complete log", "/catchup deep", or equivalent). FAIL if it presents the
listed commits as the entire delta, or shows no signal that anything was
left out.
