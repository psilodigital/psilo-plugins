# Skill: scope-builder

**Purpose:** Turn a problem statement and architecture sketch into a concrete, costable scope document.

## When to use

- Right after the Solution Architect finishes a high-level design.
- When converting a signed proposal into a working scope of work (SOW).
- When evaluating a change request against existing scope.

## Inputs

- Problem statement
- Architecture (components, integrations, data flow)
- Constraints (deadlines, budget, team size)
- Known unknowns

## Output

Save to `vault/clients/<client>/scope/<YYYY-MM-DD>-scope.md`.

```
# Scope — <Client> — <Project>

## Outcomes (what success looks like)
1. ...

## Capabilities in scope
| # | Capability | Description | Effort (S/M/L) |
|---|---|---|---|

## Capabilities NOT in scope
- ...

## Integrations
| System | Direction | Method | Owner of credentials |

## Data
- Sources:
- Destinations:
- Retention:
- PII / sensitivity class:

## Environments
- Dev:
- Staging:
- Prod:

## Acceptance criteria
For each outcome — how do we prove it works?

## Assumptions
- ...

## Change request rules
- Anything not listed here is a CR. CRs are sized in S/M/L and priced per `vault/company/rate-card.md`.

## Estimate
- S = 1–3 days
- M = 4–10 days
- L = 11–25 days
- Total range: X–Y days @ rate
```

## Process

1. Map each outcome to one or more capabilities. Capabilities are user-visible behaviours, not files or services.
2. For each capability, write a 1–2 sentence description and an effort size.
3. Be explicit about what is NOT included. If unsure, list it as out-of-scope.
4. Resolve unknowns into either assumptions ("we assume their POS exposes a REST API") or open questions.
5. Total the effort. Range, never single point.

## Guardrails

- **No vague scope items.** "Make it fast" is not in scope — define what fast means.
- **One owner per integration.** If we don't have credentials and can't get them, flag as a blocker.
- **Re-use, don't reinvent.** Check `vault/templates/` for prior scope structures.
