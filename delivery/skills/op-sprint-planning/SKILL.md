---
name: op-sprint-planning
type: op
version: 0.1.0
description: |
  Plan the next sprint from the active delivery plan. Pulls the next milestone's tasks,
  estimates capacity (15% buffer), sets a sprint goal, defines done, lists demo contents.
  Triggers: "plan next sprint for <client>", "sprint plan <client>",
  "what's in the next sprint for <client>?".
user-invocable: true
called_by: []
calls:
  - task-flag-risk
  - task-update-open-loops
inputs:
  - client_name
  - team_capacity_days
outputs:
  - sprint_plan_file
---

# op-sprint-planning

**Cadence:** Every 2 weeks (or per sprint cadence in `config.md`)
**Produces:** Sprint plan at `~/Documents/psilodigital/vault/delivery/00_current/<client>/sprint-plans/sprint-<n>.md`

## Procedure

1. **Locate the active delivery plan** at `00_current/<client>/delivery-plan.md`. If missing, prompt user to run `op-scope-to-delivery` first.
2. **Read prior sprint plans** in `00_current/<client>/sprint-plans/` to determine the next sprint number.
3. **Identify the next milestone** from the delivery plan and pull its task list.
4. **Ask the user for team capacity** for the sprint (engineers × days available). Do not assume.
5. **Select tasks** that fit capacity. Leave 15% buffer for surprises.
6. **Set a sprint goal** (one sentence). Define done (sprint demo contents).
7. **Save** to `sprint-plans/sprint-<n>.md`.
8. **Call `task-update-open-loops`** with the new sprint goal and demo date.

## Output Structure

```markdown
# Sprint <n> — <client>

**Dates:** <start> → <end>
**Goal:** <one sentence>
**Definition of done:** <what the demo will show>

## Capacity
- Engineers × days = <total>
- Buffer (15%): <amount>
- Available: <available>

## Tasks
| ID | Title | Owner | Estimate (days) | Depends on |
|---|---|---|---|---|

## Demo contents
- ...

## Risks for this sprint
- ...
```

## Calls

- **Tasks:** `task-flag-risk`, `task-update-open-loops`

## Rules

- Never assume capacity — always ask the user.
- Always leave a 15% buffer.
- Define done means demoable, not "code done."
- Do not commit timelines that require overtime.
