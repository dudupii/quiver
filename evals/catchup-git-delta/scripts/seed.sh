#!/usr/bin/env bash
# Seed a git repo whose newest handover note records its HEAD commit, then
# land TWO commits after it with distinctive DELTA-MARKER subjects the brief
# must surface as "what happened since the last handover".
set -euo pipefail

git init -q -b main
git config user.name "Test User"
git config user.email "test@example.com"

mkdir -p src .claude/handovers
echo "def fetch(): pass" > src/fetch.py
git add -A
git commit -qm "fetch: skeleton"
SHA=$(git rev-parse --short HEAD)

cat > .claude/handovers/2026-04-18_1600.md <<EOF
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

# Commits AFTER the newest note: the delta the brief must include.
printf 'cache: on\n' > src/cache.conf
git add -A
git commit -qm "DELTA-MARKER-ONE add cache toggle to config"
printf 'v2\n' > src/worker.py
git add -A
git commit -qm "DELTA-MARKER-TWO rewrite worker loop"
