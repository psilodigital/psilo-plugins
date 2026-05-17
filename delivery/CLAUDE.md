# Psilodigital Delivery Plugin

## Vault Location

| OS | Vault path |
|----|------------|
| **Mac** | `~/Documents/psilodigital/vault/delivery/` |
| **Windows** | `%USERPROFILE%\Documents\psilodigital\vault\delivery\` |

Shared folders used by this plugin:
- `_company/` — Psilodigital positioning, services, delivery principles, tone of voice
- `_company/_shared/` — shared reference docs
- `_clients/<client>/` — per-client context, including the approved scope from the proposals plugin

## First Time Setup

If `~/Documents/psilodigital/vault/delivery/` does not exist or is empty:

1. The plugin bundles a vault template under `delivery/vault/`.
2. Copy `delivery/vault/config.md` to `~/Documents/psilodigital/vault/delivery/config.md`.
3. Create `~/Documents/psilodigital/vault/delivery/{00_current,01_prior,02_briefs}` and `open-loops.md`.
4. Open `~/Documents/psilodigital/vault/delivery/config.md` and fill in your details.

## Vault Structure

```
~/Documents/psilodigital/vault/delivery/
├── config.md
├── open-loops.md
├── 00_current/<client>/
│   ├── delivery-plan.md
│   ├── sprint-plans/<sprint-n>.md
│   ├── status-updates/<YYYY-MM-DD>.md
│   ├── architecture/<adr-n>.md
│   └── devops/
│       ├── environments.md
│       ├── cicd.md
│       └── runbooks/
├── 01_prior/                 — completed engagements
└── 02_briefs/                — generated artifacts
```

## Vault Access

**Mac:** If a file read fails with a permission error, the user needs to grant Full Disk Access to their terminal app.

**Windows:** No permission grant needed.

## First Run

Before running any skill, read `~/Documents/psilodigital/vault/delivery/config.md` and check whether the key fields are filled in.

**Rules:**

1. **Vault folder missing** → output First-Run Message. Stop.
2. **Config fields blank** → output First-Run Message verbatim. Stop. Do not scaffold.
3. **Config filled in** → proceed.

### First-Run Message

> **Welcome to Psilodigital Delivery!**
>
> Your vault is at `~/Documents/psilodigital/vault/delivery/`. Before skills can run:
>
> **Step 1 — Complete your config** (`config.md`).
>
> **Step 2 — Have an approved scope** at `~/Documents/psilodigital/vault/_clients/<client>/scope.md` (produced by the proposals plugin) or paste your own when prompted.
>
> **Step 3 — Run your first skill**: *"build a delivery plan for <client>"*
>
> **Stop here.** Wait for the user to complete setup and re-run.

## Skill Index

**Operations (user-facing routines):**
- `op-scope-to-delivery` — Convert approved scope into a delivery plan with milestones, dependencies, and proposed GitHub issue structure. Triggers: "build delivery plan for <client>", "scope to delivery <client>", "plan execution for <client>".
- `op-sprint-planning` — Plan the next sprint from the active delivery plan. Triggers: "plan next sprint for <client>", "sprint plan <client>", "what's in the next sprint for <client>?".
- `op-status-update` — Generate a weekly client-facing status update from sprint progress. Triggers: "status update for <client>", "weekly update <client>", "write the <client> status report".

**Flows (multi-step internals):**
- `flow-break-milestones` — Decompose scope capabilities into 2-week milestones with demoable deliverables.
- `flow-verify-feasibility` — Verify a TBD-feasibility integration from the proposal; produce confirmation or blocker note.
- `flow-suggest-github-issues` — Translate milestones into proposed GitHub issue structure (titles, labels, dependencies).
- `flow-design-environments` — Produce environment plan (dev/staging/prod) with cost estimates.
- `flow-design-cicd` — Produce CI/CD pipeline definition with reversible deployments.

**Tasks (atomic primitives):**
- `task-flag-risk` — Write a risk entry to `open-loops.md` with severity and mitigation plan.
- `task-flag-dependency` — Write a dependency entry (owner + date) to `open-loops.md`.
- `task-update-open-loops` — Single write point for `open-loops.md`.

## Agents

This plugin ships three agents:
- `agents/delivery-manager.md` — owns plan, cadence, status, dependencies
- `agents/solution-architect.md` — owns runtime architecture and integration verification (different from the proposals plugin's SA, which is scope-focused)
- `agents/devops-agent.md` — owns environments, CI/CD, security baseline

The plugin operates independently. Does not require sales or proposals plugins to be installed; if scope.md is missing, the user provides it.
