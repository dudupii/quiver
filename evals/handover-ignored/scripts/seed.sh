#!/usr/bin/env bash
# Seed a git repo where the handover directory is GITIGNORED: .gitignore
# covers it, so `git check-ignore -q <note>` exits 0.
set -euo pipefail

git init -q -b main
git config user.name "Test User"
git config user.email "test@example.com"

mkdir -p src .claude/handovers
echo "def order(): pass" > src/order.py
printf '.claude/handovers/\n' > .gitignore
git add -A
git commit -qm "order: skeleton, handovers dir ignored"

# Written after the commit, so it is ignored and untracked.
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
