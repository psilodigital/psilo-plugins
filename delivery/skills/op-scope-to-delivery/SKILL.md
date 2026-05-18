---
name: op-scope-to-delivery
type: op
version: 0.1.0
status: active
risk_level: low
requires_approval: false
description: |
  Convert an approved scope into a delivery plan — milestones, dependencies, integration
  feasibility verification, environment plan, CI/CD plan, and proposed GitHub issue
  structure. Triggers: "build delivery plan for <client>", "scope to delivery <client>",
  "plan execution for <client>".
user-invocable: true
called_by: []
calls:
  - flow-verify-feasibility
  - flow-break-milestones
  - flow-design-environments
  - flow-design-cicd
  - flow-suggest-github-issues
  - task-flag-risk
  - task-flag-dependency
  - task-update-open-loops
inputs:
  - client_name
  - scope_path?
outputs:
  - delivery_plan_file
  - environments_file
  - cicd_file
  - issues_proposed_file
---

# op-scope-to-delivery

**Cadence:** On-demand (after a proposal is approved and scope is locked)
**Produces:** Delivery plan at `~/Documents/psilodigital/vault/delivery/00_current/<client>/delivery-plan.md`, plus architecture, environments, CI/CD, and GitHub issue structure

## What It Does

Orchestrates the Delivery Manager, Solution Architect, and DevOps Agent to turn an approved scope into a complete execution plan. Verifies every `TBD-feasibility` flag from the proposal. Produces a coherent set of artifacts the team can pick up and execute.

## Procedure

1. **Locate the scope.** Read `~/Documents/psilodigital/vault/_clients/<client>/scope.md` (produced by the proposals plugin). If missing, ask the user to paste the approved scope or point to a file.
2. **Verify scope is approved.** Confirm with the user explicitly: "is this scope the version the client has approved?" If unclear, do not proceed.
3. **Call `flow-verify-feasibility`** for every integration tagged `TBD-feasibility` in the scope. If any returns `blocker`, stop and surface the blocker before continuing.
4. **Call `flow-break-milestones`** to decompose capabilities into 2-week milestones with demoable deliverables.
5. **Call `flow-design-environments`** to produce dev/staging/prod plan with cost estimates.
6. **Call `flow-design-cicd`** to produce the CI/CD pipeline with reversible deployments.
7. **Call `flow-suggest-github-issues`** to translate milestones into proposed issue structure.
8. **For every risk surfaced**, call `task-flag-risk`.
9. **For every dependency**, call `task-flag-dependency` (owner + date required).
10. **Call `task-update-open-loops`** to register the engagement as active.
11. **Produce `delivery-plan.md`** at `00_current/<client>/delivery-plan.md` consolidating the above.

## Output Structure (delivery-plan.md)

1. **Engagement summary** — client, scope reference, kickoff date, target end date
2. **Milestones** — table: milestone, weeks, demoable deliverable, dependencies, owner
3. **Sprint cadence** — default 2 weeks, demo cadence
4. **Architecture decisions (ADRs)** — links to `architecture/adr-<n>.md`
5. **Environments** — link to `devops/environments.md`
6. **CI/CD** — link to `devops/cicd.md`
7. **Proposed GitHub issues** — link to `issues-proposed.md`
8. **Risks** — pulled from `open-loops.md`
9. **Dependencies** — pulled from `open-loops.md`
10. **Open questions before kickoff**

## Calls

- **Flows:** `flow-verify-feasibility`, `flow-break-milestones`, `flow-design-environments`, `flow-design-cicd`, `flow-suggest-github-issues`
- **Tasks:** `task-flag-risk`, `task-flag-dependency`, `task-update-open-loops`

## Vault Output

- `~/Documents/psilodigital/vault/delivery/00_current/<client>/delivery-plan.md`
- `~/Documents/psilodigital/vault/delivery/00_current/<client>/architecture/adr-*.md`
- `~/Documents/psilodigital/vault/delivery/00_current/<client>/devops/environments.md`
- `~/Documents/psilodigital/vault/delivery/00_current/<client>/devops/cicd.md`
- `~/Documents/psilodigital/vault/delivery/00_current/<client>/issues-proposed.md`
- `~/Documents/psilodigital/vault/delivery/open-loops.md` (updated)

## Rules

- Do not proceed without confirmed scope approval.
- Do not commit timelines without verified feasibility for every integration.
- Every milestone has a demoable deliverable. No deliverable, no milestone.
- Do not create GitHub issues directly — propose structure; the human creates.
- Save all artifacts. No external action.
