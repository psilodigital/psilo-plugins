# Psilodigital Business Agent System

A **Claude Code / Codex / Gemini plugin marketplace** for Psilodigital's consulting work. Each plugin is independently installable and ships agents, skills, and a vault template.

## Plugins

| Plugin | Agents | What it does |
|--------|--------|--------------|
| **[sales](sales/)** | Sales Strategist | Prospect research, discovery call prep, outreach drafting, follow-up writing |
| **[proposals](proposals/)** | Business Analyst + Solution Architect | Meeting notes → proposals + MVP scope with explicit assumptions and risks |
| **[delivery](delivery/)** | Delivery Manager + Solution Architect + DevOps | Approved scope → milestones, sprint plans, status updates, GitHub issue structure |

Install one or all. Plugins do not require each other.

## Install

```bash
# Clone this repo
git clone <repo-url> && cd psilodigital-business-agent-system

# Set up the external user vault at ~/Documents/psilodigital/vault/
# by cloning the companion repos into it:
#   psilodigital-vault    → _company/ (positioning, services, tone, pricing)
#   psilodigital-clients  → _clients/ (per-client folders — most sensitive)
# Per-plugin sub-vaults (sales/, proposals/, delivery/) are auto-created on first run.

# In Claude Code: add this repo as a local marketplace
/plugin marketplace add /full/path/to/psilodigital-business-agent-system

# Install whichever domains you need
/plugin install sales@psilodigital
/plugin install proposals@psilodigital
/plugin install delivery@psilodigital
```

After install, fill in the per-plugin `config.md` under `~/Documents/psilodigital/vault/<plugin>/` and add at least one client folder under `~/Documents/psilodigital/vault/_clients/<client>/overview.md`.

## How it works

Each plugin follows a four-layer skill model:
- **app-** — external data connectors (HubSpot, Gong, GitHub) when MCPs aren't natively available
- **op-** — user-facing entry points ("prep me for a discovery call with Artway")
- **flow-** — multi-step internals called by ops
- **task-** — atomic primitives (flag an assumption, update open-loops)

Each plugin owns its sub-vault under `~/Documents/psilodigital/vault/<plugin>/`. Shared company facts (positioning, services, tone, pricing) live in `~/Documents/psilodigital/vault/_company/`. Per-client data lives in `~/Documents/psilodigital/vault/_clients/<client>/`.

## Repository layout

```
.
├── .claude-plugin/         marketplace + root plugin manifest
├── .agents/plugins/        Codex CLI marketplace mirror
├── sales/                  Sales plugin (self-contained)
├── proposals/              Proposals plugin (self-contained)
├── delivery/               Delivery plugin (self-contained)
├── SYSTEM.md               Global rules
├── ARCHITECTURE.md         Layer model
├── CLAUDE.md / AGENTS.md / GEMINI.md / CODEX.md   Repo-level entry points (mirrored)
└── README.md
```

**Companion repos** (separate, private):
- `psilodigital-vault` — Psilodigital company facts (positioning, tone, services, pricing) → clones into `~/Documents/psilodigital/vault/_company/`
- `psilodigital-clients` — per-client folders → clones into `~/Documents/psilodigital/vault/_clients/` (or sync from Drive/Box per client agreement)

## Adding a new plugin

1. Copy an existing plugin folder: `cp -r sales/ new-plugin/`
2. Update `<plugin>/.claude-plugin/plugin.json` and `<plugin>/.codex-plugin/plugin.json`.
3. Edit `CLAUDE.md` (and mirror to `AGENTS.md` + `GEMINI.md`).
4. Replace agents and skills with the new domain.
5. Register the plugin in `.claude-plugin/marketplace.json` and `.agents/plugins/marketplace.json`.

## Governance

This is internal Psilodigital IP. Do not commit secrets, real client confidential data, or production credentials. Governance rules (approval, data classification, review checklists) live in the companion `psilodigital-vault` repo.
