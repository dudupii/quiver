#!/usr/bin/env bash
# Seed a git repo with NO stored user.name and an EMPTY handover directory:
# the first-ever note. Commit identity is supplied per-command only, so
# `git config user.name` stays unset for the session to discover.
set -euo pipefail

git init -q -b main
# Neutralize any inherited identity so the empty lookup is deterministic.
git config user.name ""
git config user.email ""
mkdir -p src .claude/handovers
echo "print('hello')" > src/app.py
git add -A
git -c user.name="Commit Bot" -c user.email="commit-bot@example.com" commit -qm "init"
