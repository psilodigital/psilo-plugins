# Plugin Contract

Every plugin under `psilo-plugins/` MUST follow this contract. The contract is what lets future installers, validators, and runtimes treat any Psilodigital plugin the same way — and what keeps the three current plugins consistent today.

If a PR adds a plugin or skill that does not satisfy this contract, it is not ready to merge.

---

## 1. Directory shape

```
<plugin>/
├── .claude-plugin/plugin.json    REQUIRED — Claude Code manifest
├── .codex-plugin/plugin.json     REQUIRED — Codex CLI manifest
├── CLAUDE.md                     REQUIRED — Claude Code entry doc
├── AGENTS.md                     REQUIRED — Codex CLI entry doc (mirrors CLAUDE.md)
├── GEMINI.md                     REQUIRED — Gemini CLI entry doc (mirrors CLAUDE.md)
├── agents/
│   └── <role>.md                 ≥1 file — agent personas
├── skills/
│   └── <prefix>-<name>/
│       └── SKILL.md              ≥1 directory — see §4
└── vault/
    ├── config.md                 REQUIRED — user-vault template
    └── vault-structure.json      REQUIRED — declares user-vault shape
```

Optional, only when actually needed:

- `<plugin>/skills/<skill>/templates/` — output templates referenced by the skill
- `<plugin>/skills/<skill>/references/` — external docs the skill loads
- `<plugin>/skills/<skill>/examples/` — example inputs/outputs

Do not pre-create empty directories. Add them when the first file lands.

---

## 2. Skill naming and taxonomy

Every skill directory is named `<prefix>-<kebab-case-name>`. The prefix is load-bearing.

| Prefix | Layer | Who calls it | Example |
|---|---|---|---|
| `op-` | User-facing entry point | The user (or another op) | `op-prep-discovery-call` |
| `flow-` | Multi-step internal | An `op-` or another `flow-` | `flow-research-prospect` |
| `task-` | Atomic primitive | A `flow-` (or any layer) | `task-flag-assumption` |
| `app-` | External data connector | A `flow-` or `task-` | `app-gcalendar` |

Only `op-*` skills should set `user-invocable: true`. Flows, tasks, and app connectors are internal.

---

## 3. `plugin.json` schema (both Claude and Codex manifests)

Required fields:

```json
{
  "name": "sales",
  "version": "0.1.0",
  "description": "One-line plugin description",
  "author": { "name": "Psilodigital", "email": "info@psilodigital.com" },
  "license": "MIT",
  "homepage": "https://psilodigital.com",
  "agents": ["sales-strategist"],
  "skills": "./skills/",
  "vault": {
    "template": "vault/config.md",
    "structure": "vault/vault-structure.json"
  },
  "entry_docs": ["CLAUDE.md", "AGENTS.md", "GEMINI.md"]
}
```

`agents[]` lists every agent file under `agents/` by name (no extension). `skills` points to the skills directory — the installer globs it. `vault.{template,structure}` are paths relative to the plugin root.

The Codex manifest (`.codex-plugin/plugin.json`) may additionally include an `interface` block (`displayName`, `category`, `capabilities`, `composerIcon`, `brandColor`, `keywords`) — Codex displays these in its UI. Add only if needed.

---

## 4. `SKILL.md` frontmatter schema

Every `SKILL.md` MUST begin with YAML frontmatter:

```yaml
---
name: flow-research-prospect
type: flow                              # op | flow | task | app
version: 0.1.0
description: |
  Public-signal research on a prospect company. Triggers: "research [company]",
  "look up [prospect]". Returns structured findings — never fabricates.
user-invocable: false                   # true only for op-* skills
called_by: [op-prep-discovery-call, op-draft-outreach]
calls: [task-flag-assumption]
inputs:
  - client_name                         # required
  - website_url?                        # optional (suffix with ?)
  - country_or_region?
outputs:
  - research_brief
---
```

Field rules:

| Field | Required | Notes |
|---|---|---|
| `name` | yes | Must equal the directory name. |
| `type` | yes | One of `op`, `flow`, `task`, `app`. |
| `version` | yes | Semver. Bump on contract change. |
| `description` | yes | Multi-line ok. Include trigger phrases for ops. |
| `user-invocable` | for ops | `true` only on `op-*`. Default `false` elsewhere. |
| `called_by` | yes | Array of caller skill names. Empty for top-level ops. |
| `calls` | yes | Array of called skill names. Empty for leaf tasks. |
| `inputs` | yes | Array of named inputs. Suffix optional inputs with `?`. Empty `[]` if none. |
| `outputs` | yes | Array of named outputs. Empty `[]` if side-effecting. |

Claude Code's skill loader only reads `name` and `description`. The extra fields are ignored by the runtime but enforced by our contract — they make the skill graph machine-greppable for validators, docs generators, and future installers.

The body of `SKILL.md` (after the closing `---`) is the human/LLM-readable instructions. Recommended H2 sections: `## What It Does`, `## Inputs`, `## Procedure`, `## Outputs`. The body must not duplicate the frontmatter fields as prose.

---

## 5. `agents/<role>.md` frontmatter schema

```yaml
---
name: sales-strategist
plugin: sales
version: 0.1.0
description: Owns prospect research through follow-up writing
owns_skills:
  - op-prep-discovery-call
  - op-draft-outreach
  - op-write-followup
---
```

Field rules:

| Field | Required | Notes |
|---|---|---|
| `name` | yes | Kebab-case. Must match the filename. |
| `plugin` | yes | Plugin this agent belongs to. |
| `version` | yes | Semver. |
| `description` | yes | One-line role summary. |
| `owns_skills` | yes | Array of `op-*` skills this agent runs. Empty `[]` only for support agents. |

Body sections (markdown after frontmatter): `## Your Role`, `## Domain Knowledge`, `## Operating Principles`, `## Hand-offs`.

---

## 6. Validation (manual until a script exists)

A reviewer checks:

- [ ] Plugin folder matches §1 — required files present, no orphan files
- [ ] Skill directory name matches `name` in frontmatter
- [ ] Prefix matches `type` (e.g., `op-` directory ⇒ `type: op`)
- [ ] `called_by` and `calls` reference skills that actually exist in this plugin
- [ ] Every `op-*` has `user-invocable: true`
- [ ] `plugin.json` `agents[]` lists every file in `agents/`
- [ ] Entry docs (`CLAUDE.md`, `AGENTS.md`, `GEMINI.md`) are present and mirrored
- [ ] Vault template and structure files exist at the declared paths

A future `scripts/lint-plugin.sh` will encode these checks. Not blocking today.

---

## 7. Versioning

Plugin and skill versions follow [SemVer](https://semver.org/):

- **MAJOR** — breaking change to manifest, frontmatter schema, or skill input/output contract
- **MINOR** — new skill, new agent, new field, additive change
- **PATCH** — copy edits, doc fixes, body changes that do not change the contract

When a skill's `inputs` or `outputs` change, bump that skill's `version` AND the parent plugin's `version`.

---

## 8. What this contract does NOT cover

- Skill content quality, prompt design, prose voice — see plugin-level `CLAUDE.md`
- Brand voice and tone — see `psilodigital-vault` (`_company/`)
- Per-client behavior — sourced from `_clients/` at runtime, never hardcoded
- Runtime authentication, secret loading — handled outside the plugin
