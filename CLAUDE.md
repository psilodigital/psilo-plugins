# Psilodigital Business Agent System — Plugin Marketplace

This repository is a **Claude Code plugin marketplace** for Psilodigital. It ships three independently installable plugins:

| Plugin | Agents | What it does |
|--------|--------|--------------|
| **sales** | Sales Strategist | Prospect research, discovery prep, outreach, follow-ups |
| **proposals** | Business Analyst + Solution Architect | Meeting notes → proposals + MVP scope |
| **delivery** | Delivery Manager + Solution Architect + DevOps | Approved scope → milestones, sprints, status updates |

Each plugin is **self-contained**: its own agents, skills, vault template, and CLAUDE.md entry point. Install only what you need.

## How to install

```bash
# 1. Set up the external user vault — clone the companion repos into
#    ~/Documents/psilodigital/vault/ following their setup instructions:
#      psilodigital-vault    → _company/ (positioning, services, tone, pricing)
#      psilodigital-clients  → _clients/ (per-client folders, sensitive)

# 2. From Claude Code, add this repo as a local marketplace:
/plugin marketplace add /path/to/psilodigital-business-agent-system

# 3. Install one or more plugins:
/plugin install sales@psilodigital
/plugin install proposals@psilodigital
/plugin install delivery@psilodigital
```

Each plugin reads from `~/Documents/psilodigital/vault/<plugin>/` (auto-scaffolded on first run) and the shared `~/Documents/psilodigital/vault/_company/` + `_clients/` folders (sourced from the companion repos).

## Where to read next

When working **inside a plugin context**, follow the plugin's own CLAUDE.md:
- [sales/CLAUDE.md](sales/CLAUDE.md)
- [proposals/CLAUDE.md](proposals/CLAUDE.md)
- [delivery/CLAUDE.md](delivery/CLAUDE.md)

When working **at the repo level** (adding a plugin, updating governance, MCP specs):
1. [SYSTEM.md](SYSTEM.md) — global rules
2. [ARCHITECTURE.md](ARCHITECTURE.md) — folder purpose and layer model
3. [governance/](governance/) — approval rules, data classification, review checklist
4. [prompts/bootstrap/](prompts/bootstrap/) — scaffolding prompts for new plugins/skills
5. [mcp/](mcp/) — MCP connector specs referenced by plugins

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

Full governance in [governance/](governance/).
