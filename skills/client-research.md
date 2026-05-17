# Skill: client-research

**Purpose:** Build a structured intel brief on a prospect or client before any meeting, proposal, or scoping work.

## When to use

- Before a discovery or pitch call
- When opening a new client folder under `vault/clients/`
- Before writing a proposal or scope
- When the team asks "what do we know about X?"

## Inputs

- Client name (required)
- Website / domain (if known)
- Source of intro (referral, inbound, outbound)
- Any docs the client already shared

## Output

Save to `vault/clients/<client>/research.md`.

```
# <Client> — Research Brief

## Snapshot
- Industry:
- Size (people / revenue if knowable):
- Location(s):
- Founded:
- Website:

## What they do
(2–3 sentences in plain language)

## Operating model
- How they make money:
- Who their customers are:
- Channels they sell through:
- Seasonality / volume patterns:

## Tech footprint (best effort)
- Public site stack:
- Tools we can see (booking, payment, CRM, etc.):
- Any APIs / integrations visible:

## People
| Name | Role | Notes |

## Likely pain (hypothesis)
- ...

## Why Psilodigital (hypothesis)
- ...

## Sources
- ...
```

## Process

1. Check `vault/clients/<client>/` for existing notes — don't duplicate.
2. Pull public info: website, LinkedIn, press, Google reviews.
3. For tour/boat/experience operators: check booking page, channel manager hints, review sites (TripAdvisor, GetYourGuide, Viator).
4. For SMB operations clients: check job ads (reveals stack), social, vendor footprint.
5. Mark every claim with a source. **No fabrication.** If unknown, write "Unknown".

## Guardrails

- Treat the research file as `Internal` per `governance/data-classification.md`.
- Never include passwords, scraped private data, or personal phone numbers.
- If the client provided NDA'd material, save it under `vault/clients/<client>/private/` (gitignored).
