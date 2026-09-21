#!/usr/bin/env bash
# Seed a git repo with two notes and a pre-existing CURRENT.md carrying three
# entries, two of which this session must NOT touch:
#   ECHO line    — mirror at mirror.example.com; the session decommissions it
#                  (must be superseded in place: new value, new date, new source)
#   FOXTROT-2    — sandbox requirement; untouched canary (line and its ORIGINAL
#                  confirmed date must survive byte-for-byte)
#   third line   — release-smoke practice; also untouched
# .lang holds en so the note language is deterministic.
set -euo pipefail

git init -q -b main
git config user.name "Test User"
git config user.email "test@example.com"
mkdir -p src .handovers
printf 'en\n' > .handovers/.lang

echo "print('hello')" > src/app.py
git add -A
git -c user.name="Commit Bot" -c user.email="commit-bot@example.com" commit -qm "init"
git commit -q --allow-empty -m "second commit for a nonzero log"

cat > .handovers/2026-04-10_0900.md <<'EOF'
---
author: Test User
branch: main
commit: 0a1b2c3
lang: en
---

# Handover 2026-04-10

## What was done

- Set up the sandbox toolchain and the package mirror.

## Decisions

- All installs go through the mirror at https://mirror.example.com — direct registry access is unreliable on this network.

## Discarded options and why

- Direct registry: repeated idle timeouts.

## Gotchas

- Sandbox needs bubblewrap present and kernel.apparmor_restrict_unprivileged_userns=0.

## Learnings

none

## Next steps

- Wire the mirror into CI.

## Suggested skills

none

## Related files

- src/app.py
EOF

cat > .handovers/2026-05-02_1300.md <<'EOF'
---
author: Test User
branch: main
commit: 1c2d3e4
lang: en
continues: 2026-04-10_0900.md
---

# Handover 2026-05-02

## What was done

- Wired the mirror into CI; runs are green.

## Decisions

- Release smoke always runs the four-platform checklist before tagging.

## Discarded options and why

none

## Gotchas

none

## Learnings

none

## Next steps

- Document the smoke checklist.

## Suggested skills

none

## Related files

- ci/smoke.yaml
EOF

cat > .handovers/CURRENT.md <<'EOF'
- Package installs must use the mirror at https://mirror.example.com (confirmed 2026-04-10 | source: 2026-04-10_0900.md)
- FOXTROT-2: sandbox needs bubblewrap and kernel.apparmor_restrict_unprivileged_userns=0 (confirmed 2026-04-10 | source: 2026-04-10_0900.md)
- Release smoke runs the four-platform checklist before tagging (confirmed 2026-05-02 | source: 2026-05-02_1300.md)
EOF
