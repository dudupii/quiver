# quiver

One arrow, one skill. 🏹

A growing quiver of [Claude Code](https://claude.com/claude-code) skills. Small, sharp, and independent — grab only what you need.

## Arrows

| Skill | What it does |
|---|---|
| **brainstorm** | Turns a rough idea into an agreed design *before* any implementation. Auto-triggers at the start of creative work. |
| **handover** | Multilingual session handover notes (en / ja / zh) with language memory — decisions, discarded options, gotchas, next steps, suggested skills. |
| **catchup** | Reads the latest handover notes (plus the commits since the last one) and briefs you in four sections. Strictly read-only, safe to auto-trigger. |

More arrows coming.

## Install

```bash
claude plugin marketplace add dudupii/quiver
claude plugin install quiver@quiver
```

All arrows install together, namespaced under `/quiver:` — and bare names work too (`/brainstorm`, `/handover`).

## Update

```bash
claude plugin update quiver
```

**Restart the session to apply.** If the version looks stale, refresh the marketplace first (`claude plugin marketplace update quiver`), then update again.

## Arrow: handover

A session-end handover note that a human (or the next session) can pick up.

- **8 fixed sections**, most importantly *Discarded options and why* — it stops the next session from re-litigating settled questions
- **Reference, don't duplicate**: content already captured in specs, plans, ADRs, issues, commits, diffs or earlier handovers is linked by path, never copied
- **Suggested skills**: names which skills the next session should invoke, and for what
- **Redaction**: no API keys, tokens, passwords or personal data in the note — a mechanical credential scan runs before every write
- **Language**: `/quiver:handover` infers the language from your messages (English fallback); `/quiver:handover ja` / `/quiver:handover zh` set it explicitly — bare `/handover` works too. An explicit choice is remembered per project in `.claude/handovers/.lang` and becomes the default for the next run
- Notes land in `.claude/handovers/YYYY-MM-DD_HHmm.md` (name collisions get `_2`, `_3`, …), each starting with YAML frontmatter: `author` (git `user.name` only — never an email), `branch`, `commit`, `lang`, and `continues:` linking to the previous note. Fields are silently omitted where unavailable; notes from before this convention still work
- **Git-aware, git-read-only**: when the handover directory is tracked in git, handover closes with a one-line suggestion to commit the note so teammates see it; when it's ignored or untracked, it says nothing about git. It never runs a state-changing git command

## Arrow: catchup

The read side of handover. `/quiver:catchup` (bare `/catchup` works too) reads the latest handover notes — default 3, widen with a number (`/catchup 5`) — and replies with a four-section brief: **current state / open threads and next steps / active gotchas / suggested actions**. When the newest note records a `commit`, the brief also folds in the git log since that commit, so "what happened after the last note" is answered in the same command.

It is model-invocable — it can trigger on its own when a session starts or takes over work in a project that has handover notes — because it is strictly read-only: it writes nothing anywhere, not even the language memory. Legacy notes without frontmatter are read like any other.

## Team workflow

The handover directory is the sharing medium:

1. **Track `.claude/handovers/` in git.** Everyone's sessions write notes into the same directory. Handover notices the directory is tracked and suggests committing each note — one line; the skill itself never touches git state.
2. **Agree on one note language.** `.claude/handovers/.lang` is a single shared value per project (last write wins). Set it once with `/quiver:handover zh` (or `ja` / `en`) and everyone's notes follow.
3. **Start sessions with `/quiver:catchup`.** Latest notes plus the commits since the newest one — context rehydrated in a single command, with nothing stale trusted blindly.

## Arrow: brainstorm

A lightweight alternative to `superpowers:brainstorming`: no heavyweight process framework, no session-start hooks, no forced workflow on every task. One entry skill and one interview engine, ~2KB of instructions total.

### How it works

1. **Divergent phase** *(when warranted)* — for direction-level decisions (new subsystem, external dependency choice, data model change, sync vs async), or when you ask for options, it first presents 2–3 whole-design approaches with trade-offs and a recommendation, then **waits for you to pick**.
2. **Convergent phase** — it then runs [grilling](https://github.com/mattpocock/skills) (bundled, MIT): a design-tree interview that asks questions in dependency order, one batched round at a time, each question with a recommended answer. It never asks you anything it could look up itself.
3. **Gate** — when alignment is complete you get a design summary (alternatives considered, chosen options and why, standing assumptions). **Nothing gets implemented until you say so.**

### Usage

```
I want to add an alert rule engine to our logging system ← auto-triggers
give me 2-3 options for the cache layer ← forces the divergent phase
brainstorm this: OAuth login for the CLI ← explicit
```

If you also use the [mattpocock skills](https://github.com/mattpocock/skills), the natural follow-ups are `/to-spec` → `/to-tickets` → `/implement`; the skill will suggest them when available.

### Why not just use superpowers:brainstorming?

| | superpowers:brainstorming | quiver/brainstorm |
|---|---|---|
| Trigger | forced before EVERY creative task | automatic but selective; divergent only for direction-level work |
| Interview | one question at a time | design-tree rounds, dependency-ordered, batched, each with a recommendation |
| Alternatives | always 2-3 approaches | when the decision is direction-level or you ask |
| Weight | part of a ~741 token/session framework | ~60 tokens of listing, zero until invoked |
| Gate | skill-imposed (prompt text) | you gate; pair with native plan mode for a harness-enforced gate |

## Credits & License

- The `grilling` engine bundled under `skills/grilling/` is from [mattpocock/skills](https://github.com/mattpocock/skills) by Matt Pocock — MIT, see [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
- Everything else: MIT © 2026 dudupii — see [LICENSE](LICENSE).
