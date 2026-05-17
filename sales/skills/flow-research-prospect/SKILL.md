---
type: flow
called_by: [op-prep-discovery-call, op-draft-outreach]
description: >
  Public-signal research on a prospect company. Pulls website observations, review
  patterns, recent press/hiring signals, and obvious operational issues. Returns
  structured findings — never fabricates. Anything inferred is marked as inference.
---

# flow-research-prospect

**Type:** Flow (internal, called by ops)
**Produces:** Structured research findings returned to the calling op (and optionally cached at `_clients/<client>/research/<YYYY-MM-DD>-public-signals.md`)

## What It Does

Researches a prospect using public signals only. Does not access paid databases or private data unless an MCP connector is configured. Returns a structured object the calling op can use.

## Inputs

- `client_name` — required
- `website_url` — optional but strongly preferred
- `country_or_region` — optional, helps with localized signals
- `additional_known_context` — optional, anything the user provided

## Procedure

1. **Website scan.** If `website_url` provided, fetch the home, about, services/products, and pricing pages. Note: stack visible in source (Shopify, WordPress, custom), mobile responsiveness, booking/contact flow, language quality, last-update signals.
2. **Review patterns.** Search public review sources (Google Maps, Trustpilot, industry-specific) for review count, average rating, and 2–3 most common themes in negative reviews.
3. **Hiring signals.** Check LinkedIn jobs / careers page for open roles — what they're hiring for hints at where they're investing.
4. **Press signals.** Quick search for recent (last 12 months) press, funding announcements, leadership changes.
5. **Industry context.** What sector are they in? Read `_company/_shared/common-sme-bottlenecks.md` (if present) and note which patterns commonly apply to this sector.
6. **Synthesize.** Produce the output structure below. Every finding must be tagged as `verified` (directly observed) or `inferred` (reasonable interpretation).

## Output Structure

Returns to caller (as structured markdown or JSON):

```yaml
client: <name>
website: <url>
business_model: <one-line, tagged verified|inferred>
core_offering: <one-line, tagged>
public_signals:
  website_observations:
    - {observation: "...", tag: verified}
  review_patterns:
    - {observation: "...", source: "...", tag: verified}
  hiring_signals:
    - {observation: "...", source: "...", tag: verified}
  press:
    - {observation: "...", source: "...", date: "...", tag: verified}
observed_issues:
  - {issue: "...", evidence: "...", severity: low|medium|high}
inferences:
  - {inference: "...", basis: "...", confidence: low|medium|high}
sector_patterns:
  - {pattern: "...", source: "_company/_shared/common-sme-bottlenecks.md"}
```

## Rules

- Never fabricate. If a signal cannot be verified, omit it.
- Mark every finding as `verified` or `inferred`.
- Do not pay for or scrape behind login walls. Public signals only.
- Cache to `_clients/<client>/research/` if caller asks; otherwise return-only.
- If no website is provided and the user cannot supply one, return a minimal result and flag this as an open question via `task-flag-assumption`.
