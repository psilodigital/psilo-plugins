# psilodigital-plugins

Psilodigital's plugin marketplace for Claude Code, Codex CLI, and Gemini CLI.

Each plugin packages a slice of our consulting work — agents, skills, and a vault template — so any team member or partnered client can install just the piece they need.

## Plugins

| Plugin | Agents | What it does |
|---|---|---|
| **[sales](sales/)** | Sales Strategist | Prospect research, discovery call prep, outreach drafting, follow-up writing |
| **[proposals](proposals/)** | Business Analyst + Solution Architect | Meeting notes → proposal + MVP scope, with explicit assumptions and risks |
| **[delivery](delivery/)** | Delivery Manager + Solution Architect + DevOps | Approved scope → milestones, sprints, status updates, GitHub issue structure |

Plugins are independent — install one or all three.

## Install

```bash
# 1. Clone this repo locally
git clone https://github.com/psilodigital/psilodigital-plugins.git
cd psilodigital-plugins

# 2. Make sure the companion vault repos are cloned into the user vault
#    (see the psilodigital-vault and psilodigital-clients READMEs)
#    Result: ~/Documents/psilodigital/vault/{_company,_clients}/

# 3. Register this repo as a local plugin marketplace
# In Claude Code:
/plugin marketplace add /full/path/to/psilodigital-plugins

# 4. Install whichever plugins you need
/plugin install sales@psilodigital
/plugin install proposals@psilodigital
/plugin install delivery@psilodigital
```

On first run, each plugin scaffolds its own sub-vault under `~/Documents/psilodigital/vault/<plugin>/` and asks you to fill in `config.md`.

## How a plugin is organized

```
<plugin>/
├── .claude-plugin/plugin.json   ← Claude Code manifest
├── .codex-plugin/plugin.json    ← Codex CLI manifest
├── CLAUDE.md / AGENTS.md / GEMINI.md   ← mirrored entry points
├── agents/<role>.md             ← agent personas
├── skills/                      ← four-layer taxonomy
│   ├── op-*    ← user-facing entry points
│   ├── flow-*  ← multi-step internals called by ops
│   ├── task-*  ← atomic primitives called by flows
│   └── app-*   ← external data connectors (optional)
└── vault/
    ├── config.md                ← user-vault template
    └── vault-structure.json     ← declares the user-vault shape
```

## Where data lives

Plugin **code** is in this repo. Plugin **data** is in two companion repos cloned into the user's local vault:

```
~/Documents/psilodigital/vault/
├── _company/      ← from psilodigital-vault (positioning, services, tone, pricing)
├── _clients/      ← from psilodigital-clients (per-client folders — sensitive)
├── sales/         ← scaffolded by this repo's sales plugin
├── proposals/     ← scaffolded by this repo's proposals plugin
└── delivery/      ← scaffolded by this repo's delivery plugin
```

This separation keeps reusable code public-friendly while keeping company and client data restricted.

## Adding a new plugin

1. `cp -r sales/ new-plugin/`
2. Edit `new-plugin/.claude-plugin/plugin.json`, `.codex-plugin/plugin.json`, `CLAUDE.md` (mirror to `AGENTS.md` + `GEMINI.md`), agents, skills, and `vault/config.md`.
3. Register the plugin in `.claude-plugin/marketplace.json` and `.agents/plugins/marketplace.json`.

## Global rules

- Business-friendly language first, technical second
- Separate facts, assumptions, risks, recommendations
- Never overpromise integrations or automation
- Never expose secrets
- Never mix client contexts
- Never send communications directly — drafts only
- Ask for human approval before any external action

Each plugin's agent definition enforces these rules. Psilodigital-specific governance (approval rules, data classification, review checklists) lives in `psilodigital-vault`.

## License

Internal Psilodigital IP. Do not redistribute without explicit approval.
