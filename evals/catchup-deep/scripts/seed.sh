#!/usr/bin/env bash
# Seed a git repo in STATE MODE where the working set and the archive split
# the state:
#   CURRENT.md          two working facts — read in every mode
#   CURRENT.archive.md  three demoted facts whose concrete content
#                       ("make generate", "port 5433", "LC_ALL=C") exists
#                       NOWHERE else in the repo — the source note records
#                       the decisions in different words, so the facts reach
#                       the brief only if deep mode actually reads the archive
#   newest note         2026-11-15_1000.md records its HEAD commit, and three
#                       DELTA-MARKER commits land after it (well under any
#                       cap, so the deep/full-log distinction rides on the
#                       archive facts alone)
# .lang holds en so the brief language is deterministic.
set -euo pipefail

git init -q -b main
git config user.name "Test User"
git config user.email "test@example.com"

mkdir -p src .handovers
printf 'en\n' > .handovers/.lang

echo "def fetch(): pass" > src/fetch.py
git add -A
git commit -qm "fetch: skeleton"
SHA=$(git rev-parse --short HEAD)

cat > .handovers/2026-06-20_0900.md <<'EOF'
---
author: Test User
branch: main
commit: 0a1b2c3
lang: en
---

# Handover 2026-06-20

## What was done

- Retired the legacy build pipeline and rebuilt staging.

## Decisions

- Removed the codegen step from the commit path entirely.
- Moved staging's Postgres off the default port.
- Pinned the docs container locale to keep the generator stable.

## Discarded options and why

- Keeping the codegen step: release tarballs came out stale.

## Gotchas

none

## Learnings

none

## Next steps

- Wire the queue worker.

## Suggested skills

none

## Related files

- src/fetch.py
EOF

cat > .handovers/2026-11-15_1000.md <<EOF
---
author: Test User
branch: main
commit: $SHA
lang: en
continues: 2026-06-20_0900.md
---

# Handover 2026-11-15

## What was done

- Wired the retrying \`fetch()\` into the queue worker.

## Decisions

- Worker pulls from the queue, never calls \`fetch()\` directly.

## Discarded options and why

- Cron-based polling: latency worse than queue depth trigger.

## Gotchas

- \`tests/test_fetch.py::test_retries\` is flaky under parallel CI load.

## Learnings

none

## Next steps

- Implement jittered backoff in \`src/fetch.py\`.

## Suggested skills

none

## Related files

- src/fetch.py
EOF

cat > .handovers/CURRENT.md <<'EOF'
- the queue worker pulls from the queue, never calls fetch() directly (confirmed 2026-11-15 | source: 2026-11-15_1000.md)
- tests/test_fetch.py::test_retries is flaky under parallel CI load (confirmed 2026-11-15 | source: 2026-11-15_1000.md)
EOF

cat > .handovers/CURRENT.archive.md <<'EOF'
- the legacy pipeline needed make generate before every commit (confirmed 2026-06-20 | source: 2026-06-20_0900.md)
- staging ran its database on port 5433, not the default 5432 (confirmed 2026-06-20 | source: 2026-06-20_0900.md)
- docs builds required LC_ALL=C or the generator segfaulted (confirmed 2026-06-20 | source: 2026-06-20_0900.md)
EOF

# Commits AFTER the newest note: three, well under any cap — deep must fold
# all of them without pointing at "more on request".
printf 'cache: on\n' > src/cache.conf
git add src
git commit -qm "DELTA-MARKER-ONE add cache toggle to config"
printf 'v2\n' > src/worker.py
git add src
git commit -qm "DELTA-MARKER-TWO rewrite worker loop"
printf 'depth: 50\n' >> src/cache.conf
git add src
git commit -qm "DELTA-MARKER-THREE bump queue depth limit"
