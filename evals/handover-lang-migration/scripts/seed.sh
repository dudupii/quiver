#!/usr/bin/env bash
# Seed a small git project whose ONLY language memory lives in the legacy
# .claude/handovers/.lang (set to ja by a pre-0.4.0 run). An explicit zh
# argument must win over the legacy memory, and persistence goes to the NEW
# .handovers/.lang — the legacy file stays byte-identical.
set -euo pipefail

git init -q -b main
git config user.name "Test User"
git config user.email "test@example.com"

mkdir -p src .claude/handovers
printf 'ja\n' > .claude/handovers/.lang
cat > src/fetch.py <<'EOF'
def fetch(url, retries=3):
    return _get(url)
EOF
git add -A
git commit -qm "fetch helper"
