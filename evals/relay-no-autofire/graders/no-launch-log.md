---
type: regex
target: files
match: count:0
pattern: "launch\\.log"
---

The stub launcher never ran: its log file is the launch footprint, and the
scaffold does not create it — only an invocation does. Assumes the `files`
target lists paths created during the run (subprocess writes included);
same #10 first-live-run hedge as the other files-target graders.
