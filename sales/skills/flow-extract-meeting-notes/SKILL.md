---
name: flow-extract-meeting-notes
type: flow
version: 0.1.0
description: |
  Structure raw meeting notes into pain points, opportunities, decisions, next steps
  (with owner and date), and open questions. Distinguishes what was said from what was
  inferred. Never invents agreements.
user-invocable: false
called_by:
  - op-write-followup
calls: []
inputs:
  - client_name
  - meeting_date
  - meeting_type
  - attendees?
  - raw_notes
outputs:
  - structured_meeting_summary
---

# flow-extract-meeting-notes

**Type:** Flow (internal, called by ops)
**Produces:** Structured meeting summary returned to caller and saved at `~/Documents/psilodigital/vault/_clients/<client>/meeting-notes/<YYYY-MM-DD>-structured.md`

## What It Does

Takes raw meeting notes (free-form text, possibly verbatim) and turns them into a structured object. Distinguishes verbatim quotes from inferences, and explicit decisions from things merely discussed.

## Inputs

- `client_name` — required
- `meeting_date` — required (YYYY-MM-DD)
- `meeting_type` — discovery | demo | scoping | check-in | other
- `attendees` — list of names and roles (optional but helpful)
- `raw_notes` — the freeform text to extract from

## Procedure

1. **Parse raw notes** into discrete statements.
2. **Classify each statement** as one of:
   - **Pain point** — something the client said is broken, slow, frustrating
   - **Opportunity** — something the client said they want, plan to do, or are exploring
   - **Decision** — a commitment made in the meeting (by them or by us)
   - **Next step** — an action with owner and date
   - **Open question** — something explicitly left unresolved
   - **Context** — useful background, not actionable
3. **For decisions and next steps**, verify both the owner and the timeline are present. If missing → flag as open question, do not fabricate.
4. **Preserve verbatim quotes** for key pain points and decisions (so the user can audit).
5. **Synthesize** into the output structure below.

## Output Structure

```yaml
client: <name>
meeting_date: <YYYY-MM-DD>
meeting_type: <type>
attendees:
  - {name: "...", role: "...", side: psilodigital|client}
pain_points:
  - {statement: "...", quote: "...", severity: low|medium|high}
opportunities:
  - {statement: "...", quote: "...", maturity: idea|exploring|planning}
decisions:
  - {decision: "...", owner: psilodigital|client|both, made_in_meeting: true|false}
next_steps:
  - {action: "...", owner: <name or side>, due: <YYYY-MM-DD|missing>}
open_questions:
  - {question: "...", needs_input_from: <name or side>}
context:
  - {note: "..."}
```

## Rules

- Never invent decisions, owners, or dates. If unclear in raw notes, route to `open_questions`.
- Preserve verbatim quotes for the highest-value items (top 3 pain points, all decisions).
- If raw notes are sparse (<10 lines), output a minimal structure and recommend asking the user for more detail before generating a follow-up.
- Save the structured version to `_clients/<client>/meeting-notes/` so subsequent skills can read it.
