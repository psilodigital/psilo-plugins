---
name: flow-design-environments
type: flow
version: 0.1.0
description: |
  Produce an environment plan (dev/staging/prod) from scope and architecture. Includes
  cost estimates per environment, secret management approach, and access control. Flags
  if total infra cost exceeds the engagement budget anchor.
user-invocable: false
called_by:
  - op-scope-to-delivery
calls:
  - task-flag-risk
inputs:
  - scope_path
  - hosting_default
  - budget_monthly_eur?
outputs:
  - environments_file
---

# flow-design-environments

**Type:** Flow (internal)
**Produces:** `~/Documents/psilodigital/vault/delivery/00_current/<client>/devops/environments.md`

## Inputs

- `scope_path` — required
- `hosting_default` — from `config.md` (aws | gcp | vercel | etc.)
- `budget_monthly_eur` — optional, from `config.md`

## Procedure

1. **Read scope** — identify components (web, api, db, jobs, storage).
2. **Define dev** — local-only or shared cloud dev? Default: local + cloud db sandbox.
3. **Define staging** — mirrors prod at smaller scale.
4. **Define prod** — production-grade with backups, monitoring, audit logs.
5. **Estimate cost** per environment per month, using the hosting provider's pricing tiers.
6. **Define secret management** — secret manager per `config.md`; never in repo.
7. **Define access control** — least-privilege, IAM per role.
8. **Flag cost** if total monthly > budget threshold.

## Output Structure

```markdown
# Environments — <client>

## Dev
- **Where:** local + <cloud db sandbox>
- **Components:** ...
- **Cost (monthly):** <€>

## Staging
- **Where:** <provider>
- **Components:** ...
- **Cost (monthly):** <€>
- **Mirrors prod:** at smaller scale

## Production
- **Where:** <provider>
- **Components:** ...
- **Cost (monthly):** <€>
- **Backups:** daily, restored quarterly
- **Monitoring:** ...
- **Audit logs:** on

## Total monthly cost: <€>
## Budget: <€> | Status: under | at | over (<%>)

## Secret management
- Provider: <secret_manager>
- Rules: no secrets in repo, no secrets in chat, rotate on incident

## Access control
- Roles: ...
- IAM model: least-privilege
```

## Rules

- Cost estimates include all assumptions (instance size, traffic, storage tier).
- Production always has backups + monitoring + audit logs.
- Flag over-budget loudly. Do not silently overspend.
- Secrets never in repo, never in this file.
