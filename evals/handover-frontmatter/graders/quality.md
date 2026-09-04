---
type: llm
focus: "{source: file, path: .claude/handovers/*.md}"
criteria: >
  The note is written entirely in Chinese, headers included. It covers the
  session's actual work: the retry loop added to fetch() in src/fetch.py and
  its test in tests/test_fetch.py; the discarded async rewrite with the reason
  (callers are synchronous); the proxy-env gotcha. Sections follow the skill's
  eight-section order, and empty sections carry the Chinese "none" placeholder
  rather than being dropped. No API keys, tokens, or personal data appear. No
  invented facts beyond the session description.
---

Judge the note as a handover: would the next session pick up the thread from
this note alone?
