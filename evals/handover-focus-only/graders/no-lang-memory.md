---
type: regex
target: files
match: count:0
pattern: "\\.handovers/\\.lang"
---

No language token was passed (the whole argument is the focus, and "polish"
is not one), so nothing is persisted to the language memory — `.lang` is
written only when the language came from an argument token.
