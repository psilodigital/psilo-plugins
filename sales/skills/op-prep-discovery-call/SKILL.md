---
name: op-prep-discovery-call
type: op
version: 0.1.0
description: |
  Produce a discovery meeting brief for a named prospect. Researches public signals,
  loads existing client context, applies the common-SME-bottlenecks lens, generates
  grouped discovery questions, and outputs a brief with explicit assumptions and risks.
  Triggers: "prep for discovery call with <client>", "prep me for <client> meeting",
  "discovery brief for <client>".
user-invocable: true
called_by: []
calls:
  - flow-research-prospect
  - task-classify-bottleneck
  - task-flag-assumption
  - task-update-open-loops
inputs:
  - client_name
  - website_url?
outputs:
  - discovery_brief_file
---

# op-prep-discovery-call

**Cadence:** On-demand (when a discovery meeting is scheduled or being prepared)
**Produces:** Meeting brief at `~/Documents/psilodigital/vault/sales/02_briefs/<YYYY-MM-DD>-<client>-discovery-brief.md`

## What It Does

Runs when the user asks to prep for a discovery call. The op orchestrates research, context loading, and brief generation. It does **not** invent prospect facts — anything not verified by public sources or existing client folder content is marked as an assumption or open question.

The op reads:
- `~/Documents/psilodigital/vault/_clients/<client>/overview.md` — existing client context (if any)
- `~/Documents/psilodigital/vault/_company/positioning.md` — Psilodigital positioning
- `~/Documents/psilodigital/vault/_company/services.md` — service catalog
- `~/Documents/psilodigital/vault/_company/tone-of-voice.md` — voice
- `~/Documents/psilodigital/vault/sales/config.md` — your settings and ICP
- (Optional) `_company/_shared/common-sme-bottlenecks.md` — bottleneck patterns

## Procedure

1. **Resolve the client.** Confirm the client name with the user if ambiguous. Check if `_clients/<client>/overview.md` exists; if not, ask the user for a one-line description before continuing.
2. **Call `flow-research-prospect`** with the client name and website (if known). Receive structured findings (business model, public signals, observed issues, hiring/press signals).
3. **Map symptoms to bottlenecks.** For each observed issue from research, call `task-classify-bottleneck` to map it to a known SME pattern.
4. **Separate facts from assumptions.** Anything not directly observable in research or already in `_clients/<client>/` is an assumption — call `task-flag-assumption` to write it to `open-loops.md`.
5. **Generate discovery questions** grouped by area: client communication, internal handoffs, data and reporting, key-person dependency, growth bottlenecks. Avoid solution-shaped questions ("would you like a CRM?"); use observation-shaped questions ("how do you currently handle X today?").
6. **Suggest opportunity areas** by pairing observed bottlenecks with relevant Psilodigital services from `_company/services.md`. Never overpromise — flag any service where feasibility depends on integrations we have not validated.
7. **Write the meeting brief** to `02_briefs/<YYYY-MM-DD>-<client>-discovery-brief.md` using the structure below.
8. **Call `task-update-open-loops`** to record the prospect's stage and the next step.

## Output Structure

The brief contains, in this order:

1. **Meeting objective** — single sentence
2. **Client summary** — 3–5 bullets of verified facts
3. **Current understanding** — short narrative paragraph
4. **Likely operational bottlenecks** — 3–7 items, each tagged with the SME pattern it matches
5. **Discovery questions** — grouped by area, 8–15 total
6. **Possible opportunity areas** — paired with services, with feasibility caveats
7. **Risks and assumptions** — explicit list with severity
8. **Recommended meeting angle** — one paragraph on how to open and frame the conversation

## Calls

- **Flows:** `flow-research-prospect`
- **Tasks:** `task-classify-bottleneck`, `task-flag-assumption`, `task-update-open-loops`

## Vault Output

- `~/Documents/psilodigital/vault/sales/02_briefs/<YYYY-MM-DD>-<client>-discovery-brief.md` — meeting brief
- `~/Documents/psilodigital/vault/sales/open-loops.md` — assumption flags and next-step entry

## Vault Paths

- Reads from: `~/Documents/psilodigital/vault/sales/` — own sub-vault
- Reads from: `~/Documents/psilodigital/vault/_company/` — shared Psilodigital context
- Reads from: `~/Documents/psilodigital/vault/_clients/<client>/` — shared client context
- Writes to: `~/Documents/psilodigital/vault/sales/02_briefs/` and `open-loops.md`

## Rules

- Do not jump to solutions in the brief — the meeting is for understanding, not selling.
- Do not invent prospect facts. Mark every claim as fact, observation, or assumption.
- Use business-friendly language first, technical second.
- Apply Psilodigital tone of voice: warm, concise, practical, non-pushy.
- Never recommend pricing in the brief — pricing comes after scope.
