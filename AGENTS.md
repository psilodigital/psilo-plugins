<!-- Codex / non-Claude agents: this file mirrors CLAUDE.md so any AGENTS.md-aware agent (Codex CLI, etc.) reads the same instructions. All three (CLAUDE.md, AGENTS.md, GEMINI.md) stay in sync. -->

# Psilodigital Business Agent System — Plugin Marketplace

This repository is a **Claude Code / Codex CLI / Gemini CLI plugin marketplace** for Psilodigital. It ships three independently installable plugins:

| Plugin | Agents | What it does |
|--------|--------|--------------|
| **sales** | Sales Strategist | Prospect research, discovery prep, outreach, follow-ups |
| **proposals** | Business Analyst + Solution Architect | Meeting notes → proposals + MVP scope |
| **delivery** | Delivery Manager + Solution Architect + DevOps | Approved scope → milestones, sprints, status updates |

Each plugin is **self-contained**: its own agents, skills, vault template, and AGENTS.md entry point. Install only what you need.

## How to install

```bash
# 1. Set up the external user vault — clone the companion repos:
#      psilodigital-vault    → _company/ content
#      psilodigital-clients  → _clients/ content
#    into ~/Documents/psilodigital/vault/

# 2. From your AI tool, add this repo as a local marketplace.
#    (Claude Code:  /plugin marketplace add /path/to/repo)
#    (Codex CLI:    see .agents/plugins/marketplace.json)

# 3. Install one or more plugins:
#    /plugin install sales@psilodigital
#    /plugin install proposals@psilodigital
#    /plugin install delivery@psilodigital
```

After install, each plugin reads from `~/Documents/psilodigital/vault/<plugin>/` and the shared `~/Documents/psilodigital/vault/_company/` + `_clients/` folders.

## Where to read next

When working **inside a plugin context**, follow the plugin's own AGENTS.md (or CLAUDE.md / GEMINI.md — they are mirrors):
- [sales/AGENTS.md](sales/AGENTS.md)
- [proposals/AGENTS.md](proposals/AGENTS.md)
- [delivery/AGENTS.md](delivery/AGENTS.md)

When working **at the repo level** (adding a plugin, updating cross-plugin rules):
1. [SYSTEM.md](SYSTEM.md) — global rules
2. [ARCHITECTURE.md](ARCHITECTURE.md) — folder purpose and layer model

To add a new plugin: copy an existing plugin folder (e.g. `cp -r sales/ new-plugin/`), edit the manifests, agents, and skills, then register it in `.claude-plugin/marketplace.json` and `.agents/plugins/marketplace.json`.

## Skill taxonomy

All plugin skills follow a four-layer pattern:

| Layer | Purpose | Naming |
|-------|---------|--------|
| **app-** | External data connectors (MCP fallbacks) | `app-hubspot`, `app-github` |
| **op-** | User-facing entry points | `op-prep-discovery-call`, `op-build-proposal` |
| **flow-** | Multi-step internals called by ops | `flow-research-client`, `flow-build-scope` |
| **task-** | Atomic primitives called by flows | `task-flag-assumption`, `task-update-open-loops` |

When creating a new skill, place it inside the relevant plugin's `skills/` folder with this prefix convention.

## Global rules (apply across all plugins)

- Business-friendly language first, technical second
- Separate facts, assumptions, risks, recommendations
- Never overpromise integrations or automation
- Never expose secrets
- Never mix client contexts
- Ask for human approval before external actions
- Never send communications directly — drafts only

These rules are baked into each plugin's agent definition. Psilodigital-specific governance lives in the companion `psilodigital-vault` repo.

## Editing rules

**New plugin:** copy an existing plugin folder (e.g. `cp -r sales/ new-plugin/`), then update `.claude-plugin/plugin.json`, `.codex-plugin/plugin.json`, `CLAUDE.md`/`AGENTS.md`/`GEMINI.md`, `agents/`, `skills/`, and `vault/config.md` + `vault/vault-structure.json`. Register in both root marketplace files.

**New skill:** choose the layer prefix (`app-` / `op-` / `flow-` / `task-`), create `<plugin>/skills/<skill-name>/SKILL.md`, declare `called_by` (for flows/tasks) and trigger phrases (for ops) in frontmatter.
