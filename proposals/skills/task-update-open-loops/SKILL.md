---
name: task-update-open-loops
type: task
version: 0.1.0
status: active
risk_level: low
requires_approval: false
description: |
  Atomic primitive. Single write point for the proposals plugin's open-loops.md.
  Upserts a proposal's stage and next step, or resolves it (accepted/lost/withdrawn).
  Never deletes — moves to Resolved Proposals.
user-invocable: false
called_by:
  - op-build-proposal
  - op-build-scope
calls: []
inputs:
  - operation
  - client
  - stage?
  - next_step?
  - next_step_date?
  - value_placeholder?
  - outcome?
outputs: []
---

# task-update-open-loops

**Type:** Task (atomic primitive)
**Produces:** Updated `~/Documents/psilodigital/vault/proposals/open-loops.md`

## Inputs (one operation per call)

### `upsert_proposal`
- `client` — required
- `stage` — required: `scoping` | `drafting` | `internal-review` | `client-review` | `negotiating` | `accepted` | `lost` | `withdrawn`
- `next_step` — required, one-line description
- `next_step_date` — required, YYYY-MM-DD
- `owner` — optional, defaults to user
- `value_placeholder` — optional, range from the proposal

### `resolve_proposal`
- `client` — required
- `outcome` — required: `accepted` | `lost` | `withdrawn`
- `note` — optional

## Procedure

1. **Open** `~/Documents/psilodigital/vault/proposals/open-loops.md` (create with section headings if missing: `## Active Proposals`, `## Assumptions`, `## Open Questions`, `## Resolved Proposals`, `## Resolved Questions`).
2. **For `upsert_proposal`**: insert or update under `## Active Proposals`.
3. **For `resolve_proposal`**: move the row from `## Active Proposals` to `## Resolved Proposals` with outcome timestamp.

## Row Format (Active Proposals)

```markdown
- [ ] **<client>** | stage: <stage> | next: <next_step> | by: <next_step_date> | owner: <owner> | value: <value_placeholder>
```

## Row Format (Resolved Proposals)

```markdown
- [x] **<client>** | outcome: <outcome> | <YYYY-MM-DD>
  - note: <note>
```

## Rules

- This is the only task that writes to `## Active Proposals` and `## Resolved Proposals`.
- Never delete — always move to `## Resolved Proposals`.
- Stage transitions are not enforced here; the calling op decides.
