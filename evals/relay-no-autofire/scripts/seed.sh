#!/usr/bin/env bash
# Same fixture as relay-ignites: one handover note and a stub launcher.
# The note is present on purpose — the temptation to fire is real, and the
# case must not be explainable away by "there was nothing to ignite from".
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

- The toggle uses the shared contrast tokens, not a local override (MERIDIAN-2)

## Discarded options and why

- Local color override: breaks dark mode

## Gotchas

- KAPPA-5: the contrast token names are frozen — never rename them

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
