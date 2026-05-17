# Architecture Overview

This repository (`psilo-plugins`) is a Claude Code / Codex CLI / Gemini CLI **plugin marketplace** — the reusable intelligence layer of Psilodigital's consulting practice. It ships three independently installable plugins (`sales`, `proposals`, `delivery`), each self-contained with its own agents, skills, and vault template.

## What this repo is — and is not

| It IS | It is NOT |
|---|---|
| The reusable intelligence layer (agents, skills, workflows) | A client workspace |
| Versioned, portable IP installed into many environments | A runtime application |
| Schemas, templates, examples, industry packs | A UI or end-user product |
| Public-friendly source code | A store for client data, secrets, logs, or deployments |

This separation is load-bearing: it is what lets us improve the IP once and ship the improvement into every client environment without leaking anyone's data.

## Six layers

1. **Marketplace Layer** — `.claude-plugin/marketplace.json`, `.agents/plugins/marketplace.json`. Lists installable plugins.
2. **Plugin Layer** — `<plugin>/.claude-plugin/plugin.json`, `<plugin>/.codex-plugin/plugin.json`. Per-plugin manifests + entry docs (`CLAUDE.md` / `AGENTS.md` / `GEMINI.md` mirrored).
3. **Role Layer** — `<plugin>/agents/<role>.md`. Persona definitions per plugin.
4. **Capability Layer** — `<plugin>/skills/<skill>/SKILL.md`. Four-layer taxonomy: `app-` (data connectors), `op-` (user-facing entry points), `flow-` (multi-step internals), `task-` (atomic primitives).
5. **Knowledge Layer** — external user vault at `~/Documents/psilodigital/vault/` containing `_company/` (shared positioning + tone), `_clients/<client>/` (sensitive per-client data), and per-plugin sub-vaults (`sales/`, `proposals/`, `delivery/`). Sourced from the companion `psilodigital-vault` and `psilodigital-clients` repos.
6. **Control Layer** — repo-level `SYSTEM.md` and per-plugin `CLAUDE.md` / `AGENTS.md` / `GEMINI.md` mirrors. Psilodigital-specific governance, MCP setup, and templates live in the companion `psilodigital-vault` repo.

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
