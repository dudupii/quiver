#!/usr/bin/env bash
# Seed a plain non-git project with NO handover directory at all: the catchup
# arrow must notice both are missing (.handovers/ and legacy .claude/handovers/),
# say so briefly, and stop.
set -euo pipefail

mkdir -p src
cat > src/app.py <<'EOF'
print('hello')
EOF
