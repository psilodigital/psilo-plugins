# Psilodigital Proposals Plugin

## Vault Location

| OS | Vault path |
|----|------------|
| **Mac** | `~/Documents/psilodigital/vault/proposals/` |
| **Windows** | `%USERPROFILE%\Documents\psilodigital\vault\proposals\` |

Shared folders used by this plugin (also under `~/Documents/psilodigital/vault/`):
- `_company/` — Psilodigital positioning, services, pricing principles, delivery principles
- `_company/_shared/` — shared references (common-sme-bottlenecks, operations-levels, ai-readiness-framework)
- `_clients/<client>/` — per-client context

## First Time Setup

If `~/Documents/psilodigital/vault/proposals/` does not exist or is empty:

1. The plugin bundles a vault template under `proposals/vault/`.
2. Copy `proposals/vault/config.md` to `~/Documents/psilodigital/vault/proposals/config.md`.
3. Create `~/Documents/psilodigital/vault/proposals/{00_current,01_prior,02_briefs}` and `open-loops.md`.
4. Open `~/Documents/psilodigital/vault/proposals/config.md` and fill in your details.

## Vault Structure

```
~/Documents/psilodigital/vault/proposals/
├── config.md
├── open-loops.md
├── 00_current/<client>/
│   ├── proposal.md
│   ├── scope.md
│   └── requirements.md
├── 01_prior/        — sent and archived proposals by quarter
└── 02_briefs/       — generated artifacts
```

## Vault Access

**Mac:** If a file read fails with a permission error, the AI tool needs filesystem access to your Documents folder. Tell the user:
> *Go to **System Settings → Privacy & Security → Full Disk Access**, then add the app you are running this from.*

**Windows:** No permission grant needed.

## First Run

Before running any skill, read `~/Documents/psilodigital/vault/proposals/config.md` and check whether the key fields have been filled in.

**Rules:**

1. **Vault folder is missing entirely** → output the First-Run Message below. Stop.
2. **Config fields are blank** → output the First-Run Message verbatim. Stop. Do not scaffold files.
3. **Config is filled in** → proceed.

### First-Run Message

> **Welcome to Psilodigital Proposals!**
>
> Your vault is at `~/Documents/psilodigital/vault/proposals/`. Before skills can run:
>
> **Step 1 — Complete your config** (`config.md`). Leave fields blank if unknown.
>
> **Step 2 — Confirm shared context** at `~/Documents/psilodigital/vault/_company/`:
> - `positioning.md`, `services.md`, `pricing-principles.md`, `delivery-principles.md`, `tone-of-voice.md`
> - Plus `_company/_shared/` for the reference docs (bottlenecks, operations-levels, ai-readiness-framework)
>
> **Step 3 — Have client context** at `~/Documents/psilodigital/vault/_clients/<client>/` including at minimum `overview.md` and meeting notes.
>
> **Step 4 — Run your first skill**: *"build a proposal for <client>"*
>
> **Stop here.** Do not scaffold files, do not ask questions. Wait for the user to complete setup and re-run.

## Skill Index

**Operations (user-facing routines):**
- `op-build-proposal` — Produce a full proposal draft for a named client. Triggers: "build a proposal for <client>", "draft proposal <client>", "write proposal for <client>".
- `op-build-scope` — Produce a standalone MVP scope (when proposal is deferred). Triggers: "scope <client>", "build MVP scope for <client>", "what would an MVP look like for <client>?".

**Flows (multi-step internals):**
- `flow-research-client` — Deeper client research (operations, data, team, prior tech decisions) for proposal-quality context.
- `flow-draft-proposal` — Section-by-section proposal authoring with assumptions explicit.
- `flow-build-scope` — MVP scope construction: capabilities, data model, integrations, roles, phases.

**Tasks (atomic primitives):**
- `task-flag-assumption` — Write an assumption flag to `open-loops.md`.
- `task-update-open-questions` — Add/resolve open questions for a client (separate from assumptions: questions need a human answer).
- `task-update-open-loops` — Single write point for `open-loops.md`.

## Agents

This plugin ships two agents:
- `agents/business-analyst.md` — owns business case, requirements, current state
- `agents/solution-architect.md` — owns technical scope, integrations, phases (scope-focused; the delivery plugin ships a different SA focused on implementation)

The plugin operates independently. Does not require sales or delivery plugins to be installed.
