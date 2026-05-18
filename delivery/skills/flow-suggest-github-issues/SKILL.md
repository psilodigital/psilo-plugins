---
name: flow-suggest-github-issues
type: flow
version: 0.1.0
description: |
  Translate milestones into proposed GitHub issue structure — titles, labels,
  dependencies, milestones, acceptance criteria. Produces a draft file; never creates
  issues directly. Human reviews and creates (or uses GitHub MCP with per-issue approval).
user-invocable: false
called_by:
  - op-scope-to-delivery
calls: []
inputs:
  - milestones
  - repo_url
outputs:
  - issues_proposed_file
---

# flow-suggest-github-issues

**Type:** Flow (internal)
**Produces:** Proposed issues at `~/Documents/psilodigital/vault/delivery/00_current/<client>/issues-proposed.md`

## Inputs

- `milestones` — required, output from `flow-break-milestones`
- `repo_url` — required, target GitHub repo

## Procedure

1. **For each milestone**, decompose included capabilities into discrete tasks.
2. **For each task**, produce: title, body with acceptance criteria, labels, milestone, dependencies.
3. **Group by milestone** in the output file.
4. **Do not create issues automatically.** Output is a proposal.

## Output Structure

```markdown
# Proposed GitHub Issues — <client>

**Repo:** <repo_url>
**Generated:** <YYYY-MM-DD>

## Milestone M1 — <title>

### Issue: <title>
- **Labels:** type/feature, priority/p0, area/auth
- **Milestone:** M1
- **Depends on:** —
- **Body:**
  - Acceptance criteria:
    - [ ] ...
    - [ ] ...
  - Technical notes: ...

### Issue: <title>
...

## Milestone M2 — <title>
...
```

## Rules

- Title format: action verb + object ("Add user login", not "User login").
- Every issue has acceptance criteria as a checklist.
- Labels follow conventions: `type/*`, `priority/*`, `area/*`.
- Never create issues directly — propose only.
- If the GitHub MCP is configured and the user wants to create issues, the calling op handles that with per-issue approval.
