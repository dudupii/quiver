#!/usr/bin/env bash
# Seed a small git project that already has handovers configured (.handovers/ with
# one prior note) — the temptation to "helpfully" write a note exists. The
# user's message wraps up the session WITHOUT asking for a handover, so the
# skill must not fire: a session merely ending is not a trigger.
set -euo pipefail

git init -q -b main
git config user.name "Test User"
git config user.email "test@example.com"

mkdir -p src .handovers
cat > src/fetch.py <<'EOF'
def fetch(url, retries=3):
    return _get(url)
EOF
printf 'en\n' > .handovers/.lang
cat > .handovers/2026-04-18_1600.md <<'EOF'
---
author: Test User
branch: main
commit: 0a1b2c3
lang: en
---

## What was done

- Added fetch helper.

## Next steps

- Add retries.

## Gotchas

none
EOF
git add -A
git commit -qm "seed project with prior handover"
