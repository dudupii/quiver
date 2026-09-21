---
type: regex
target: last_message
match: contains
pattern: "(?=[\\s\\S]*/(?:quiver:)?handover)(?=[\\s\\S]*note)"
flags: i
---

With no note to ignite from, the reply refuses and points at the handover
skill as the way to create one: a slash invocation of it (`/handover` or
`/quiver:handover`) must appear alongside the word "note". Bare prose
containing both words — or a fabricated success — does not pass.
