---
name: op-build-proposal
type: op
version: 0.1.0
description: |
  Produce a full proposal draft for a named client. Orchestrates business analysis
  (current state → problem → outcome) and technical scope (capabilities, integrations,
  phases) into a single document with explicit assumptions, risks, and pricing
  placeholder. Triggers: "build a proposal for <client>", "draft proposal <client>",
  "write proposal for <client>".
user-invocable: true
called_by: []
calls:
  - flow-research-client
  - flow-build-scope
  - flow-draft-proposal
  - task-flag-assumption
  - task-update-open-questions
  - task-update-open-loops
inputs:
  - client_name
outputs:
  - proposal_file
  - scope_file
---

# op-build-proposal

**Cadence:** On-demand (after a discovery meeting, when enough scope context exists)
**Produces:** Proposal draft at `~/Documents/psilodigital/vault/proposals/00_current/<client>/proposal.md`

## What It Does

Generates a complete proposal draft. Coordinates the Business Analyst (current state + business case) and the Solution Architect (technical scope + phases) to produce a coherent document. Every claim is tagged as `verified`, `client-stated`, or `inferred`. Pricing is a placeholder; the human approves before sending.

## Procedure

1. **Resolve the client.** Verify `~/Documents/psilodigital/vault/_clients/<client>/overview.md` exists. If not, ask the user to provide a one-line description and prior meeting notes.
2. **Locate meeting notes.** Read all files in `_clients/<client>/meeting-notes/`. If none exist, ask the user to paste notes or proceed with overview only (flag scarcity as a high-severity assumption).
3. **Call `flow-research-client`** for deeper context (operations, data sources, team size, prior tech decisions). Skip if `_clients/<client>/research/` already has fresh material (<30 days old).
4. **Call `flow-build-scope`** to produce capabilities, data model, integrations, roles, and phases. Output saved to `00_current/<client>/scope.md`.
5. **Call `flow-draft-proposal`** to author the proposal sections. Output saved to `00_current/<client>/proposal.md`.
6. **For every assumption** surfaced during research, scope, or drafting, call `task-flag-assumption`.
7. **For every open question** that requires the client's input, call `task-update-open-questions`.
8. **Call `task-update-open-loops`** to move the prospect to stage `proposal-drafting`.

## Output Structure (proposal.md)

1. **Executive summary** (≤150 words)
2. **Current situation** — verified facts + observations
3. **Business challenges** — root causes, not symptoms; tagged with SME bottleneck pattern
4. **Desired outcomes** — client-stated + inferred (each tagged)
5. **Proposed solution** — narrative, business-language first
6. **Scope** — capabilities (MVP), data model, integrations, roles
7. **Out of scope** — explicit list
8. **Optional additions** — phase-2 candidates
9. **Phases and timeline** — weeks per phase, milestones
10. **Assumptions** — pulled from `open-loops.md` for this client
11. **Risks and dependencies**
12. **Investment placeholder** — range based on `proposals/config.md` anchors, not a final price
13. **Next steps**

## Calls

- **Flows:** `flow-research-client`, `flow-build-scope`, `flow-draft-proposal`
- **Tasks:** `task-flag-assumption`, `task-update-open-questions`, `task-update-open-loops`

## Vault Output

- `~/Documents/psilodigital/vault/proposals/00_current/<client>/proposal.md`
- `~/Documents/psilodigital/vault/proposals/00_current/<client>/scope.md`
- `~/Documents/psilodigital/vault/proposals/open-loops.md` (updated)
- `~/Documents/psilodigital/vault/_clients/<client>/research/` (if research run)

## Rules

- Do not invent client facts.
- Do not finalize pricing. Always use an investment placeholder.
- Do not promise integration feasibility — use `TBD-feasibility` flags.
- Business language first. Technical detail second.
- Apply Psilodigital tone of voice from `_company/tone-of-voice.md`.
- Save the draft. Do not send. Tell the user where to review.
