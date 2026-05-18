---
name: op-write-followup
type: op
version: 0.1.0
description: |
  Generate a post-meeting follow-up email from raw meeting notes. Extracts decisions,
  next steps (with owner and date), and open questions. Triggers:
  "write follow-up for <client>", "post-meeting email <client>",
  "follow-up email after <client> call".
user-invocable: true
called_by: []
calls:
  - flow-extract-meeting-notes
  - task-flag-assumption
  - task-update-open-loops
inputs:
  - client_name
  - raw_notes?
outputs:
  - followup_draft_file
---

# op-write-followup

**Cadence:** On-demand (after a discovery, demo, or scoping meeting)
**Produces:** Follow-up draft at `~/Documents/psilodigital/vault/sales/02_briefs/<YYYY-MM-DD>-<client>-followup.md`

## What It Does

Turns raw meeting notes into a structured follow-up email. Captures what was discussed, decisions made, agreed next steps with owners and dates, and open questions that still need answers. The user reviews and sends — this op never sends directly.

## Procedure

1. **Locate meeting notes.** Check `~/Documents/psilodigital/vault/_clients/<client>/meeting-notes/` for the most recent file. If absent, ask the user to paste raw notes.
2. **Call `flow-extract-meeting-notes`** to structure the raw notes into: pain points, opportunities, decisions, next steps, open questions.
3. **Verify ownership and dates.** For each next step, confirm: who owns it (you, them, or both) and when (specific date, not "next week"). If unclear in notes, flag with `task-flag-assumption` and ask the user.
4. **Read `_company/tone-of-voice.md`** and `sales/config.md` for signature/CTA.
5. **Draft the follow-up** using the structure below. Keep ≤200 words in the email body.
6. **Save the draft** to `02_briefs/<YYYY-MM-DD>-<client>-followup.md`.
7. **Call `task-update-open-loops`** to update the prospect's stage and next step in `open-loops.md`.

## Output Structure

**Email body:**
- **Subject** — references the meeting topic, not "follow-up from our call"
- **Greeting + warm thanks (1 sentence)** — specific, not generic
- **Recap of decisions (2–4 bullets)** — what we agreed
- **Next steps (numbered list)** — who, what, when
- **Open question(s)** — anything that needs their input
- **Sign-off** — `outreach_signature`

**Separately in the artifact** (not in email):
- **What I assumed** — anything inferred from notes that should be validated
- **Internal-only items** — discussion points not for the customer

## Calls

- **Flows:** `flow-extract-meeting-notes`
- **Tasks:** `task-flag-assumption`, `task-update-open-loops`

## Vault Output

- `~/Documents/psilodigital/vault/sales/02_briefs/<YYYY-MM-DD>-<client>-followup.md`
- `~/Documents/psilodigital/vault/sales/open-loops.md` (updated)
- `~/Documents/psilodigital/vault/_clients/<client>/meeting-notes/` (structured version saved alongside raw)

## Rules

- Email body ≤200 words.
- Every next step has an owner and a specific date.
- Never promise pricing or feasibility not confirmed in the meeting.
- Tone: warm, concise, practical, non-pushy.
- Never send. Save to file and tell the user where to find it.
