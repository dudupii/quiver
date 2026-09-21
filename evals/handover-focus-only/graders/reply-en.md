---
type: regex
target: last_message
match: not_contains
pattern: "[一-鿿]"
---

The argument does not start with a language token, so the entire argument is
the focus and the language resolves by inference — this English session must
produce an English reply and note, with no CJK characters anywhere.
