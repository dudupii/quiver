#!/usr/bin/env bash
# Seed a git repo with FOUR notes across four months and NO CURRENT.md:
# the first-handover-after-upgrade bootstrap case. The OLDEST note
# (2026-01-05) carries the install-era durable gotcha GOLF-1 — exactly the
# "still-true fact buried by age" the projection must rescue. A mid note
# carries a second durable fact (the mirror). The session itself produces
# nothing durable, so every state entry must come from the backscan.
# .lang holds en for determinism.
set -euo pipefail

git init -q -b main
git config user.name "Test User"
git config user.email "test@example.com"
mkdir -p src .handovers
printf 'en\n' > .handovers/.lang

echo "print('hello')" > src/app.py
git add -A
git -c user.name="Commit Bot" -c user.email="commit-bot@example.com" commit -qm "init"

cat > .handovers/2026-01-05_0900.md <<'EOF'
---
author: Test User
branch: main
commit: 0a1b2c3
lang: en
---

# Handover 2026-01-05

## What was done

- Project bootstrap: toolchain, sandbox, CI skeleton.

## Decisions

- Plain Make, no task runner.

## Discarded options and why

- npm scripts: wrong shape for a Python project.

## Gotchas

- GOLF-1: sandbox needs bubblewrap present and kernel.apparmor_restrict_unprivileged_userns=0, or every sandboxed run dies at startup.

## Learnings

- The sandbox failure mode looks like a hang, not an error.

## Next steps

- Add the mirror to CI.

## Suggested skills

none

## Related files

- Makefile
EOF

cat > .handovers/2026-02-14_1000.md <<'EOF'
---
author: Test User
branch: main
commit: 1c2d3e4
lang: en
continues: 2026-01-05_0900.md
---

# Handover 2026-02-14

## What was done

- Switched installs to the mirror at https://mirror.example.com after repeated direct-registry timeouts.

## Decisions

- All installs go through the mirror.

## Discarded options and why

- Direct registry: idle timeouts on this network.

## Gotchas

none

## Learnings

none

## Next steps

- Cache fetched wheels in CI.

## Suggested skills

none

## Related files

- ci/install.sh
EOF

cat > .handovers/2026-03-20_1100.md <<'EOF'
---
author: Test User
branch: main
commit: 2e3f4a5
lang: en
continues: 2026-02-14_1000.md
---

# Handover 2026-03-20

## What was done

- Added wheel caching; CI time halved.

## Decisions

none

## Discarded options and why

none

## Gotchas

none

## Learnings

- Cache hits make flaky network tests deterministic.

## Next steps

- Trim the test matrix.

## Suggested skills

none

## Related files

- ci/install.sh
EOF

cat > .handovers/2026-04-30_1600.md <<'EOF'
---
author: Test User
branch: main
commit: 3f4a5b6
lang: en
continues: 2026-03-20_1100.md
---

# Handover 2026-04-30

## What was done

- Trimmed the test matrix to two lanes.

## Decisions

- Nightly lane carries the slow tests.

## Discarded options and why

- Sharding: complexity for little gain at this size.

## Gotchas

none

## Learnings

none

## Next steps

- Document the lane policy in the README.

## Suggested skills

none

## Related files

- ci/matrix.yaml
EOF
