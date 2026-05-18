---
name: op-build-scope
type: op
version: 0.1.0
status: active
risk_level: low
requires_approval: false
description: |
  Produce a standalone MVP scope document for a client (when the full proposal is
  deferred — paid scoping engagement, or post-discovery technical alignment). Triggers:
  "scope <client>", "build MVP scope for <client>",
  "what would an MVP look like for <client>?".
user-invocable: true
called_by: []
calls:
  - flow-research-client
  - flow-build-scope
  - task-flag-assumption
  - task-update-open-questions
  - task-update-open-loops
inputs:
  - client_name
  - business_goal?
outputs:
  - scope_file
---

# op-build-scope

**Cadence:** On-demand
**Produces:** Scope document at `~/Documents/psilodigital/vault/proposals/00_current/<client>/scope.md`

## What It Does

Produces an MVP scope document independently of a full proposal. Used when the client has agreed direction and wants a technical scope before a commercial proposal, or when the engagement is a paid scoping deliverable.

## Procedure

1. **Resolve the client.** Verify context and meeting notes exist.
2. **Call `flow-research-client`** if no fresh research available.
3. **Call `flow-build-scope`** with output target `00_current/<client>/scope.md`.
4. **Flag assumptions and open questions** via the standard tasks.
5. **Call `task-update-open-loops`** to set stage to `scoping`.

## Output Structure

Same as the Scope section of `op-build-proposal`:
- Business goal
- MVP scope (capabilities)
- Out of scope
- User roles
- Core features
- Data model overview
- Integrations (with feasibility flags)
- Risks
- Assumptions
- Suggested phases

## Calls

- **Flows:** `flow-research-client`, `flow-build-scope`
- **Tasks:** `task-flag-assumption`, `task-update-open-questions`, `task-update-open-loops`

## Rules

- Prefer simple MVP scope. Avoid overengineering.
- Flag every integration whose feasibility is not verified.
- Do not include pricing — this is the scope document, not the commercial proposal.
