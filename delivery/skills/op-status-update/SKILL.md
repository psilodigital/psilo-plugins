---
name: op-status-update
type: op
version: 0.1.0
status: active
risk_level: low
requires_approval: false
description: |
  Generate a weekly status update from sprint progress. Summarizes what shipped,
  what's next, risks (with one-line plans), and decisions needed. Client-facing and
  optionally internal versions. Triggers: "status update for <client>",
  "weekly update <client>", "write the <client> status report".
user-invocable: true
called_by: []
calls:
  - task-flag-risk
  - task-update-open-loops
inputs:
  - client_name
  - sprint_progress_notes?
outputs:
  - status_update_file
---

# op-status-update

**Cadence:** Weekly (or per `status_cadence` in `config.md`)
**Produces:** Status update at `~/Documents/psilodigital/vault/delivery/00_current/<client>/status-updates/<YYYY-MM-DD>.md`

## Procedure

1. **Locate the active delivery plan and current sprint plan.**
2. **Ask the user for sprint progress** since last update: what shipped, what's blocked, decisions needed. Optionally read demo notes or commit summary if available.
3. **Compare against the milestone** — are we on track?
4. **Pull active risks and dependencies** from `open-loops.md`.
5. **Compose status** in the format below — keep ≤half a page.
6. **Apply tone** from `_company/tone-of-voice.md` — direct, no status-theater.
7. **Save** and surface file path to user.

## Output Structure (client-facing)

```markdown
# Status Update — <client>
**Week ending:** <YYYY-MM-DD>
**Milestone:** <M-n> | **Sprint:** <sprint-n> | **Health:** green | yellow | red

## What shipped this week
- ...

## What's next
- ...

## Decisions needed from you
- ...

## Risks
- <risk>: <one-line plan>

## Upcoming demo
- Date: <YYYY-MM-DD> | Contents: <one sentence>
```

If `status_update_audience` in config is `internal` or `both`, also produce an internal-only section with: team morale notes, technical debt observations, lessons learned.

## Calls

- **Tasks:** `task-flag-risk`, `task-update-open-loops` (refresh next-step date)

## Rules

- Half a page or less for client-facing.
- Quantify everything possible. "3 of 5 user flows shipped" beats "good progress".
- Risks always paired with a one-line plan.
- Never fabricate progress. If unsure what shipped, ask the user before writing.
