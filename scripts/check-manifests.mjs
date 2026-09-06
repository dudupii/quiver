#!/usr/bin/env node
// Validate every agent adapter manifest in this repo:
//   - all manifests parse as JSON
//   - version is identical across plugin, Codex, and package manifests
//   - every skill's frontmatter name matches its directory (agentskills.io rule)
//   - manifest component pointers (skills dirs) exist
// Exit 0 = all green. Dependency-free: node only.
import { readFileSync, readdirSync, existsSync, statSync } from "node:fs";
import { join, dirname, basename } from "node:path";
import { fileURLToPath } from "node:url";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
let fail = 0;
const err = (m) => { console.error(`FAIL: ${m}`); fail = 1; };
const ok = (m) => console.log(`ok: ${m}`);

const readJson = (rel) => JSON.parse(readFileSync(join(root, rel), "utf8"));

// --- all manifests parse -----------------------------------------------------
const manifests = [".claude-plugin/plugin.json", ".claude-plugin/marketplace.json", ".codex-plugin/plugin.json", "package.json"];
for (const m of manifests) {
  try { readJson(m); ok(`${m} parses`); } catch (e) { err(`${m} is not valid JSON: ${e.message}`); }
}

// --- version consistency (marketplace.json carries no version field) --------
try {
  const versions = {
    plugin: readJson(".claude-plugin/plugin.json").version,
    codex: readJson(".codex-plugin/plugin.json").version,
    pkg: readJson("package.json").version,
  };
  const vals = [...new Set(Object.values(versions))];
  if (vals.length === 1 && vals[0]) ok(`versions aligned at ${vals[0]}`);
  else err(`version drift: ${JSON.stringify(versions)}`);
} catch { /* parse failures already reported */ }

// --- skill frontmatter: name must equal directory, agentskills-legal --------
const skillsDir = join(root, "skills");
for (const dir of readdirSync(skillsDir).filter((d) => statSync(join(skillsDir, d)).isDirectory()).sort()) {
  const file = join(skillsDir, dir, "SKILL.md");
  if (!existsSync(file)) { err(`skills/${dir}: no SKILL.md`); continue; }
  const m = readFileSync(file, "utf8").match(/^---\n([\s\S]*?)\n---/);
  if (!m) { err(`skills/${dir}/SKILL.md: no frontmatter block`); continue; }
  const fm = m[1];
  const name = (fm.match(/^name:[ ]*(.+)$/m) || [])[1]?.trim();
  const desc = (fm.match(/^description:[ ]*(.+)$/m) || [])[1]?.trim();
  if (name !== dir) err(`skills/${dir}/SKILL.md: frontmatter name '${name}' != directory '${dir}'`);
  else ok(`skills/${dir}/SKILL.md name=${name}`);
  if (!desc) err(`skills/${dir}/SKILL.md: missing description`);
  if (!name || !/^[a-z][a-z0-9-]*$/.test(name) || name.length > 64)
    err(`skills/${dir}/SKILL.md: name violates agentskills.io naming rules`);
}

// --- component pointers exist ------------------------------------------------
try {
  const codex = readJson(".codex-plugin/plugin.json");
  const p = codex.skills?.replace("./", "");
  if (p && existsSync(join(root, p))) ok(`.codex-plugin skills pointer -> ${p}`);
  else err(`.codex-plugin skills pointer '${codex.skills}' missing`);
} catch { /* already reported */ }
try {
  const pkg = readJson("package.json");
  for (const p of pkg.pi?.skills ?? []) {
    const rel = p.replace("./", "");
    if (existsSync(join(root, rel))) ok(`package.json pi.skills pointer -> ${rel}`);
    else err(`package.json pi.skills '${p}' missing`);
  }
  const mpName = readJson(".claude-plugin/marketplace.json").plugins?.[0]?.name;
  const pluginName = readJson(".claude-plugin/plugin.json").name;
  if (mpName === pluginName) ok(`marketplace entry '${mpName}' matches plugin name`);
  else err(`marketplace entry '${mpName}' != plugin name '${pluginName}'`);
} catch { /* already reported */ }

process.exit(fail);
