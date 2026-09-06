---
name: brainstorm
description: Turn a rough idea into an agreed design BEFORE any implementation. Use at the start of any creative work - new feature, new component, new module - or when the user says "brainstorm", "先对齐", "出个方案", "帮我想想这个功能".
---

**Divergent phase (first, when warranted):** if the user asks for options ("方案对比", "给我几个方案", "alternatives") OR the idea is direction-level significant (new subsystem, external dependency choice, data model change, sync vs async architecture), FIRST present 2-3 whole-design approaches with trade-offs and your recommendation. Wait for the user to pick a direction before going further.

Then invoke the bundled `grilling` skill (via this host's skill mechanism — slash command, skill tool, or equivalent) to converge the details within the chosen direction.

When the design tree's frontier is empty and shared understanding is reached, present the design summary:
- For each major decision: the 2-3 alternatives that genuinely differed, the chosen one, one line of why
- Explicitly list any assumptions still standing

Do NOT implement anything. The user gates the next step. Suggest whatever design-capture path the host offers — a spec/ticket skill if one is installed (e.g. the mattpocock skills' `/to-spec`), or an equivalent planning flow — or simply hand the agreed design to implementation.

---

The `grilling` skill bundled in this plugin comes from [mattpocock/skills](https://github.com/mattpocock/skills) (MIT, © Matt Pocock). See THIRD_PARTY_NOTICES.md.
