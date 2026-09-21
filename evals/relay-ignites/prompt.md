---
name: relay-ignites
tags: [relay]
plugins: ["../.."]
max_turns: 15
allowed_tools: [Read, Glob, Grep, Write, Bash]
---

/relay

Sandbox test setup: the stub launcher at `./stub-bin/claude` stands in for the real `claude` — invoke it by that exact path instead of `claude`, so nothing actually spawns.
