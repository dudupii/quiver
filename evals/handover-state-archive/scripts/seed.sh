#!/usr/bin/env bash
# Seed a git repo in STATE MODE with a 65-line CURRENT.md that trips every
# aging tier in one run:
#   AGED-FACT    confirmed 2026-06-18 — over the 90-day age backstop at any
#                plausible run date; must be archived with its ORIGINAL date
#   STALE-THREAD confirmed 2026-11-15 — fresh, but the session's prompt
#                reports the FLAG_X thread done; editorial archive (NOT
#                supersede: nothing about the fact's truth changed, the
#                thread closed). Date must survive the move verbatim.
#   FRESH-ONE    confirmed 2026-11-15 — fresh and still bearing; survives.
#   CAP-001..004 confirmed 2026-11-08 — fresh; only the 60-entry size cap
#                can move them (oldest-confirmed stratum). 65 seeded lines
#                minus two aged-out plus one session add = 64 > 60, so four
#                go. CAP-005..062 confirmed 2026-11-12 stay put.
# .lang holds en so the receipt language is deterministic.
set -euo pipefail

git init -q -b main
git config user.name "Test User"
git config user.email "test@example.com"
mkdir -p src .handovers
printf 'en\n' > .handovers/.lang

echo "print('hello')" > src/app.py
git add -A
git -c user.name="Commit Bot" -c user.email="commit-bot@example.com" commit -qm "init"

cat > .handovers/2026-06-18_0900.md <<'EOF'
---
author: Test User
branch: main
commit: 0a1b2c3
lang: en
---

# Handover 2026-06-18

## What was done

- Wired the legacy build pipeline into the release job.

## Decisions

none

## Discarded options and why

- Dropping the generate step: release tarballs came out stale.

## Gotchas

- The legacy pipeline needs `make generate` before every commit.

## Learnings

none

## Next steps

none

## Suggested skills

none

## Related files

- src/app.py
EOF

cat > .handovers/2026-11-08_0800.md <<'EOF'
---
author: Test User
branch: main
commit: 1b2c3d4
lang: en
continues: 2026-06-18_0900.md
---

# Handover 2026-11-08

## What was done

- Pinned the staging endpoints for suites 1-4.

## Decisions

none

## Discarded options and why

none

## Gotchas

none

## Learnings

none

## Next steps

none

## Suggested skills

none

## Related files

- src/app.py
EOF

cat > .handovers/2026-11-12_1000.md <<'EOF'
---
author: Test User
branch: main
commit: 2c3d4e5
lang: en
continues: 2026-11-08_0800.md
---

# Handover 2026-11-12

## What was done

- Pinned the remaining staging endpoints, suites 5-62.

## Decisions

none

## Discarded options and why

none

## Gotchas

none

## Learnings

none

## Next steps

- Cut FLAG_X over on the remaining workers.

## Suggested skills

none

## Related files

- src/app.py
EOF

cat > .handovers/2026-11-15_0900.md <<'EOF'
---
author: Test User
branch: main
commit: 3d4e5f6
lang: en
continues: 2026-11-12_1000.md
---

# Handover 2026-11-15

## What was done

- Rolled FLAG_X out to workers 1 and 2.

## Decisions

- The dev server exposes only port 8080 on this machine — every smoke
  script depends on it.

## Discarded options and why

none

## Gotchas

none

## Learnings

none

## Next steps

- FLAG_X rollout: workers 3 and 4 still run the old path — finish the
  cutover.

## Suggested skills

none

## Related files

- src/app.py
EOF

cat > .handovers/CURRENT.md <<'EOF'
- AGED-FACT: the legacy pipeline needs `make generate` before every commit (confirmed 2026-06-18 | source: 2026-06-18_0900.md)
- STALE-THREAD: FLAG_X rollout — workers 3 and 4 still run the old path, finish the cutover (confirmed 2026-11-15 | source: 2026-11-15_0900.md)
- FRESH-ONE: the dev server exposes only port 8080 on this machine (confirmed 2026-11-15 | source: 2026-11-15_0900.md)
EOF
for i in $(seq 1 4); do
  printf -- "- CAP-%03d: suite %s staging endpoint pinned by env CAP_HOST_%s (confirmed 2026-11-08 | source: 2026-11-08_0800.md)\n" \
    "$i" "$i" "$i"
done >> .handovers/CURRENT.md
for i in $(seq 5 62); do
  printf -- "- CAP-%03d: suite %s staging endpoint pinned by env CAP_HOST_%s (confirmed 2026-11-12 | source: 2026-11-12_1000.md)\n" \
    "$i" "$i" "$i"
done >> .handovers/CURRENT.md
