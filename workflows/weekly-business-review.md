# Workflow: weekly-business-review

**Goal:** Once a week, generate a concise snapshot of Psilodigital's state — pipeline, delivery, PsiloBooking health, finances — so the team starts the week aligned.

## Trigger phrases

- "Run the WBR"
- "Weekly business review"
- "Monday brief"

## Inputs

- Time window (default: last 7 days)
- Connected MCPs: CRM, Linear, Slack, Stripe (read-only), observability

## Steps

1. **Pipeline snapshot.**
   - New leads, advanced deals, lost deals.
   - Top 3 open deals: status + next action + blocker.
   - Source: CRM if connected, else `vault/clients/` activity.

2. **Delivery snapshot.**
   - Per active client: milestone status (green/yellow/red), notable shipped, notable blocked.
   - Source: `vault/clients/*/delivery/` + Linear if connected.

3. **PsiloBooking health.**
   - Headline metrics from last week.
   - Any incidents.
   - Open P0/P1 items.
   - Source: most recent `vault/products/psilobooking/audits/` + observability MCP.

4. **Finance snapshot (lightweight).**
   - MRR / ARR snapshot if Stripe MCP is connected (read-only).
   - Outstanding invoices.
   - Cash runway note (operator may update manually).

5. **Open decisions.**
   - List anything across the business waiting on a person.
   - Each one: what, who, since when.

6. **Save to `vault/company/wbr/<YYYY-MM-DD>.md`.**

7. **Distribute (operator approval).**
   - Draft an internal Slack post.
   - Operator reviews and posts.

## Output

```
vault/company/wbr/<YYYY-MM-DD>.md
```

## Done when

- One page is enough to brief any team member who was offline.
- Every red status has an owner and a next action.
- Operator has approved the Slack post.

## Agents involved

- Delivery Manager (lead)
- Sales Strategist (pipeline section)
- DevOps Agent (PsiloBooking section)
