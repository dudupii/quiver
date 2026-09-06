#!/usr/bin/env bash
# Seed a plain non-git project whose ONLY handover notes live in the legacy
# .claude/handovers/ directory (a pre-0.4.0 user who hasn't written a new note
# since upgrading). catchup must still find and brief them — the legacy
# directory stays readable forever; no .handovers/ exists yet.
set -euo pipefail

mkdir -p src .claude/handovers

cat > src/fetch.py <<'EOF'
def fetch(url, retries=3):
    return _get(url)
EOF

cat > .claude/handovers/2026-04-18_1600.md <<'EOF'
---
author: Test User
branch: main
commit: 0a1b2c3
lang: en
---

## What was done

- Added fetch helper without retries.

## Decisions

- Plain requests, no HTTP framework.

## Discarded options and why

- httpx: extra dependency for no current need.

## Gotchas

- Proxy env vars must be set or requests time out.

## Learnings

none

## Next steps

- Add a retry loop to fetch (P1).

## Suggested skills

none

## Related files

- src/fetch.py
EOF
