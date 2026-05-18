---
name: flow-design-cicd
type: flow
version: 0.1.0
description: |
  Produce a CI/CD pipeline definition with reversible deployments. Every build runs
  tests, lint, and security scan. Automatic rollback on health-check failure. No
  manual SSH-and-deploy. Returns the pipeline definition + deployment runbook.
user-invocable: false
called_by:
  - op-scope-to-delivery
calls:
  - task-flag-risk
inputs:
  - ci_provider
  - hosting_default
  - repo_url
outputs:
  - cicd_file
---

# flow-design-cicd

**Type:** Flow (internal)
**Produces:** `~/Documents/psilodigital/vault/delivery/00_current/<client>/devops/cicd.md`

## Inputs

- `ci_provider` — from `config.md` (github-actions | gitlab-ci | circleci | other)
- `hosting_default` — from `config.md`
- `repo_url` — required

## Procedure

1. **Pipeline stages.** Default: install → lint → test → build → security-scan → deploy-staging → smoke-test → manual-approval-to-prod → deploy-prod → health-check → rollback-on-fail.
2. **Branch strategy.** Default: main → staging deploy on merge; tag → prod deploy on tag.
3. **Health check.** Endpoint, expected response, timeout. Failure triggers rollback.
4. **Rollback.** Automatic for prod; one-command for staging.
5. **Security scan.** Choose tool by language (e.g. trivy for containers, npm audit for node).
6. **Secret injection.** Pull from secret manager at deploy time, never in repo.
7. **Write the pipeline definition and accompanying runbook.**

## Output Structure

```markdown
# CI/CD — <client>

## Provider
<ci_provider>

## Pipeline stages
1. Install dependencies
2. Lint
3. Test
4. Build
5. Security scan
6. Deploy to staging (on main branch)
7. Smoke test staging
8. Manual approval for production
9. Deploy to production (on tag)
10. Health check
11. Automatic rollback on health-check failure

## Branch strategy
- `main` → staging (on merge)
- `v*` tag → production (on tag)

## Health check
- Endpoint: `/health`
- Expected: 200 within 30s
- Failure action: automatic rollback to previous prod release

## Rollback
- Production: automatic on health-check failure
- Staging: `<one-command-rollback>`

## Security scan
- Tool: <tool>
- Severity threshold: high+ blocks deploy

## Secrets
- Source: <secret_manager>
- Injection: at deploy time, never in repo or CI logs

## Deployment runbook
1. Confirm staging health: ...
2. Create tag: `git tag v<n> && git push --tags`
3. Monitor pipeline: <link>
4. Confirm prod health: ...
5. Rollback (if needed): ...
```

## Rules

- No manual SSH-and-deploy. All deploys via the pipeline.
- Every deploy must be reversible.
- Secrets never in repo, never in CI logs.
- Health check is mandatory. No deploy without one.
- Security-scan failures block deploy at high+ severity.
