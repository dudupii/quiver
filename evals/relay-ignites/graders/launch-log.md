---
type: regex
target: files
match: count:1
pattern: "launch\\.log"
---

The stub launcher ran: its log file is created in the sandbox root. No log
would mean relay never reached the launch step (or launched something real,
which the sandbox forbids).

Assumes the `files` target lists paths created during the run, including
writes from shell subprocesses (the stub's `>>`), and that the scaffold's
own files do not count. Unproven until the first gated live run (#10) —
tighten then if the semantics differ.
