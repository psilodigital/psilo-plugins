# Workflow: scope-to-delivery

**Goal:** Take a signed scope and turn it into a working delivery plan with milestones, owners, and a cadence.

## Trigger phrases

- "We just signed X — kick off delivery"
- "Build the delivery plan for X"
- "Replan X after the change request"

## Inputs

- Signed scope under `vault/clients/<slug>/scope/`
- Team availability (operator provides)
- Hard deadlines (operator provides)

## Steps

1. **Validate scope is signed.**
   - If draft, pause and confirm with operator.

2. **Run [skills/delivery-breakdown.md](../skills/delivery-breakdown.md).**
   - Produces `delivery/delivery-plan.md`.

3. **Risk register.**
   - Identify top 5 risks. Mitigation + trigger for each. Append to delivery plan.

4. **Decisions log.**
   - Initialize `delivery/decisions.md` with key decisions made in scoping.

5. **Cadence setup.**
   - Define internal standup, client check-in, and demo cadence.
   - If Linear / Notion MCP is connected, sync milestones (operator approval before write).

6. **Kickoff brief.**
   - Draft a 1-pager kickoff email for the client. Save to `communications/`. Do not send automatically.

## Output

```
vault/clients/<slug>/
├── delivery/
│   ├── delivery-plan.md
│   ├── decisions.md
│   └── status/
└── communications/<YYYY-MM-DD>-kickoff.md
```

## Done when

- Plan is broken into phases, each ending in a demoable outcome.
- Critical path is identified.
- Operator has approved cadence and kickoff message.

## Agents involved

- Delivery Manager (lead)
- Solution Architect (consulted)
