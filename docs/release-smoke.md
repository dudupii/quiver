# Release smoke checklist

Run before tagging a release. Everything here is manual-by-design: it gates
what the automated eval suite cannot see (per-agent install surfaces).

1. **Manifests green**: `npm run check` (JSON validity, version alignment,
   name=directory conformance).
2. **Eval suite**: `CLAUDE_CODE_WALNUT_SPIRE=1 claude plugin eval . --scaffold
   --ablation none --allow-tools Bash Write` — all cases green or accounted
   for. `--scaffold` runs our own seed scripts as you; never pass it for
   third-party case files.
3. **Codex**: `codex plugin marketplace add dudupii/quiver` (or a local
   clone path) → `codex plugin add quiver@quiver` → in a scratch repo run a
   handover and a catchup; confirm `quiver:handover` is absent from the
   implicit skill catalog (only explicit invocation reaches it).
4. **pi**: `pi install git:github.com/dudupii/quiver` → same scratch-repo
   handover/catchup; confirm brainstorm/catchup appear and handover stays
   out of the implicit catalog. PrimeAgent uses the same package format
   (`prime-agent package install git:github.com/dudupii/quiver`) — smoke it
   when a binary is at hand.
5. **Claude Code**: `claude plugin marketplace update quiver && claude
   plugin update quiver`, restart, `/handover` + `/catchup` once.
6. **Tag**: `git tag v<version>` and push the tag — README pi pins point at
   tags; an untagged pin is a dangling reference.
