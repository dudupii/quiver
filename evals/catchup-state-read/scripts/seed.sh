#!/usr/bin/env bash
# Seed a plain non-git project in STATE MODE: CURRENT.md exists.
#   CURRENT.md   NOVEMBER-9 confirmed 2026-03-01 (a bare date no note
#                filename contains — pins that the DATE itself surfaces)
#                + the mirror fact from the March note
#   2026-02-10_0900.md  oldest — NOVEMBER-9's source; outside any default
#                       reading window, so the fact reaches the brief only
#                       through the state file
#   2026-03-05_1400.md  carries MIKE-8, a durable-sounding gotcha that is
#                       deliberately NOT in CURRENT.md (the crashed-agent
#                       edge) and NOT same-date — must stay out of the brief
#   2026-04-18_1600.md  same-date sibling (author Alfa) — KILO-6
#   2026-04-18_1930.md  newest, same date (author Bravo) — LIMA-7
# .lang holds zh so the brief language is deterministic.
set -euo pipefail

mkdir -p src .handovers
printf 'zh\n' > .handovers/.lang

echo "print('hello')" > src/app.py

cat > .handovers/2026-02-10_0900.md <<'EOF'
---
author: Cassie
branch: main
commit: 0a1b2c3
lang: en
---

# Handover 2026-02-10

## What was done

- Environment bring-up.

## Decisions

none

## Discarded options and why

none

## Gotchas

- NOVEMBER-9: sandbox needs bubblewrap present and kernel.apparmor_restrict_unprivileged_userns=0.

## Learnings

none

## Next steps

- Mirror the package installs.

## Suggested skills

none

## Related files

- src/app.py
EOF

cat > .handovers/2026-03-05_1400.md <<'EOF'
---
author: Alfa
branch: main
commit: 1c2d3e4
lang: en
continues: 2026-02-10_0900.md
---

# Handover 2026-03-05

## What was done

- Switched installs to the mirror at https://mirror.example.com.

## Decisions

none

## Discarded options and why

none

## Gotchas

- MIKE-8: the docs generator segfaults when locales are missing — export LC_ALL=C before running it.

## Learnings

none

## Next steps

none

## Suggested skills

none

## Related files

- ci/install.sh
EOF

cat > .handovers/2026-04-18_1600.md <<'EOF'
---
author: Alfa
branch: main
commit: 2e3f4a5
lang: en
continues: 2026-03-05_1400.md
---

# Handover 2026-04-18

## What was done

- Profiled the queue worker; found the hot loop.

## Decisions

none

## Discarded options and why

none

## Gotchas

none

## Learnings

none

## Next steps

- KILO-6: rewrite the hot loop to batch every 50 items, not per-item.

## Suggested skills

none

## Related files

- src/worker.py
EOF

cat > .handovers/2026-04-18_1930.md <<'EOF'
---
author: Bravo
branch: main
commit: 3f4a5b6
lang: en
continues: 2026-04-18_1600.md
---

# Handover 2026-04-18 (evening)

## What was done

- Fixed the release-notes publisher for tagged builds.

## Decisions

none

## Discarded options and why

none

## Gotchas

- LIMA-7: the publisher must run from a clean checkout — a dirty tree publishes stale assets.

## Learnings

none

## Next steps

none

## Suggested skills

none

## Related files

- scripts/publish.py
EOF

cat > .handovers/CURRENT.md <<'EOF'
- NOVEMBER-9: sandbox needs bubblewrap and kernel.apparmor_restrict_unprivileged_userns=0 (confirmed 2026-03-01 | source: 2026-02-10_0900.md)
- Package installs must use the mirror at https://mirror.example.com (confirmed 2026-03-05 | source: 2026-03-05_1400.md)
EOF
