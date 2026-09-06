#!/usr/bin/env bash
# Seed a git repo whose NEWEST handover note is legacy format (no frontmatter,
# so no `commit` field): catchup must skip the git delta silently and brief
# from the notes alone.
set -euo pipefail

git init -q -b main
git config user.name "Test User"
git config user.email "test@example.com"

mkdir -p src .handovers
echo "def fetch(): pass" > src/fetch.py
git add src
git commit -qm "fetch: skeleton"

# Legacy note: written before the frontmatter convention existed.
cat > .handovers/2026-04-18_1600.md <<'EOF'
# Handover 2026-04-18

## What was done

- Wired the retrying `fetch()` into the queue worker.

## Decisions

- Worker pulls from the queue, never calls `fetch()` directly.

## Discarded options and why

- Cron-based polling: latency worse than queue depth trigger.

## Gotchas

- `tests/test_fetch.py::test_retries` is flaky under parallel CI load.

## Learnings

none

## Next steps

- Implement jittered backoff in `src/fetch.py`.

## Suggested skills

none

## Related files

- src/fetch.py
EOF
