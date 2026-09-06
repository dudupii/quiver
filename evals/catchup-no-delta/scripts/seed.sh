#!/usr/bin/env bash
# Seed a git repo whose newest handover note records the CURRENT HEAD: the
# commit..HEAD range is empty, so the brief must render normally with no git
# delta mentioned at all.
set -euo pipefail

git init -q -b main
git config user.name "Test User"
git config user.email "test@example.com"

mkdir -p src .handovers
echo "def fetch(): pass" > src/fetch.py
git add -A
git commit -qm "fetch: skeleton"
SHA=$(git rev-parse --short HEAD)

# The note is written at HEAD and nothing lands after it: empty delta range.
cat > .handovers/2026-04-18_1600.md <<EOF
---
author: Test User
branch: main
commit: $SHA
lang: en
---

# Handover 2026-04-18

## What was done

- Wired the retrying \`fetch()\` into the queue worker.

## Decisions

- Worker pulls from the queue, never calls \`fetch()\` directly.

## Discarded options and why

- Cron-based polling: latency worse than queue depth trigger.

## Gotchas

- \`tests/test_fetch.py::test_retries\` is flaky under parallel CI load.

## Learnings

none

## Next steps

- Implement jittered backoff in \`src/fetch.py\`.

## Suggested skills

none

## Related files

- src/fetch.py
EOF
