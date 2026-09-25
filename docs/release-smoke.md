# Release smoke checklist

Run before tagging a release. Everything here is manual-by-design: it gates
what the automated eval suite cannot see (per-agent install surfaces).

1. **Manifests green**: `npm run check` (JSON validity, version alignment,
   name=directory conformance).
2. **Eval suite**: `CLAUDE_CODE_WALNUT_SPIRE=1 claude plugin eval . --scaffold
   --ablation none --allow-tools Bash Write Edit` — all cases green or accounted
   for. `Edit` is required since the state-projection cases (CURRENT.md
   supersede-in-place); without the grant the harness strips the tool and
   `handover-state-update` scores ~0.71 with "not granted: Edit". `--scaffold`
   runs our own seed scripts as you; never pass it for third-party case files.
   Currently 27 cases, ~1 h serial. Wrap invocations in `timeout -k 15 720` —
   a wedged grade pass spins at full CPU and ignores SIGTERM. Every case dir
   needs `case.yaml` + a seed script (a dir without one hangs the loader), and
   trace-target lookahead chains must start with `^` (unanchored, they go
   quadratic over multi-MB traces). Both wedge classes were fixed 2026-09-22;
   the signatures stay here for recognition.
3. **Codex**: `codex plugin marketplace add dudupii/quiver` (or a local
   clone path) → `codex plugin add quiver@quiver` → in a scratch repo run a
   handover and a catchup; confirm `quiver:handover` and `quiver:relay` are
   absent from the implicit skill catalog (only explicit invocation reaches
   them). Then run `/relay` explicitly: it must report that Codex has no
   local background launch and echo the seed as the manual path — no
   process gets spawned.
4. **pi**: `pi install git:github.com/dudupii/quiver` → same scratch-repo
   handover/catchup; confirm brainstorm/catchup appear and handover/relay
   stay out of the implicit catalog. With tmux installed, run `/relay`:
   a detached tmux session appears (`tmux ls` shows the slug of the
   descriptive name) running `pi -p` headless. PrimeAgent uses the same
   package format
   (`prime-agent package install git:github.com/dudupii/quiver`) — smoke it
   when a binary is at hand: `/relay` should spawn via the built-in
   subagent mechanism and show up in `prime-agent agents`.
5. **Claude Code**: `claude plugin marketplace update quiver && claude
   plugin update quiver`, restart, `/handover` + `/catchup` + `/relay` once
   (relay needs the note `/handover` just wrote — check the background job
   list shows the descriptive name).
6. **README surface**: badge URLs resolve (check workflow green, latest
   release linked), the language switcher links match files on disk, both
   loop SVGs (`docs/quiver-loop*.svg`) render on the repo homepage, and the
   pi pin examples equal the version being tagged.
7. **Tag**: `git tag v<version>` and push the tag — README pi pins point at
   tags; an untagged pin is a dangling reference.
