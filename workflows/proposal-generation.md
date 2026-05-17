# Workflow: proposal-generation

**Goal:** From a completed discovery, produce a proposal Psilodigital is proud to send.

## Trigger phrases

- "Draft a proposal for X"
- "Write up the proposal we discussed"
- "Send X our pitch for the booking system"

## Inputs

- Client folder under `vault/clients/<slug>/`
- Discovery notes (in `meetings/`)
- Optional: rough budget signal, deadlines, decision-makers

## Steps

1. **Confirm we have the basics.**
   - Research brief exists.
   - Discovery notes exist.
   - If anything is thin, pause and surface what's missing.

2. **Run BA pass.**
   - Use [agents/business-analyst.md](../agents/business-analyst.md) to extract current state + opportunities into `analysis/`.

3. **Run SA pass.**
   - Use [agents/solution-architect.md](../agents/solution-architect.md) to draft architecture into `architecture/`.

4. **Build scope.**
   - Use [skills/scope-builder.md](../skills/scope-builder.md) → `scope/`.

5. **Draft proposal.**
   - Use [skills/proposal-writer.md](../skills/proposal-writer.md) → `proposals/<YYYY-MM-DD>-<title>.md`.
   - Pricing: pull from `vault/company/rate-card.md` if present, else flag for operator.

6. **Internal review.**
   - Summarize delta vs. typical proposal: scope size, price, risk.
   - Flag anything the operator should double-check (assumptions, ranges, integrations).

7. **Operator approval gate.**
   - **Do not send.** Surface a clear link + checklist.

## Output

```
vault/clients/<slug>/
├── analysis/
├── architecture/
├── scope/
└── proposals/<YYYY-MM-DD>-<title>.md
```

## Done when

- Proposal is drafted with no `TBD` left.
- Pricing is a number or range, not a placeholder.
- Operator has reviewed and either sent it, edited it, or sent it back with notes.

## Agents involved

- Sales Strategist (lead)
- Business Analyst
- Solution Architect
