---
type: regex
target: files
match: count:1
pattern: "launch\\.log"
---

The stub launcher ran: its log file is created in the sandbox root. No log
would mean relay never reached the launch step (or launched something real,
which the sandbox forbids).
