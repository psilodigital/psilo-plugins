# Skill: discovery-call-prep

**Purpose:** Produce a complete prep pack for a discovery or pitch call so Psilodigital walks in informed and asks the right questions.

## When to use

Any call where we need to understand a prospect's business before proposing a solution. Especially the first call.

## Inputs

- Client name
- Meeting time / attendees (if known)
- Meeting goal (discovery / re-pitch / scoping / follow-up)
- Existing research brief (from `client-research`)

## Output

Save to `vault/clients/<client>/meetings/<YYYY-MM-DD>-prep.md`.

```
# <Client> — Call Prep — <date>

## Meeting goal
(one sentence)

## Attendees
| Name | Role | Notes |

## What we already know
(condensed from research.md)

## Hypothesis
Our best guess at their problem and the value we could deliver.

## Discovery questions (ranked)
### Business
1. Walk me through how a booking happens today, from inquiry to post-trip.
2. What's the most frustrating part of your week?
3. How are you measuring success right now?

### Operations
1. Which tools do you actively use? Which do you wish you didn't?
2. Where do mistakes happen most often?
3. What's your team's tech comfort level?

### Commercial
1. What does success look like 12 months from now?
2. Have you looked at other solutions? What did you like / not like?
3. What's your budget posture — investment mode or pilot mode?

## What we will NOT pitch yet
- Specific tools
- Pricing
- Timeline

## Things to listen for
- Words they use for their customers, bookings, problems
- Existing investments we shouldn't replace
- Decision-making structure (who else needs to say yes)

## After the call
- Update `vault/clients/<client>/research.md`
- Draft follow-up email (skill: follow-up-email)
- If green light, run `proposal-generation` workflow
```

## Process

1. Read `vault/clients/<client>/research.md` (create via `client-research` if missing).
2. Confirm meeting goal and attendees with the operator.
3. Build hypothesis. Be specific — *"booking ops fragmentation across email + DM + spreadsheet"*, not "they have problems".
4. Tailor discovery questions to the hypothesis. Drop generic ones if we already know the answer.
5. Save prep pack and ask the operator if they want a printable version.

## Guardrails

- Don't suggest pricing or scope in this artifact.
- Don't pre-decide the solution.
