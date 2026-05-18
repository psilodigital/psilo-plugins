# Contributing to `psilo-plugins`

Thanks for improving Psilodigital's intelligence layer. This repo is the **reusable IP** that gets installed into every client environment, so changes here ripple everywhere. Read this before opening a PR.

## What belongs in this repo

Only reusable, environment-agnostic IP:

- Agent personas (`<plugin>/agents/*.md`)
- Skills under the four-layer taxonomy (`op-`, `flow-`, `task-`, `app-`)
- Packs under `packs/<pack>/` that bundle existing agents, skills, and workflows
- Plugin and marketplace manifests
- Vault **templates** (`<plugin>/vault/config.md`, `vault-structure.json`)
- Cross-plugin governance (`SYSTEM.md`, `ARCHITECTURE.md`)
- Examples that use placeholder data only

## What does NOT belong in this repo

If a PR adds any of the following, it will be rejected:

- Client names, contacts, deal details, or any private client data
- Real credentials, API keys, tokens, `.env` files
- Run logs, generated briefs, drafts, status updates, or other runtime outputs
- Production deployment code, infrastructure-as-code, or runtime apps
- Hardcoded company facts that belong in `psilodigital-vault` (`_company/`)

Sensitive material lives in the companion repos (`psilodigital-vault`, `psilodigital-clients`) or in the user's local vault — never here.

## Branching and commits

- Branch from `main` using `feat/<scope>`, `fix/<scope>`, or `docs/<scope>`.
- One logical change per PR. Keep diffs reviewable.
- Commit messages: imperative mood, short subject, optional body explaining the *why*.
- Update `CHANGELOG.md` under the `## [Unreleased]` heading for any user-visible change.

## Adding a new skill

1. Pick the right layer prefix: `op-` (user-facing), `flow-` (multi-step internal), `task-` (atomic), `app-` (data connector).
2. Place it under the relevant plugin's `skills/` folder.
3. Each skill is its own directory with `SKILL.md` describing trigger, inputs, outputs, and side effects.
4. Reference vault paths via the vault template — never hardcode `~/Documents/...`.

## Adding a new plugin

1. `cp -r sales/ new-plugin/`
2. Edit manifests (`.claude-plugin/plugin.json`, `.codex-plugin/plugin.json`), entry docs (`CLAUDE.md` / `AGENTS.md` / `GEMINI.md` — mirrored), agents, skills, and `vault/config.md`.
3. Register the plugin in `.claude-plugin/marketplace.json` and `.agents/plugins/marketplace.json`.
4. Add a row to the Plugins table in `README.md` and a `## Plugins` entry in `SYSTEM.md`.

## Adding a new pack

1. Create `packs/<pack-name>/pack.yaml`, `packs/<pack-name>/README.md`, and `packs/<pack-name>/CHANGELOG.md`.
2. Use product-facing names for pack entries only when they map clearly to real source files.
3. Make sure every `source` path exists in this repo.
4. Add the pack to the Packs table in `README.md`.

## Review checklist (PR author + reviewer)

- [ ] No client data, credentials, secrets, or run output
- [ ] Agent and skill frontmatter matches the machine-readable schemas in `schemas/`
- [ ] Pack manifests validate against `schemas/pack.schema.json`, and every `source` path exists
- [ ] Skill prefix matches its layer (`op-` / `flow-` / `task-` / `app-`)
- [ ] Entry docs are mirrored across `CLAUDE.md` / `AGENTS.md` / `GEMINI.md`
- [ ] Manifest version bumped if behavior or shape changed
- [ ] `CHANGELOG.md` updated under `## [Unreleased]`
- [ ] Global rules in `SYSTEM.md` still hold (drafts only, human approval, no context mixing)

## Versioning

This repo follows [Semantic Versioning](https://semver.org/):

- **MAJOR** — breaking changes to plugin or marketplace manifests, vault schema, or skill contracts
- **MINOR** — new plugin, new agent, new skill, additive manifest fields
- **PATCH** — copy fixes, doc fixes, internal refactors with no contract change

The marketplace version in `.claude-plugin/marketplace.json` is the source of truth.

Packs use semantic-ish versioning:

- `0.1.0` — first experimental version
- `0.2.0` — new skills, workflows, agents, or pack aliases
- `0.2.1` — fixes, documentation improvements, source mapping corrections, or prompt improvements that do not change the pack contract
- `1.0.0` — stable client-ready pack

When a pack changes, update `packs/<pack>/pack.yaml` and `packs/<pack>/CHANGELOG.md` in the same PR so clients can assess update impact.

## Reporting issues

Open an issue with: what you tried, what you expected, what happened, and which plugin + version you were on. If the issue involves a client run, **redact the data** before pasting — this repo is shared.
