---
name: flow-break-milestones
type: flow
version: 0.1.0
status: active
risk_level: low
requires_approval: false
description: |
  Decompose approved scope capabilities into 2-week milestones, each with a demoable
  deliverable. Identifies inter-milestone dependencies. Default 4–8 week MVP.
user-invocable: false
called_by:
  - op-scope-to-delivery
calls: []
inputs:
  - scope_path
  - team_size
  - target_weeks_total?
outputs:
  - milestone_breakdown
---

# flow-break-milestones

**Type:** Flow (internal)
**Produces:** Milestone breakdown returned to caller, embedded in `delivery-plan.md`

## Inputs

- `scope_path` — required
- `target_weeks_total` — optional, default 6
- `team_size` — required (used for capacity rough-check)

## Procedure

1. **Read scope.md** — pull capabilities, data model, integrations, roles.
2. **Order capabilities** by value-first (highest-value flow first) and by dependency.
3. **Group into 2-week milestones.** Each milestone must have a demoable deliverable — a flow the client can interact with.
4. **For each milestone**, list: weeks, demoable deliverable, included capabilities, dependencies on prior milestones, owner.
5. **Sanity-check capacity.** Total estimated dev-days vs. team capacity over the timeframe — flag if oversubscribed.
6. **Return structured output.**

## Output Structure

```yaml
milestones:
  - id: M1
    weeks: 2
    demoable: "User can log in and see a list of bookings"
    capabilities: [auth, booking-list-view]
    dependencies: []
    estimated_dev_days: 8
    owner: <name|TBD>
  - id: M2
    weeks: 2
    demoable: "..."
    capabilities: [...]
    dependencies: [M1]
    estimated_dev_days: 9
    owner: ...
capacity_check:
  total_dev_days_estimated: 26
  team_capacity_dev_days: 24
  flag: oversubscribed | comfortable | tight
```

## Rules

- No milestone without a demoable deliverable.
- Default milestone length = 2 weeks. 3 weeks max in exceptional cases.
- Flag capacity oversubscription rather than silently squeeze.
- Order by value-first, never by technical preference.
