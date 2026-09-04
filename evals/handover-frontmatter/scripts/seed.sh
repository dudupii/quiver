#!/usr/bin/env bash
# Seed a small git project with one prior (legacy, pre-frontmatter) handover note.
set -euo pipefail

git init -q -b main
git config user.name "Test User"
# Email exists only to satisfy git's commit machinery; graders assert it never
# reaches the note.
git config user.email "test@example.com"

mkdir -p src tests .claude/handovers
cat > src/fetch.py <<'EOF'
def fetch(url, retries=3):
    for attempt in range(retries):
        try:
            return _get(url)
        except TransientError:
            if attempt == retries - 1:
                raise
EOF
cat > tests/test_fetch.py <<'EOF'
def test_retries():
    assert fetch("http://example.test", retries=2) is not None
EOF
git add -A
git commit -qm "fetch: add retry loop"

# Legacy note: written before the frontmatter convention existed.
cat > .claude/handovers/2026-01-01_0000.md <<'EOF'
# Handover 2026-01-01

## What was done

- Set up the project skeleton (src/, tests/).

## Decisions

- Plain requests, no HTTP framework.

## Discarded options and why

- httpx: extra dependency for no current need.

## Gotchas

none

## Learnings

none

## Next steps

- First feature: fetch helper with retries.

## Suggested skills

none

## Related files

- src/
EOF
