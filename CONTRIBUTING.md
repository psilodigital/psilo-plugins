# Contributing to `psilo-plugins`

Thanks for improving Psilodigital's intelligence layer. This repo is the **reusable IP** that gets installed into every client environment, so changes here ripple everywhere. Read this before opening a PR.

## What belongs in this repo

Only reusable, environment-agnostic IP:

- Agent personas (`<plugin>/agents/*.md`)
- Skills under the four-layer taxonomy (`op-`, `flow-`, `task-`, `app-`)
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

## Review checklist (PR author + reviewer)

- [ ] No client data, credentials, secrets, or run output
- [ ] Agent and skill frontmatter matches the machine-readable schemas in `schemas/`
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

## Reporting issues

Open an issue with: what you tried, what you expected, what happened, and which plugin + version you were on. If the issue involves a client run, **redact the data** before pasting — this repo is shared.
