# Changelog

All notable changes to `psilo-plugins` are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- `packs/core-sme-ops/` — first official pack, bundling SME operations agents, product-facing skill aliases, and workflows for meeting prep, proposal generation, and scope-to-delivery planning.
- `schemas/agent.schema.json`, `schemas/skill.schema.json`, `schemas/workflow.schema.json`, `schemas/pack.schema.json` — machine-readable JSON Schemas for validating plugin agents, skills, future explicit workflows, and future packs.
- `PLUGIN-CONTRACT.md` — formal plugin folder + frontmatter contract. Defines required directory shape, skill prefix taxonomy, `plugin.json` schema (with `agents[]`, `skills`, `vault`, `entry_docs`), strict YAML frontmatter schema for `SKILL.md` (with `name`, `type`, `version`, `description`, `user-invocable`, `called_by`, `calls`, `inputs`, `outputs`) and `agents/<role>.md` (with `name`, `plugin`, `version`, `description`, `owns_skills`), validation checklist, and SemVer policy.
- `CONTRIBUTING.md` — contribution rules, what does/does-not belong in the repo, skill and plugin authoring guide, PR checklist, versioning policy.
- `CHANGELOG.md` — this file, seeded with the 0.1.0 baseline.

### Changed
- `schemas/pack.schema.json` — pack contents now support structured entries with product-facing `name`, real repo `source`, and optional `description`.
- `README.md` — added explicit "What this repo is / is NOT" framing identifying the repo as Psilodigital's reusable intelligence layer.
- `ARCHITECTURE.md` — added IS / IS NOT comparison table reinforcing the separation between IP and runtime/client data.
- All 6 `plugin.json` manifests (3 Claude, 3 Codex) — expanded with `agents[]`, `skills`, `vault.{template,structure}`, `entry_docs[]` so the manifest declares plugin contents instead of relying on convention.
- All 6 `agents/<role>.md` files (sales-strategist, business-analyst, proposals/solution-architect, delivery-manager, delivery/solution-architect, devops-agent) — strict YAML frontmatter conforming to the contract, with `plugin`, `version`, `status`, `owns_skills` added.
- All 27 `SKILL.md` files across the three plugins — strict YAML frontmatter conforming to the contract: `name`, `type`, `version`, `status`, `description`, `user-invocable` (true on ops only), `called_by`, `calls`, `inputs`, `outputs`, `risk_level`, `requires_approval`. Bodies untouched.

## [0.1.0] — 2026-05-18

Initial public shape of the marketplace.

### Added
- Marketplace manifests (`.claude-plugin/marketplace.json`, `.agents/plugins/marketplace.json`) registering three plugins.
- **sales** plugin — Sales Strategist agent for prospect research, discovery prep, outreach drafting, and follow-ups.
- **proposals** plugin — Business Analyst + Solution Architect agents that turn meeting notes into proposals and MVP scopes with explicit assumptions, risks, and open questions.
- **delivery** plugin — Delivery Manager + Solution Architect + DevOps agents that convert approved scope into milestones, sprints, GitHub issues, and status updates.
- Four-layer skill taxonomy (`app-`, `op-`, `flow-`, `task-`) applied across all plugins.
- Mirrored entry docs (`CLAUDE.md` / `AGENTS.md` / `GEMINI.md`) per plugin for Claude Code, Codex CLI, and Gemini CLI parity.
- Vault templates (`<plugin>/vault/config.md`, `vault-structure.json`) describing the per-plugin sub-vault shape.
- `SYSTEM.md` — global operating rules (drafts only, human approval, no client mixing, no secrets in repo).
- `ARCHITECTURE.md` — six-layer model (Marketplace → Plugin → Role → Capability → Knowledge → Control) and code-vs-data separation.

[Unreleased]: https://github.com/psilodigital/psilo-plugins/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/psilodigital/psilo-plugins/releases/tag/v0.1.0
