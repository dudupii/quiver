#!/usr/bin/env bash
# Seed a git repo whose newest handover note records its HEAD commit, then
# land FIFTY-FIVE commits after it (CAPDELTA-01 .. CAPDELTA-55, zero-padded
# so CAPDELTA-05 is not a substring of CAPDELTA-50). The default brief must
# keep the delta bounded: newest commits folded in, oldest cut, the cut
# acknowledged with a count or an offer — not a 55-commit dump.
set -euo pipefail

git init -q -b main
git config user.name "Test User"
git config user.email "test@example.com"

mkdir -p src .handovers
echo "def fetch(): pass" > src/fetch.py
git add -A
git commit -qm "fetch: skeleton"
SHA=$(git rev-parse --short HEAD)

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

# 55 empty commits AFTER the newest note: cheap to seed, and the zero-padded
# CAPDELTA-NN subjects make "oldest cut" gradable by substring (CAPDELTA-05
# matches nothing else). The note itself stays untracked, as handover leaves
# it.
for i in $(seq -w 1 55); do
  git commit -q --allow-empty -m "CAPDELTA-$i churn refactor pass $((10#$i))"
done
