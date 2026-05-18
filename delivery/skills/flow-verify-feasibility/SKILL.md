---
name: flow-verify-feasibility
type: flow
version: 0.1.0
status: active
risk_level: low
requires_approval: false
description: |
  Verify an integration tagged TBD-feasibility in the proposal scope. Reads target
  docs, identifies auth model, rate limits, sandbox availability. Returns confirmed,
  confirmed-with-caveats, or blocker. Blockers stop the calling op.
user-invocable: false
called_by:
  - op-scope-to-delivery
calls:
  - task-flag-risk
inputs:
  - client_name
  - integration
  - required_capabilities
outputs:
  - feasibility_note_file
---

# flow-verify-feasibility

**Type:** Flow (internal)
**Produces:** Feasibility note at `~/Documents/psilodigital/vault/delivery/00_current/<client>/architecture/feasibility-<integration>.md`

## Inputs

- `client_name` — required
- `integration` — required, the system to verify (e.g. "HubSpot CRM", "Stripe payments")
- `required_capabilities` — required, what the integration needs to do (read contacts, write deals, etc.)

## Procedure

1. **Locate official API documentation** for the target system.
2. **Check each required capability** is available via API. If any is documented as "coming soon" or requires special access, flag.
3. **Identify auth model** — API key, OAuth, JWT, certificate, etc. Note any approval delays (e.g., HubSpot OAuth app review).
4. **Note rate limits** — requests/second, per-day quotas, throttling behavior.
5. **Check sandbox availability** — can we test without affecting production data?
6. **Identify gotchas** — common pitfalls from public docs or community knowledge.
7. **Classify**:
   - `confirmed` — all required capabilities work via API, auth is straightforward, sandbox available
   - `confirmed-with-caveats` — works but with material constraints (e.g., 1 req/sec is slow for a sync use case)
   - `blocker` — required capability not available, or auth flow incompatible with the engagement
8. **Write feasibility note** to `architecture/feasibility-<integration>.md`.

## Output Structure

```markdown
# Feasibility — <integration>

**Status:** confirmed | confirmed-with-caveats | blocker
**Verified:** <YYYY-MM-DD>

## Required capabilities
- [x|!] <capability>: <api endpoint or doc reference>

## Auth model
<description>

## Rate limits
- <limit>: <consequence for our use case>

## Sandbox
- Available: yes | no | request-required
- URL: <if available>

## Caveats / Gotchas
- ...

## Recommended approach
<paragraph>

## Blocker (if status = blocker)
<what's missing, recommended workaround>
```

## Rules

- Never claim `confirmed` without finding the specific endpoint in official docs.
- Surface blockers loudly; the calling op stops on any blocker.
- If documentation is poor, escalate as `confirmed-with-caveats` and note the documentation risk.
