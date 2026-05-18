---
name: task-flag-risk
type: task
version: 0.1.0
status: active
risk_level: low
requires_approval: false
description: |
  Atomic primitive. Appends a risk entry to open-loops.md with severity (low/medium/
  high), owner, and mitigation plan. No risk without a plan. High severity escalates
  immediately and surfaces in every status update until downgraded.
user-invocable: false
called_by:
  - op-scope-to-delivery
  - op-sprint-planning
  - op-status-update
  - flow-verify-feasibility
  - flow-design-environments
  - flow-design-cicd
calls: []
inputs:
  - client
  - risk
  - severity
  - mitigation
  - owner
outputs: []
---

# task-flag-risk

**Type:** Task (atomic primitive)
**Produces:** New entry under `## Risks` in `~/Documents/psilodigital/vault/delivery/open-loops.md`

## Inputs

- `client` — required
- `risk` — required, one-line description
- `severity` — required: `low` | `medium` | `high`
  - `low` = monitor; flag in status update
  - `medium` = mitigation plan in place within 1 week
  - `high` = escalate to client and Psilodigital ownership immediately
- `mitigation` — required, one-line plan (no risk without a plan)
- `owner` — required, name responsible for executing the mitigation

## Procedure

1. **Open** `~/Documents/psilodigital/vault/delivery/open-loops.md` (create if missing with section headings).
2. **Append** under `## Risks` (or update if same risk for same client already exists).
3. **Severity transitions** — if updating, log the transition with a timestamp under the entry.

## Entry Format

```markdown
- [ ] **<client>** | severity: <severity> | owner: <owner> | logged: <YYYY-MM-DD>
  - risk: <risk>
  - mitigation: <mitigation>
```

## Rules

- No risk without a mitigation plan.
- Severity transitions are tracked, never overwritten silently.
- `high` severity surfaces in every status update until downgraded.
- Resolution moves the entry to `## Resolved` via `task-update-open-loops`.
