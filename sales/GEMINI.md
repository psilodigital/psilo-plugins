<!-- Gemini CLI: this file mirrors CLAUDE.md so Gemini reads the same instructions. All three (CLAUDE.md, AGENTS.md, GEMINI.md) stay in sync. -->

# Psilodigital Sales Plugin

## Vault Location

| OS | Vault path |
|----|------------|
| **Mac** | `~/Documents/psilodigital/vault/sales/` |
| **Windows** | `%USERPROFILE%\Documents\psilodigital\vault\sales\` |

Shared folders used by this plugin (also under `~/Documents/psilodigital/vault/`):
- `_company/` — Psilodigital positioning, services, tone of voice, pricing principles
- `_clients/<client>/` — per-client context (one folder per active prospect/client)

Determine the user's OS from context (file paths they share, or ask if unclear). Use the correct path for their OS. Never use relative paths.

## First Time Setup

If `~/Documents/psilodigital/vault/sales/` does not exist or is empty:

1. The plugin bundles a vault template under `sales/vault/`.
2. Copy `sales/vault/config.md` to `~/Documents/psilodigital/vault/sales/config.md`.
3. Create `~/Documents/psilodigital/vault/sales/{00_current,01_prior,02_briefs}` and `open-loops.md`.
4. Open `~/Documents/psilodigital/vault/sales/config.md` and fill in your details.
5. If `~/Documents/psilodigital/vault/_company/` is missing, scaffold it from the repo's `vault/company/` folder (or ask the user to provide their company context).

## Vault Structure

```
~/Documents/psilodigital/vault/
├── _company/                          ← shared, read by all psilodigital plugins
│   ├── positioning.md
│   ├── services.md
│   ├── tone-of-voice.md
│   ├── pricing-principles.md
│   └── delivery-principles.md
├── _clients/                          ← shared, read by all psilodigital plugins
│   └── <client>/
│       ├── overview.md
│       ├── meeting-notes/
│       └── proposals/
└── sales/
    ├── config.md                      ← your sales settings
    ├── open-loops.md                  ← active prospects, pending follow-ups
    ├── 00_current/                    ← active briefs and outreach drafts
    ├── 01_prior/                      ← completed and sent communications
    └── 02_briefs/                     ← generated meeting briefs and drafts
```

## Vault Access

**Mac:** If a file read fails with a permission error, the AI tool needs filesystem access to your Documents folder. Tell the user:
> *Go to **System Settings → Privacy & Security → Full Disk Access**, then add the app you are running this from:*
> - *Claude Code or Codex CLI in a terminal → add **Terminal**, **iTerm**, or **Ghostty** (whichever you use), then restart it.*
> - *Claude Desktop → add **Claude**, then restart it.*

**Windows:** No permission grant needed — terminal apps and Claude Desktop run unrestricted by default.

## First Run

Before running **any skill or flow** in this domain, read `~/Documents/psilodigital/vault/sales/config.md` and check whether the key fields have been filled in (non-blank values after the `:`).

**Rules (follow exactly, no improvisation):**

1. **Vault folder is missing entirely** → output the First-Run Message below, then stop.
2. **Config fields are blank** (empty after `:`) → output the First-Run Message below verbatim. Stop. Do **not** scaffold files, offer alternatives, or ask questions.
3. **Config is filled in** → proceed with the requested skill normally.

### First-Run Message

> **Welcome to Psilodigital Sales!**
>
> Your vault is installed at:
> - **Mac:** `~/Documents/psilodigital/vault/sales/`
> - **Windows:** `%USERPROFILE%\Documents\psilodigital\vault\sales\`
>
> Before skills can run, your config and shared context need to be in place.
>
> **Step 1 — Complete your config**
> Open `~/Documents/psilodigital/vault/sales/config.md` and fill in every field. Leave a field blank rather than guessing — the skills will flag anything that's missing.
>
> **Step 2 — Confirm your shared company context**
> The shared folder `~/Documents/psilodigital/vault/_company/` should contain:
> - `positioning.md` — what Psilodigital does and for whom
> - `services.md` — service catalog
> - `tone-of-voice.md` — voice guidelines
> - `pricing-principles.md` — how we price work
>
> If missing, copy from this plugin's `sales/vault/_company-template/` or your existing repo's `vault/company/`.
>
> **Step 3 — Add at least one client folder**
> Create `~/Documents/psilodigital/vault/_clients/<client>/overview.md` with what you know about the prospect.
>
> **Step 4 — Run your first skill**
> Try: *"prep me for a discovery call with <client>"*
>
> **Stop here.** Do not scaffold files, do not offer options, do not ask questions. Wait for the user to complete setup and re-run the skill.

## Skill Index

Skills live in `skills/<skill-name>/SKILL.md`. To run a skill, read its `SKILL.md` and follow the instructions inside.

**Operations (user-facing routines):**
- `op-prep-discovery-call` — Produce a discovery meeting brief for a named prospect. Triggers: "prep for discovery call", "prep me for <client> meeting", "discovery brief".
- `op-draft-outreach` — Draft cold or warm outreach for a prospect. Triggers: "draft outreach to <client>", "write a cold email to <client>", "warm intro to <client>".
- `op-write-followup` — Generate a post-meeting follow-up email from notes. Triggers: "write follow-up for <client>", "post-meeting email <client>".

**Flows (multi-step internals called by ops):**
- `flow-research-prospect` — Public-signal research (website, reviews, hiring, press) on a company; produces structured findings.
- `flow-extract-meeting-notes` — Structure raw meeting notes into pain points, opportunities, decisions, and open questions.

**Tasks (atomic primitives called by flows / ops):**
- `task-classify-bottleneck` — Map a described symptom to one of the SME bottleneck patterns from `_company/_shared/common-sme-bottlenecks.md`.
- `task-flag-assumption` — Write an assumption flag to `open-loops.md` with severity and recommended verification step.
- `task-update-open-loops` — Single write point for `open-loops.md`.

## Agent

This plugin ships one agent:
- `agents/sales-strategist.md` — Sales Strategist persona

Other Psilodigital plugins (proposals, delivery) define their own agents. The sales plugin operates independently; it does not require the others to be installed.
