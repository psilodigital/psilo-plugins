# Architecture Overview

This repository is a **Claude Code / Codex / Gemini plugin marketplace**. It ships three independently installable plugins (`sales`, `proposals`, `delivery`), each self-contained with its own agents, skills, and vault template.

## Six layers

1. **Marketplace Layer** — `.claude-plugin/marketplace.json`, `.agents/plugins/marketplace.json`. Lists installable plugins.
2. **Plugin Layer** — `<plugin>/.claude-plugin/plugin.json`, `<plugin>/.codex-plugin/plugin.json`. Per-plugin manifests + entry docs (`CLAUDE.md` / `AGENTS.md` / `GEMINI.md` mirrored).
3. **Role Layer** — `<plugin>/agents/<role>.md`. Persona definitions per plugin.
4. **Capability Layer** — `<plugin>/skills/<skill>/SKILL.md`. Four-layer taxonomy: `app-` (data connectors), `op-` (user-facing entry points), `flow-` (multi-step internals), `task-` (atomic primitives).
5. **Knowledge Layer** — external user vault at `~/Documents/psilodigital/vault/` containing `_company/` (shared positioning + tone), `_clients/<client>/` (sensitive per-client data), and per-plugin sub-vaults (`sales/`, `proposals/`, `delivery/`). Sourced from the companion `psilodigital-vault` and `psilodigital-clients` repos.
6. **Control Layer** — repo-level `SYSTEM.md`, `governance/`, `mcp/`, `prompts/bootstrap/`, `env/`. Cross-plugin rules and tooling.

## Key separation: code vs. data

| Lives in this repo | Lives in companion repos / user vault |
|---|---|
| Plugin source (agents, skills, manifests) | Psilodigital company facts (`_company/`) |
| Governance and global rules | Per-client data (`_clients/<client>/`) |
| MCP connector specs | Generated briefs, drafts, status updates |
| Marketplace registry | Per-plugin sub-vault state (open-loops, current work) |

This separation means: the plugin code is potentially shareable; the company identity and client data are not.

## Goal

Make Psilodigital's consulting work repeatable, portable, and AI-operable — without leaking client data or hard-coding company facts into the plugin code.
