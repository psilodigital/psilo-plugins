# Workflow: client-meeting-prep

**Goal:** Walk into any client meeting fully prepared in under 30 minutes of agent + 10 minutes of operator review.

## Trigger phrases

- "Prep me for the call with X"
- "I have a meeting with X tomorrow"
- "Pre-call brief on X"

## Inputs

- Client name (required)
- Meeting date/time (optional but useful)
- Meeting goal (discovery / pitch / follow-up / scoping / status / renewal)

## Steps

1. **Locate or create client folder.**
   - If `vault/clients/<slug>/` doesn't exist, create it.

2. **Run [skills/client-research.md](../skills/client-research.md).**
   - Output: `research.md`.
   - Skip if already up to date.

3. **Run [skills/discovery-call-prep.md](../skills/discovery-call-prep.md)** (or its pitch / status / renewal variant).
   - Output: `meetings/<YYYY-MM-DD>-prep.md`.

4. **(Optional) Pull last touchpoint.**
   - From email / CRM / Slack via MCP if configured.
   - Surface anything they're still waiting on from us.

5. **Surface decisions to make.**
   - List anything the operator must decide before the call (e.g. price posture, scope guardrails).

6. **Summarize for the operator.**
   - One screen of text. Link the prep file. Flag anything unusual.

## Output

```
vault/clients/<slug>/
├── research.md                         (created or updated)
└── meetings/<YYYY-MM-DD>-prep.md       (new)
```

## Done when

- Operator has a written prep pack to skim.
- Top 5 discovery / pitch questions are tailored to the prospect.
- All open commitments from prior meetings are flagged.

## Agents involved

- Sales Strategist (lead)
- Business Analyst (if scoping / discovery)
