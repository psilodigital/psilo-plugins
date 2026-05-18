---
name: task-flag-assumption
type: task
version: 0.1.0
status: active
risk_level: low
requires_approval: false
description: |
  Atomic primitive. Appends an assumption flag to open-loops.md with severity and a
  recommended verification step. Used by any op or flow when something is inferred
  rather than directly observed — keeps assumptions auditable.
user-invocable: false
called_by:
  - op-prep-discovery-call
  - op-draft-outreach
  - op-write-followup
  - flow-research-prospect
  - flow-extract-meeting-notes
calls: []
inputs:
  - client
  - assumption
  - basis
  - severity
  - verification_step
outputs: []
---

# task-flag-assumption

**Type:** Task (atomic primitive — write to `open-loops.md`)
**Produces:** New entry in `~/Documents/psilodigital/vault/sales/open-loops.md`

## Inputs

- `client` — required
- `assumption` — required, one-line statement of the inferred fact
- `basis` — required, short reason the assumption was made
- `severity` — required: `low` | `medium` | `high`
  - `low` = safe to proceed, validate in passing
  - `medium` = validate before next step
  - `high` = must validate before sending any communication
- `verification_step` — required, concrete action to confirm or refute

## Procedure

1. **Open** `~/Documents/psilodigital/vault/sales/open-loops.md` (create if missing).
2. **Append** a new entry under the `## Assumptions` heading (create if missing) using the format below.
3. **Do not duplicate.** If an assumption with the same `client` + `assumption` text already exists, skip the write and return `duplicate: true`.

## Entry Format

```markdown
- [ ] **<client>** | severity: <severity> | assumed: <assumption>
  - basis: <basis>
  - verify by: <verification_step>
  - logged: <YYYY-MM-DD>
```

## Rules

- Never write the raw assumption text in any client-facing artifact. This file is internal.
- Severity tier guides downstream ops: `op-draft-outreach` blocks on `high`, `op-prep-discovery-call` annotates `medium+` in the brief.
- Resolution is handled by `task-update-open-loops` — this task only appends.
