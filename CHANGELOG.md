# Changelog

All notable changes to `psilo-plugins` are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- `CONTRIBUTING.md` — contribution rules, what does/does-not belong in the repo, skill and plugin authoring guide, PR checklist, versioning policy.
- `CHANGELOG.md` — this file, seeded with the 0.1.0 baseline.
- `README.md` — explicit "What this repo is / is NOT" framing identifying the repo as Psilodigital's reusable intelligence layer.
- `ARCHITECTURE.md` — IS / IS NOT comparison table reinforcing the separation between IP and runtime/client data.

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
