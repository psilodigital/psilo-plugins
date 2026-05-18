---
name: task-flag-assumption
type: task
version: 0.1.0
description: |
  Atomic primitive. Appends an assumption flag to the proposals plugin's open-loops.md
  with severity and verification step. High-severity assumptions block proposal send.
user-invocable: false
called_by:
  - op-build-proposal
  - op-build-scope
  - flow-research-client
  - flow-draft-proposal
  - flow-build-scope
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
**Produces:** New entry in `~/Documents/psilodigital/vault/proposals/open-loops.md`

## Inputs

- `client` — required
- `assumption` — required, one-line statement of the inferred fact
- `basis` — required, short reason the assumption was made
- `severity` — required: `low` | `medium` | `high`
  - `low` = safe to proceed, validate in passing
  - `medium` = validate before sending the proposal
  - `high` = must validate before sending; pricing or scope depends on this
- `verification_step` — required, concrete action to confirm or refute

## Procedure

1. **Open** `~/Documents/psilodigital/vault/proposals/open-loops.md` (create if missing).
2. **Append** under the `## Assumptions` heading (create if missing).
3. **Do not duplicate.** If an identical assumption for the same client already exists, skip and return `duplicate: true`.

## Entry Format

```markdown
- [ ] **<client>** | severity: <severity> | assumed: <assumption>
  - basis: <basis>
  - verify by: <verification_step>
  - logged: <YYYY-MM-DD>
```

## Rules

- High-severity assumptions block proposal send. The `op-build-proposal` op must surface all `high` items in the proposal's "Assumptions" section.
- Resolution is handled by `task-update-open-loops` — this task only appends.
- Assumptions about pricing or commercials are always at least `medium`.
