#!/usr/bin/env bash
# Seed a plain non-git project with NO CURRENT.md and FOUR notes on FOUR
# distinct dates — the fallback case: the state file is absent, so the
# reading must stay today's default 3-note window.
#   2026-01-11_1000.md  JULIET-8 — oldest, OUTSIDE the 3-note window
#   2026-02-22_1100.md  OSCAR-0 — inside the window on a DIFFERENT date
#                       from the newest note: if same-date-group semantics
#                       leaked into fallback mode, OSCAR-0 would vanish
#   2026-03-30_1200.md  PAPA-1
#   2026-04-25_1300.md  QUEBEC-2 — newest
# .lang holds en for determinism.
set -euo pipefail

mkdir -p src .handovers
printf 'en\n' > .handovers/.lang

echo "print('hello')" > src/app.py

note() {
  cat > ".handovers/$1" <<EOF
---
author: $2
branch: main
commit: $3
lang: en
$4
---

# Handover $5

## What was done

- $6

## Decisions

none

## Discarded options and why

none

## Gotchas

- $7

## Learnings

none

## Next steps

- $8

## Suggested skills

none

## Related files

- src/app.py
EOF
}

note 2026-01-11_1000.md "Cassie" 0a1b2c3 "" 2026-01-11 \
  "JULIET-8 spike: prototyped a queue on Redis." \
  "JULIET-8: Redis needs a password even locally." \
  "Decide on the queue."

note 2026-02-22_1100.md "Alfa" 1c2d3e4 "continues: 2026-01-11_1000.md" 2026-02-22 \
  "OSCAR-0: moved the queue to the database." \
  "none" \
  "Backfill the queue table."

note 2026-03-30_1200.md "Alfa" 2e3f4a5 "continues: 2026-02-22_1100.md" 2026-03-30 \
  "PAPA-1: added the backfill migration." \
  "none" \
  "Index the queue table."

note 2026-04-25_1300.md "Bravo" 3f4a5b6 "continues: 2026-03-30_1200.md" 2026-04-25 \
  "QUEBEC-2: added the index; queries are fast again." \
  "none" \
  "Clean up the old Redis code."
