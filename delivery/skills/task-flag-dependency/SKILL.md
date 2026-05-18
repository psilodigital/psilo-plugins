---
name: task-flag-dependency
type: task
version: 0.1.0
description: |
  Atomic primitive. Appends a dependency entry to open-loops.md. Every dependency has
  a named owner and a follow-up date — no "waiting on the client" without a name and
  date. Surfaces in status updates until resolved.
user-invocable: false
called_by:
  - op-scope-to-delivery
  - op-sprint-planning
  - op-status-update
calls: []
inputs:
  - client
  - dependency
  - owner
  - follow_up_date
  - blocks
outputs: []
---

# task-flag-dependency

**Type:** Task (atomic primitive)
**Produces:** New entry under `## Dependencies` in `~/Documents/psilodigital/vault/delivery/open-loops.md`

## Inputs

- `client` — required
- `dependency` — required, one-line description of what we're waiting on
- `owner` — required: a specific person's name (not "client team" or "vendor")
- `follow_up_date` — required, YYYY-MM-DD
- `blocks` — required, what gets blocked if this dependency slips (milestone id, sprint goal, etc.)

## Procedure

1. **Open** `~/Documents/psilodigital/vault/delivery/open-loops.md`.
2. **Append** under `## Dependencies`.
3. **No vague owners.** Reject if `owner` is "the client", "the team", or similar. Require a name. If the user can't provide a name, escalate: "we don't have a named owner for this dependency — that's a risk."

## Entry Format

```markdown
- [ ] **<client>** | dependency: <dependency> | owner: <owner> | follow-up: <follow_up_date> | blocks: <blocks>
```

## Rules

- Owner must be a specific person, not a team.
- Follow-up date is mandatory.
- If the dependency slips past follow-up date, the next `op-status-update` must escalate.
- Resolution moves the entry via `task-update-open-loops`.
