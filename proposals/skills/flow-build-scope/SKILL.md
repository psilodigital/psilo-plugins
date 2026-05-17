---
type: flow
called_by: [op-build-proposal, op-build-scope]
description: >
  MVP scope construction. Translates business requirements and research into a
  delivery-ready scope: capabilities, data model, integrations, roles, risks, and
  suggested phases. Defaults to a 4–8 week MVP unless the brief explicitly requires
  longer. Every integration is flagged for feasibility verification.
---

# flow-build-scope

**Type:** Flow (internal)
**Produces:** Scope document at `~/Documents/psilodigital/vault/proposals/00_current/<client>/scope.md`

## Inputs

- `client_name` — required
- `research_path` — required, path to research findings
- `meeting_notes_path` — required
- `business_goal` — required, one-sentence statement of what the engagement should achieve

## Procedure

1. **Read** research, meeting notes, `_company/services.md`, `_company/delivery-principles.md`, and `_company/_shared/ai-readiness-framework.md`.
2. **Identify the business goal** — refine the input statement if needed; quote the client where possible.
3. **Translate goals → system capabilities.** For each business outcome, list the minimum capabilities required. Keep MVP capability count ≤7.
4. **Separate MVP from later phases.** Anything not directly supporting the highest-value flow goes to "Optional additions" or "Phase 2".
5. **Identify integrations.** For each integration:
   - Does an API/connector exist?
   - What's the auth model?
   - What's the rate limit?
   - Is sandbox access available?
   - Flag as `verified` (we've confirmed) or `TBD-feasibility` (needs Solution Architect verification before send).
6. **Identify data entities.** ≤7 for MVP. Note the source of truth for each.
7. **Identify roles.** ≤5 for MVP. Minimum permission split.
8. **Identify risks and dependencies.** Both technical and operational.
9. **Suggest phases.** Default: 4–8 week MVP. Phase 2 candidates separately. Reference `_company/delivery-principles.md` for standard phasing patterns.
10. **Save** to `00_current/<client>/scope.md`.

## Output Structure

```markdown
# Scope — <client>

## Business goal
<one-sentence statement, quoted from client where possible>

## MVP scope
### Capabilities (≤7)
- ...

### Out of scope
- ...

### Data model
| Entity | Source of truth | Key relationships |
|---|---|---|

### Integrations
| System | Direction | API/connector | Feasibility |
|---|---|---|---|
| ... | inbound|outbound|bidirectional | verified|TBD-feasibility | ... |

### User roles (≤5)
| Role | Minimum permissions |
|---|---|

## Phases
| Phase | Weeks | Deliverables |
|---|---|---|
| MVP | 4–8 | ... |
| Phase 2 (optional) | ... | ... |

## Risks
- ...

## Dependencies
- ...

## Assumptions
<pulled from `open-loops.md` for this client>
```

## Rules

- MVP capability count ≤7; entity count ≤7; role count ≤5. Push extras to Phase 2.
- Every integration tagged `verified` or `TBD-feasibility` — never silent assumption.
- Do not include pricing.
- Do not assume API access exists. Flag explicitly.
- Avoid overengineering. Prefer the simplest scope that proves the highest-value flow.
