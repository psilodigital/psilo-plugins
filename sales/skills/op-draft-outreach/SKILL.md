---
name: op-draft-outreach
type: op
version: 0.1.0
description: |
  Draft cold or warm outreach (email or LinkedIn) to a prospect. Anchors on a specific
  observation, applies Psilodigital tone (warm, concise, ≤120 words for cold), proposes
  a single concrete next step. Triggers: "draft outreach to <client>",
  "write a cold email to <client>", "warm intro to <client>".
user-invocable: true
called_by: []
calls:
  - flow-research-prospect
  - task-flag-assumption
inputs:
  - client_name
  - outreach_type
  - connection_detail?
outputs:
  - outreach_draft_file
---

# op-draft-outreach

**Cadence:** On-demand
**Produces:** Outreach draft at `~/Documents/psilodigital/vault/sales/02_briefs/<YYYY-MM-DD>-<client>-outreach.md`

## What It Does

Generates a cold or warm outreach draft tailored to the prospect. The draft is anchored on a **specific observation** (not a generic compliment) and proposes a **single concrete next step** (typically a 15-min call). The user reviews and sends — this op never sends directly.

## Procedure

1. **Confirm outreach type.** Ask: cold (no prior touchpoint) or warm (referral, prior contact, event)? If warm, ask for the connection detail.
2. **Resolve the client.** Same as `op-prep-discovery-call` — read `_clients/<client>/overview.md` or ask for a one-line description.
3. **Call `flow-research-prospect`** to surface 1–2 specific observable signals (mobile site issue, recent hire, recent press, review patterns).
4. **Read `_company/tone-of-voice.md`** and apply it strictly. No hype words.
5. **Read `sales/config.md`** for `outreach_signature`, `outreach_cta_default`, `outreach_calendar_link`.
6. **Draft the message** following the structure below. Cold: ≤120 words. Warm: ≤180 words.
7. **Add a "what I assumed" note** at the end of the artifact (not in the email body) so the user can challenge before sending.
8. **Save the draft** to `02_briefs/<YYYY-MM-DD>-<client>-outreach.md`.

## Output Structure (cold email)

- **Subject** — 5–8 words, plain-text style, no clickbait
- **Greeting** — first name only
- **Hook (1 sentence)** — specific observation from research
- **Bridge (1–2 sentences)** — connect observation to a possible angle, no pitch
- **Ask (1 sentence)** — single concrete next step (use `outreach_cta_default`)
- **Sign-off** — `outreach_signature`

Then, separately in the artifact (not part of the email):
- **What I assumed** — short list of inferences the user should validate

## Output Structure (warm outreach)

Same skeleton, but the hook is the **connection** ("Maria mentioned you're scoping…"), not the observation.

## Calls

- **Flows:** `flow-research-prospect`
- **Tasks:** `task-flag-assumption` (for anything inferred but not verified)

## Vault Output

- `~/Documents/psilodigital/vault/sales/02_briefs/<YYYY-MM-DD>-<client>-outreach.md`

## Rules

- Cold ≤120 words; warm ≤180 words.
- Never claim integration feasibility we haven't verified.
- Never include pricing.
- Single concrete next step — no menus, no "or whichever works".
- Tone: warm, concise, practical, non-pushy. No hype.
- Never send the message. Save to file and tell the user where to find it.
