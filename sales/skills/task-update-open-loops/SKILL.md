---
type: task
called_by: [op-prep-discovery-call, op-write-followup]
description: >
  Atomic primitive. Single write point for `open-loops.md`. Updates a prospect's stage,
  next step, and next-step date. Resolves assumptions when validated. Never directly
  edited by ops or flows — always goes through this task to keep the file consistent.
---

# task-update-open-loops

**Type:** Task (atomic primitive — write to `open-loops.md`)
**Produces:** Updated `~/Documents/psilodigital/vault/sales/open-loops.md`

## Inputs (one of the following operations)

### `upsert_prospect`
- `client` — required
- `stage` — required: `cold` | `outreach-sent` | `discovery-scheduled` | `discovery-completed` | `proposal-drafting` | `proposal-sent` | `negotiating` | `won` | `lost` | `nurture`
- `next_step` — required, one-line description
- `next_step_date` — required, YYYY-MM-DD
- `owner` — optional, defaults to user

### `resolve_assumption`
- `client` — required
- `assumption_text` — required, must match an existing assumption to resolve
- `resolution` — required: `confirmed` | `refuted` | `obsolete`
- `note` — optional, one-line explanation

## Procedure

1. **Open** `~/Documents/psilodigital/vault/sales/open-loops.md` (create with section headings if missing: `## Active Prospects`, `## Assumptions`, `## Resolved`).
2. For **`upsert_prospect`**:
   - If the client already has a row under `## Active Prospects`, update in place.
   - Otherwise append a new row.
3. For **`resolve_assumption`**:
   - Locate the matching assumption under `## Assumptions`.
   - Move it to `## Resolved` with timestamp and resolution.
   - Tick the checkbox.
4. **Never delete** entries — always move to `## Resolved` for audit.

## Active Prospects Row Format

```markdown
- [ ] **<client>** | stage: <stage> | next: <next_step> | by: <next_step_date> | owner: <owner>
```

## Resolved Entry Format

```markdown
- [x] **<client>** | <stage|assumption-text> → <resolution> | <YYYY-MM-DD>
  - note: <note>
```

## Rules

- This is the **only** task that writes to `open-loops.md` (besides `task-flag-assumption` which only appends to `## Assumptions`).
- Never delete history — always move to `## Resolved`.
- Stage transitions are not enforced here; the calling op decides the new stage.
- If `open-loops.md` is corrupted or unparseable, stop and report to the user. Do not overwrite.
