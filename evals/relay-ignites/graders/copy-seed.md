---
type: regex
target: trace
match: not_contains
pattern: "stub-bin/claude[^\\n]*KAPPA-5"
---

The seed is a pointer, not a copy: the note body's KAPPA-5 gotcha marker
must never ride inside the launch command line. A copy-seed regression
(inlining the note) trips this; a legitimate seed — path, thread, catchup
reminder — cannot. Anchored to the launcher path on one line so the Read
of the note elsewhere in the trace does not false-trip it.
