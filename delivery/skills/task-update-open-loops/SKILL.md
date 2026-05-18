---
name: task-update-open-loops
type: task
version: 0.1.0
status: active
risk_level: low
requires_approval: false
description: |
  Atomic primitive. Single write point for the delivery plugin's open-loops.md.
  Upserts engagement status (milestone, sprint, health, demo date), or resolves
  engagements, risks, dependencies. Never deletes — moves to Resolved.
user-invocable: false
called_by:
  - op-scope-to-delivery
  - op-sprint-planning
  - op-status-update
calls: []
inputs:
  - operation
  - client
  - milestone?
  - sprint?
  - health?
  - next_demo_date?
  - outcome?
  - risk_text?
  - dependency_text?
  - resolution?
outputs: []
---

# task-update-open-loops

**Type:** Task (atomic primitive)
**Produces:** Updated `~/Documents/psilodigital/vault/delivery/open-loops.md`

## Inputs (one operation per call)

### `upsert_engagement`
- `client` — required
- `milestone` — required, current milestone id
- `sprint` — required, current sprint number
- `health` — required: `green` | `yellow` | `red`
- `next_demo_date` — required, YYYY-MM-DD
- `owner` — optional, defaults to user

### `resolve_engagement`
- `client` — required
- `outcome` — required: `delivered` | `paused` | `cancelled`
- `note` — optional

### `resolve_risk`
- `client` — required
- `risk_text` — required, must match an existing risk
- `resolution` — required: one-line outcome

### `resolve_dependency`
- `client` — required
- `dependency_text` — required, must match an existing dependency
- `resolution` — required: one-line outcome

## Procedure

1. **Open** `~/Documents/psilodigital/vault/delivery/open-loops.md` (create with headings if missing: `## Active Engagements`, `## Risks`, `## Dependencies`, `## Resolved`).
2. **For `upsert_engagement`**: insert or update under `## Active Engagements`.
3. **For `resolve_*`**: move the matched row to `## Resolved` with outcome and timestamp.
4. **Never delete history.**

## Active Engagement Row

```markdown
- [ ] **<client>** | milestone: <m> | sprint: <n> | health: <green|yellow|red> | next demo: <date> | owner: <owner>
```

## Resolved Row

```markdown
- [x] **<client>** | <type>: <text> → <resolution|outcome> | <YYYY-MM-DD>
```

## Rules

- Only entry point for writing to `## Active Engagements` and `## Resolved`.
- Health transitions tracked over time (don't overwrite silently).
- Never delete — always move.
