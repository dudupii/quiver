---
name: relay
description: Ignite a fresh background agent seeded by the latest handover note — it restores context from the note and continues the work unattended. User-requested only - invoke when the user explicitly says "relay", "点火", or clearly asks for the latest note to be handed to a new background agent. Never invoke on your own initiative.
argument-hint: "[focus]"
disable-model-invocation: true
---

# Background Relay

Hand the latest handover note to a brand-new background agent on this machine. The new agent starts in the current working directory, restores its context from the note, and works unattended; the user manages it with the platform's agents surface. handover writes the note, catchup reads it into the session you are in — relay reads it into a session nobody has to sit in.

Reply in the language of the conversation; write the seed in the same language. The `.handovers/.lang` memory governs the note, not this reply — the ignited agent resolves its own working language when it reads the note via catchup.

## Note resolution (catchup's rule)

1. List `*.md` notes in `.handovers/` and in legacy `.claude/handovers/` (pre-0.4.0), merge, sort by filename; on a filename tie the `.handovers/` copy wins; `.lang` files are not notes.
2. Take the newest. Legacy notes without frontmatter are valid seeds.
3. No note in either directory → refuse: say so and point at `/quiver:handover` as the way to create one. Never invent a seed.

## Seed: a pointer, not a copy

The seed prompt names the note's path and tells the new agent what to pursue — it never inlines the note's content. The note is the single source of truth: structured, redacted by handover's rules, and readable by the new agent because it starts in this working directory.

Keep the seed to three essentials:

1. the note file to read (path),
2. the thread to pursue — the focus argument, or when absent the note's top-priority next step,
3. a reminder that the catchup skill loads the full brief from the notes.

## Focus

Optional free text naming the thread the new agent pursues. Default: the note's top-priority next step. The focus shapes the seed only — the note itself is never edited, filtered, or rewritten.

## Launch

- **Claude Code**: run `claude --bg --name "<descriptive name>" "<seed>"`. The name derives from the focus or the top next step (e.g. `quiver #12 relay arrow`); it is what the user sees in the job list, session picker, and terminal title. The command returns immediately.
- **Codex / pi / PrimeAgent**: use the platform's background-agent mechanism per its adapter. Where the platform has none, say it is unsupported here and suggest launching manually with the echoed seed — never fake a launch.

Echo the exact launch command in the reply, on its own line, when you run it.

## Rules

- **User-requested only**: never fire on your own initiative — the guard is mirrored in every platform's adapter policy.
- **Zero writes**: notes stay byte-identical after a run (`.lang` included), and no state-changing git command ever runs. The launch is the only side effect.
- **Nothing beyond the note**: the seed adds no conversation summaries and no secrets — redaction is inherited from the note.
- Facts only; when something fails (no note, no launcher), report it honestly and give the manual path.
