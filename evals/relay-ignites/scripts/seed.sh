#!/usr/bin/env bash
# Seed one handover note and a stub launcher. The stub stands in for `claude`:
# it records each invocation to launch.log instead of spawning, so relay's
# full launch path runs deterministically inside the eval sandbox.
set -euo pipefail

mkdir -p .handovers stub-bin

cat > .handovers/2026-01-02_0500.md <<'EOF'
---
author: Test User
branch: main
commit: 71b50e8
lang: en
---

## What was done

- Wired the settings toggle onto the new design tokens (TOK-4)

## Decisions

- The toggle uses the shared contrast tokens, not a local override

## Discarded options and why

- Local color override: breaks dark mode

## Gotchas

- none

## Learnings

- none

## Next steps (mark priorities)

- P1: add the toggle contrast regression test
- P2: sweep the remaining settings widgets

## Suggested skills — which skills the next session should invoke, and for what

- none

## Related files — paths of the main files touched

- src/settings/toggle.tsx
EOF

cat > stub-bin/claude <<'EOF'
#!/usr/bin/env bash
# Stub launcher: record, never spawn.
printf '%s\n' "$*" >> launch.log
echo "(stub) background agent queued"
EOF
chmod +x stub-bin/claude
