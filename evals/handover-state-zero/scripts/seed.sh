#!/usr/bin/env bash
# Seed a git repo with one note and a pre-existing CURRENT.md holding two
# entries (HOTEL-4, INDIA-5). The session is deliberately durable-fact-free:
# a screen-share debugging session whose root cause lived in a teammate's
# local environment. Contract: the note is still written; the state file is
# not touched at all — no churn entries, no date refreshes.
set -euo pipefail

git init -q -b main
git config user.name "Test User"
git config user.email "test@example.com"
mkdir -p src .handovers
printf 'en\n' > .handovers/.lang

echo "print('hello')" > src/app.py
git add -A
git -c user.name="Commit Bot" -c user.email="commit-bot@example.com" commit -qm "init"

cat > .handovers/2026-04-10_0900.md <<'EOF'
---
author: Test User
branch: main
commit: 0a1b2c3
lang: en
---

# Handover 2026-04-10

## What was done

- Set up the toolchain.

## Decisions

none

## Discarded options and why

none

## Gotchas

- HOTEL-4: test suite must run from the repo root, not src/.

## Learnings

none

## Next steps

- Add CI.

## Suggested skills

none

## Related files

- src/app.py
EOF

cat > .handovers/CURRENT.md <<'EOF'
- HOTEL-4: test suite must run from the repo root, not src/ (confirmed 2026-04-10 | source: 2026-04-10_0900.md)
- INDIA-5: all installs go through the mirror at https://mirror.example.com (confirmed 2026-04-10 | source: 2026-04-10_0900.md)
EOF
