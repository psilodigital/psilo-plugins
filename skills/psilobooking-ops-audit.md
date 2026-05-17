# Skill: psilobooking-ops-audit

**Purpose:** Run a structured operational audit of PsiloBooking — uptime, performance, errors, cost, security, customer health.

## When to use

- Monthly cadence (recommended).
- After a major release.
- When a customer reports unusual behaviour.
- Before any pricing or SLA conversation.

## Inputs

- Time window (default: trailing 30 days)
- Access to: observability (logs, metrics), billing dashboards, customer list, error tracker, secrets vault metadata

## Output

Save to `vault/products/psilobooking/audits/<YYYY-MM>-audit.md`.

```
# PsiloBooking Audit — <month>

## Headline
- Uptime:
- p95 latency:
- Error rate:
- MRR / ARR snapshot:
- Active customers:

## Reliability
- Incidents (count + summary)
- p50 / p95 / p99 latency by key route
- Background job health

## Errors
- Top 10 errors (Sentry / equivalent)
- Any new error patterns

## Performance
- Slowest endpoints
- DB hot spots
- Query plan regressions

## Cost
- Monthly run cost: total + breakdown (hosting, DB, AI, comms)
- Cost per customer / per booking
- Anomalies vs last month

## Security
- Open advisories (npm audit / equivalent)
- Outstanding patches
- Secret rotation status
- Failed login / abuse signals

## Customer health
- Active / dormant / at-risk
- NPS or CSAT if collected
- Top feature requests
- Top complaints

## Action items (ranked)
| # | Action | Impact | Effort | Owner | Due |
```

## Process

1. Pull metrics for the window from the configured providers (see `mcp/configs/`).
2. Compare against the prior month — flag trends, not just absolute values.
3. Spot anomalies. One sentence each. Don't bury them.
4. Rank action items by impact × confidence ÷ effort.
5. Save audit. Open a tracker ticket for each P0/P1 action.

## Guardrails

- **Read-only.** This skill never modifies prod.
- **Aggregate, don't expose.** Customer-level data stays inside `vault/products/psilobooking/audits/` (private). Public summaries strip identifiers.
- **Sensitive data classification: Confidential.** See `governance/data-classification.md`.
