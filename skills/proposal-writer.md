# Skill: proposal-writer

**Purpose:** Draft a Psilodigital proposal that is honest, scoped, and easy to say yes to.

## When to use

After discovery is complete and we have:
- A research brief
- BA output (current state + opportunities)
- Either a draft architecture or a clear enough problem to scope

## Inputs

- Client name
- Project working title
- Problem statement (1–2 sentences)
- In-scope outcomes (from BA / SA)
- Out-of-scope items (explicit)
- Budget / timeline indicators from the client

## Output

Save to `vault/clients/<client>/proposals/<YYYY-MM-DD>-<title>.md`.

```
# Proposal — <Client> — <Project Title>

## The problem
(2–3 sentences in their words)

## What we'll build
- Outcome 1: ...
- Outcome 2: ...
- Outcome 3: ...

## How it works (plain language)
A short walkthrough — no jargon. One paragraph per outcome.

## What's included
- ...

## What's NOT included
- ...

## Phases & timeline
| Phase | Duration | Outputs | Payment milestone |
|---|---|---|---|
| Discovery & Design | 1–2 wks | ... | 30% |
| Build | 4–8 wks | ... | 50% |
| Launch & handover | 1–2 wks | ... | 20% |

## Investment
- One-time build: €X,XXX
- Monthly run cost (infra + maintenance): €XXX
- Optional support retainer: €XXX/mo

## Risks & assumptions
- ...

## Why Psilodigital
(1 short paragraph — concrete, not generic. Reference relevant prior work if any.)

## Next step
A single, clear next step (sign + 30% deposit, or a paid discovery sprint).
```

## Process

1. Read the BA + SA outputs from `vault/clients/<client>/`.
2. Use the client's language wherever possible.
3. Always include an explicit "NOT included" list — this is the most important section for scope discipline.
4. Phase the work. Default 3 phases. Each phase ends in something a non-technical operator can verify.
5. Investment must be a range or a fixed number — never "TBD".
6. Save draft, never send. Final send goes through human approval (`governance/approval-rules.md`).

## Guardrails

- **No fictional case studies.** Only reference work we've actually done. If unknown, ask the operator for examples.
- **No copy-paste from prior proposals** without checking it still applies.
- **Currency:** EUR by default unless context says otherwise.
- **Voice:** match `agents/sales-strategist.md` — direct, builder-led.
