# Core SME Ops Pack

`core-sme-ops` is the first official Psilodigital pack: a reusable bundle for small and medium-sized business operations work across sales, discovery, proposals, scope, delivery planning, and follow-up.

Clients should be able to think in terms of one installable capability:

> Install the SME operations pack.

## Included Agents

| Pack name | Source | Purpose |
|---|---|---|
| `sales-strategist` | `sales/agents/sales-strategist.md` | Prospect research, discovery prep, outreach, and follow-up drafts. |
| `business-analyst` | `proposals/agents/business-analyst.md` | Turns messy client context into clear business understanding. |
| `solution-architect` | `proposals/agents/solution-architect.md` | Converts needs into feasible MVP scope and flags integration assumptions. |
| `delivery-planner` | `delivery/agents/delivery-manager.md` | Pack-facing alias for delivery planning, milestones, sprints, and status cadence. |

## Included Skills

| Pack name | Source | Purpose |
|---|---|---|
| `client-research` | `proposals/skills/flow-research-client/SKILL.md` | Research and structure client context. |
| `discovery-call-prep` | `sales/skills/op-prep-discovery-call/SKILL.md` | Prepare a discovery meeting brief. |
| `proposal-writer` | `proposals/skills/flow-draft-proposal/SKILL.md` | Draft a proposal from research, notes, and scope. |
| `scope-builder` | `proposals/skills/flow-build-scope/SKILL.md` | Build an MVP scope from business goals and notes. |
| `delivery-breakdown` | `delivery/skills/flow-break-milestones/SKILL.md` | Break approved scope into delivery milestones. |
| `follow-up-email` | `sales/skills/op-write-followup/SKILL.md` | Draft a post-meeting follow-up email. |

## Included Workflows

| Workflow | Steps | Outcome |
|---|---|---|
| `client-meeting-prep` | `client-research` -> `discovery-call-prep` | Discovery brief with facts, assumptions, risks, and questions. |
| `proposal-generation` | `client-research` -> `scope-builder` -> `proposal-writer` | Proposal draft and MVP scope. |
| `scope-to-delivery` | `scope-builder` -> `delivery-breakdown` | Delivery milestones from approved scope. |

## Versioning

Current version: `0.1.0`.

Pack versions use semantic-ish versioning:

- `0.1.0` = first experimental version
- `0.2.0` = new skills, workflows, agents, or pack aliases
- `0.2.1` = fixes, documentation improvements, source mapping corrections, or prompt improvements that do not change the pack contract
- `1.0.0` = stable client-ready pack

See [CHANGELOG.md](CHANGELOG.md) before updating an installed pack, especially if a client has local overrides.

## Boundaries

This pack does not send communications, create external issues, change client systems, or claim integration feasibility without human approval. It drafts, structures, and plans; the human reviews and approves external actions.

The pack is metadata only. Source agents and skills remain in their plugin folders, and sensitive company or client context still lives in the external user vault.
