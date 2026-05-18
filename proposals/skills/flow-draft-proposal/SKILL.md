---
name: flow-draft-proposal
type: flow
version: 0.1.0
status: active
risk_level: low
requires_approval: false
description: |
  Section-by-section proposal authoring. Takes business context, research findings,
  and a built scope; produces the proposal narrative with explicit assumptions and a
  pricing placeholder range. Applies Psilodigital tone strictly.
user-invocable: false
called_by:
  - op-build-proposal
calls:
  - task-flag-assumption
inputs:
  - client_name
  - scope_path
  - research_path
  - meeting_notes_path
outputs:
  - proposal_file
---

# flow-draft-proposal

**Type:** Flow (internal)
**Produces:** Proposal narrative at `~/Documents/psilodigital/vault/proposals/00_current/<client>/proposal.md`

## Inputs

- `client_name` — required
- `scope_path` — required, path to the scope.md produced by flow-build-scope
- `research_path` — required, path to research findings
- `meeting_notes_path` — required

## Procedure

1. **Read** the scope, research, meeting notes, `_company/positioning.md`, `_company/services.md`, `_company/tone-of-voice.md`, `_company/pricing-principles.md`, and `proposals/config.md`.
2. **Author each section** in the order defined by `_company/templates/proposal-template.md` (or fall back to the standard structure listed below).
3. **For each claim**, tag as `verified` (in research/notes), `client-stated` (quoted from client), or `inferred` (analyst interpretation).
4. **Pricing placeholder.** Use `proposals/config.md` anchors (`typical_mvp_range_low/high`, `currency`, `typical_engagement_weeks_low/high`) to produce a **range placeholder** with the explicit note "subject to final scope confirmation and Psilodigital approval." Never a single number.
5. **Apply tone strictly.** Re-read each section against `_company/tone-of-voice.md`. Remove hype words. Keep sentences short. Business language first.
6. **Save** to `00_current/<client>/proposal.md`.

## Standard Section Order

1. Executive summary (≤150 words)
2. Current situation
3. Business challenges
4. Desired outcomes
5. Proposed solution
6. Scope (summarize from scope.md, link to full document)
7. Out of scope
8. Optional additions
9. Phases and timeline
10. Assumptions
11. Risks and dependencies
12. Investment placeholder
13. Next steps

## Rules

- Every fact tagged.
- No hype. No "transformative". No "game-changing". No "leverage" as a verb.
- Pricing is always a range with a note. Never a single committed number.
- Save only. Do not send. Surface the file path to the user.
- If any required input is missing (no scope, no research, no notes), stop and request via the calling op.
