#!/usr/bin/env bash
# Seed a plain (non-git) notes folder with one prior legacy handover note.
set -euo pipefail

mkdir -p notes .claude/handovers
cat > notes/research.md <<'EOF'
# Research notes

- Candidate engines: A (fast, license ok), B (slower, GPL).
- Chose A. Benchmark numbers in the table below.
EOF

# Legacy note: written before the frontmatter convention existed.
cat > .claude/handovers/2026-01-01_0000.md <<'EOF'
# Handover 2026-01-01

## What was done

- Started the engine comparison in notes/research.md.

## Decisions

- Narrowed to engines A and B.

## Discarded options and why

- Engine C: no active maintenance.

## Gotchas

none

## Learnings

none

## Next steps

- Benchmark A vs B.

## Suggested skills

none

## Related files

- notes/research.md
EOF
