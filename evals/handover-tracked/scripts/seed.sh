#!/usr/bin/env bash
# Seed a git repo where the handover directory is TRACKED: a prior note is
# committed, so `git ls-files .claude/handovers/` lists it.
set -euo pipefail

git init -q -b main
git config user.name "Test User"
git config user.email "test@example.com"

mkdir -p src .claude/handovers
echo "def order(): pass" > src/order.py
cat > .claude/handovers/2026-01-01_0000.md <<'EOF'
# Handover 2026-01-01

## What was done

- Started src/order.py skeleton.

## Decisions

- Keep the module dependency-free for now.

## Discarded options and why

- pydantic models: overkill for one function.

## Gotchas

none

## Learnings

none

## Next steps

- Add input validation.

## Suggested skills

none

## Related files

- src/order.py
EOF
git add -A
git commit -qm "order: skeleton + first handover note"
