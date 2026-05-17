# Skill: delivery-breakdown

**Purpose:** Break a scope document into milestones, tasks, and a working plan the team can execute against.

## When to use

- After a scope is signed.
- When kicking off build phase of a project.
- When replanning after a slip or change request.

## Inputs

- Signed scope document
- Team availability (who, what % time, when)
- Hard deadlines (events, season, marketing tie-ins)
- Existing tracker (Linear / Notion / etc.)

## Output

Save to `vault/clients/<client>/delivery/delivery-plan.md` and mirror tasks into the client's tracker.

```
# Delivery Plan — <Client> — <Project>

## Phases

### Phase 1 — <name>
- Goal:
- Duration:
- Exit criteria:
- Milestones:
  - M1.1 ...
  - M1.2 ...

### Phase 2 — <name>
...

## Task breakdown
| ID | Phase | Task | Owner | Estimate | Depends on | Status |
|---|---|---|---|---|---|---|

## Critical path
List the chain of tasks that determine the end date.

## Risks
| Risk | Likelihood | Impact | Mitigation | Trigger |

## Cadence
- Internal standup: <day/time>
- Client check-in: <day/time>
- Demo: end of each phase

## Definition of done (per task)
- Code reviewed
- Tests added where reasonable
- Deployed to staging
- Verified by operator
```

## Process

1. Read scope. Group capabilities into phases — each phase should ship something usable.
2. Decompose each capability into tasks. Target 0.5–2 day tasks. Bigger tasks hide risk.
3. Identify dependencies. Anything cross-team or external goes first.
4. Identify the critical path. Slack everywhere else.
5. Pre-populate the risk register with the obvious ones (vendor APIs, data quality, stakeholder availability).
6. Set cadence. Default: weekly client check-in, daily async internal.

## Guardrails

- **Don't over-plan past Phase 2.** Replan after each phase.
- **No single point of failure** on critical path tasks — pair on the risky stuff.
- **Client visibility:** demo at end of each phase. Always.
