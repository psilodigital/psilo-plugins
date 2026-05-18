---
name: flow-research-client
type: flow
version: 0.1.0
status: active
risk_level: low
requires_approval: false
description: |
  Proposal-grade research on an existing client. Deeper than prospect research —
  focuses on operations maturity, data sources, team structure, prior tech decisions,
  and AI-readiness signals. Caches to _clients/<client>/research/.
user-invocable: false
called_by:
  - op-build-proposal
  - op-build-scope
calls:
  - task-flag-assumption
  - task-update-open-questions
inputs:
  - client_name
  - meeting_notes_path?
  - refresh?
outputs:
  - research_findings_file
---

# flow-research-client

**Type:** Flow (internal)
**Produces:** Research findings cached at `~/Documents/psilodigital/vault/_clients/<client>/research/<YYYY-MM-DD>-proposal-research.md`

## Inputs

- `client_name` — required
- `meeting_notes_path` — optional, defaults to `_clients/<client>/meeting-notes/`
- `refresh` — boolean, force a new research run even if recent exists (default: false)

## Procedure

1. **Read existing `_clients/<client>/overview.md`** and all meeting notes.
2. **Extract operations signals.** From notes and overview, map current state across:
   - Tools in use (CRM, booking, ERP, marketing, etc.)
   - Manual vs. automated processes
   - Where data lives and how it flows
   - Reporting cadence and consumers
   - Team size, roles, key-person dependencies
3. **Apply operations-levels framework.** Place each process on the manual → spreadsheet → SaaS → integrated → automated scale. Reference `_company/_shared/operations-levels.md`.
4. **AI-readiness signals.** Reference `_company/_shared/ai-readiness-framework.md`. Note: does data exist? Are processes codified? Is ownership clear? If readiness gaps exist, surface them — first engagement may be readiness, not AI.
5. **Augment with public signals.** Lightweight web check for recent press, hiring, leadership changes (less than sales' prospect research — assume sales has done that work; cross-link if available).
6. **Synthesize** into the output structure below.

## Output Structure

```yaml
client: <name>
research_date: <YYYY-MM-DD>
operations_map:
  tools:
    - {name: "...", category: "...", tag: verified|inferred}
  processes:
    - {name: "...", current_level: manual|spreadsheet|saas|integrated|automated, target_level: "...", gap_notes: "..."}
  data_flow:
    - {from: "...", to: "...", method: manual|export|api, frequency: "..."}
  reporting:
    - {report: "...", cadence: "...", consumer: "...", source: "..."}
team:
  size: <int|unknown>
  key_roles: [...]
  key_person_dependencies: [...]
ai_readiness:
  data_quality: high|medium|low|unknown
  process_codification: high|medium|low|unknown
  ownership_clarity: high|medium|low|unknown
  gating_blockers: [...]
public_signals:
  - {observation: "...", source: "...", date: "..."}
risks:
  - {risk: "...", severity: low|medium|high}
```

## Rules

- Cache to `_clients/<client>/research/` so subsequent ops don't re-research.
- Mark `tag: verified` only for facts directly observed in notes or public sources.
- Surface AI-readiness gaps prominently — they change the engagement scope.
- Never invent. If something is not known, mark `unknown`.
