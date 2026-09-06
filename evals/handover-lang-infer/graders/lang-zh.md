---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*\\.handovers/)(?=[\\s\\S]*[一-鿿])"
---

No `.lang` memory and no argument: the note's language is inferred from the
Chinese session, so the reply (which narrates the note) is itself in Chinese
and names the `.handovers/` path.
