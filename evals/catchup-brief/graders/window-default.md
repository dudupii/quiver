---
type: regex
target: last_message
match: not_contains
pattern: "ZULU-9"
---

The default window is the latest 3 notes, so the oldest seeded note
(`2026-01-01_0000.md`, the ZULU-9 Rust spike) is out of scope and its
unique marker must not reach the brief.
