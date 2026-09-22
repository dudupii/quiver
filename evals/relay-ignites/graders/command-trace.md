---
type: regex
target: trace
match: contains
pattern: "^(?=[\\s\\S]*\"command\"\\s*:\\s*\"(?:[^\"\\\\]|\\\\.)*stub-bin/claude(?:[^\"\\\\]|\\\\.)*--bg)(?=[\\s\\S]*\"command\"\\s*:\\s*\"(?:[^\"\\\\]|\\\\.)*stub-bin/claude(?:[^\"\\\\]|\\\\.)*--name(?:[^\"\\\\]|\\\\.)*(?:toggle|contrast|regression))(?=[\\s\\S]*\"command\"\\s*:\\s*\"(?:[^\"\\\\]|\\\\.)*stub-bin/claude(?:[^\"\\\\]|\\\\.)*\\.handovers/2026-01-02_0500\\.md)(?=[\\s\\S]*\"command\"\\s*:\\s*\"(?:[^\"\\\\]|\\\\.)*catchup)"
---

Every seed element rides inside the actual Bash `command` value, not in
prose: the stub launcher with the background flag, a name derived from the
toggle thread (any of its words), the newest note's path, and the catchup
reminder. Each lookahead is anchored to the `command` JSON key with a
JSON-string-aware inner (`(?:[^"\\]|\\.)*` skips escaped quotes), so a
complete command echoed only in the reply — or a Read of the note —
cannot satisfy what the invocation must carry (lookahead-AND, not
any-one-of).
