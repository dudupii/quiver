---
type: regex
target: trace
match: not_contains
pattern: "stub-bin/claude[^\\n]*(?:KAPPA-5|MERIDIAN-2)"
---

The seed is a pointer, not a copy: two canaries planted in different note
sections (KAPPA-5 in Gotchas, MERIDIAN-2 in Decisions) must never ride
inside the launch command line. Inlining either section trips this; a
legitimate seed — path, thread, catchup reminder — cannot. Anchored to the
launcher path on one line so the Read of the note elsewhere in the trace
does not false-trip it.
