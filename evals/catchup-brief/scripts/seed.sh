#!/usr/bin/env bash
# Seed a plain non-git project with FOUR handover notes and language memory zh:
#   2026-01-01_0000.md  new-format, oldest — OUTSIDE the default 3-note window,
#                      carries the unique marker ZULU-9 the brief must not mention
#   2026-02-10_0900.md  LEGACY format (no frontmatter) — inside the window
#   2026-03-05_1400.md  new-format
#   2026-04-18_1600.md  new-format, newest
# .lang holds zh, so the brief's language is Chinese even though the seeded
# note bodies are English — determinism comes from memory, not inference.
set -euo pipefail

mkdir -p src .handovers
printf 'zh\n' > .handovers/.lang

cat > src/fetch.py <<'EOF'
def fetch(url, retries=3):
    for attempt in range(retries):
        try:
            return _get(url)
        except TransientError:
            if attempt == retries - 1:
                raise
EOF

cat > .handovers/2026-01-01_0000.md <<'EOF'
---
author: Test User
branch: main
commit: 0a1b2c3
lang: en
---

# Handover 2026-01-01

## What was done

- ZULU-9 spike: prototyped a Rust rewrite of the import pipeline.

## Decisions

- Keep Python; the ZULU-9 spike stays on the spike/ branch for reference.

## Discarded options and why

- Rust rewrite: build-toolchain cost outweighs the speed gain.

## Gotchas

none

## Learnings

- The import pipeline is I/O-bound, not CPU-bound.

## Next steps

- Add retries to the network calls.

## Suggested skills

none

## Related files

- spike/
EOF

# Legacy note: written before the frontmatter convention existed.
cat > .handovers/2026-02-10_0900.md <<'EOF'
# Handover 2026-02-10

## What was done

- Added a retry loop (3 retries, exponential backoff) to `fetch()` in `src/fetch.py`.
- Added `tests/test_fetch.py::test_retries`.

## Decisions

- Plain requests, no HTTP framework.

## Discarded options and why

- httpx: extra dependency for no current need.

## Gotchas

- Proxy env vars must be set (`export https_proxy=...`) or every test times out.

## Learnings

none

## Next steps

- Wire the retrying `fetch()` into the export command.

## Suggested skills

none

## Related files

- src/fetch.py
EOF

cat > .handovers/2026-03-05_1400.md <<'EOF'
---
author: Test User
branch: main
commit: 1c2d3e4
lang: en
continues: 2026-02-10_0900.md
---

# Handover 2026-03-05

## What was done

- Wired the retrying `fetch()` into the queue worker (`src/worker.py`).

## Decisions

- Worker pulls from the queue, never calls `fetch()` directly.

## Discarded options and why

- Cron-based polling: latency worse than queue depth trigger.

## Gotchas

- `tests/test_fetch.py::test_retries` is flaky on CI — rerun usually passes; only fails under parallel load.

## Learnings

none

## Next steps

- Fix the flake at the source (shared fixture), not with retries.

## Suggested skills

none

## Related files

- src/worker.py
EOF

cat > .handovers/2026-04-18_1600.md <<'EOF'
---
author: Test User
branch: main
commit: 2e3f4a5
lang: en
continues: 2026-03-05_1400.md
---

# Handover 2026-04-18

## What was done

- Measured backoff timing against the rate limit: 3 retries at strict 2x backoff is too aggressive.

## Decisions

- Keep 3 retries, switch to jittered backoff.

## Discarded options and why

- Dropping to 2 retries: raises caller-visible error rate.

## Gotchas

none

## Learnings

- The rate limiter forgives jitter, punishes lockstep.

## Next steps

- Implement jittered backoff in `src/fetch.py`.
- Document the proxy setup in the README.

## Suggested skills

none

## Related files

- src/fetch.py
EOF
