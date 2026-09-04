#!/usr/bin/env bash
# Seed a plain non-git project with NO .claude directory at all: the catchup
# arrow must notice the missing handovers directory, say so briefly, and stop.
set -euo pipefail

mkdir -p src
cat > src/app.py <<'EOF'
print('hello')
EOF
