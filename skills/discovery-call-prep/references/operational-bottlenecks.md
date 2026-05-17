# Common Operational Bottlenecks (SMB)

A pattern library for hypothesizing where the pain probably is. Match the prospect's industry and visible signals to one or more patterns. Cite the pattern by name in the brief.

## How to use

1. Read the prospect's snapshot (industry, size, tools visible, channels).
2. Scan this file for matching patterns.
3. Pick 3–5 most plausible. Note the evidence and assign confidence.
4. Convert each into a discovery hypothesis with 5-Why questions.

---

## Booking / scheduling patterns

### B1. Fragmented booking sources
- **Signal:** They take bookings via website + OTA (Viator, GetYourGuide, TripAdvisor) + email + walk-up.
- **Likely pain:** Manual reconciliation, double-bookings, missed inquiries, no single calendar.
- **Probe:** "How do you know in real time what's available across channels?"

### B2. Manual availability management
- **Signal:** Reservations live in a spreadsheet or printed sheet. No channel manager.
- **Likely pain:** Stale availability, frequent over/under-bookings, weekend admin burden on owner.
- **Probe:** "Walk me through how you update availability after a booking."

### B3. Deposit / payment chaos
- **Signal:** Manual payment links, mixed gateways, cash on arrival, frequent refund disputes.
- **Likely pain:** Reconciliation pain, lost revenue, customer trust issues.
- **Probe:** "How long does it take you to close the books each week?"

### B4. No customer comms automation
- **Signal:** They manually send confirmations, reminders, post-trip thank-yous.
- **Likely pain:** Inconsistent experience, no-shows, missing review requests.
- **Probe:** "What does a customer hear from you between booking and the day of?"

## Internal operations patterns

### O1. Spreadsheet as system of record
- **Signal:** Critical data (clients, jobs, inventory) lives in one or many spreadsheets.
- **Likely pain:** Version conflicts, no audit trail, breakage when the "spreadsheet owner" is out.
- **Probe:** "If [owner] is sick tomorrow, what breaks first?"

### O2. WhatsApp / email as workflow engine
- **Signal:** Tasks live in chat threads. No tracker.
- **Likely pain:** Lost context, duplicate work, slow handoffs, on-call burnout.
- **Probe:** "Where do tasks get assigned, and how do you know when they're done?"

### O3. Onboarding / offboarding by tribal knowledge
- **Signal:** No written SOPs. New hires shadow existing staff for weeks.
- **Likely pain:** Slow ramp, inconsistent service, knowledge loss on churn.
- **Probe:** "How long until a new team member can run a shift without supervision?"

### O4. Manual invoicing and AR
- **Signal:** Invoices created in Word / Pages / Excel; followed up by hand.
- **Likely pain:** Late payments, lost invoices, mismatched VAT, owner doing collections.
- **Probe:** "How many days, on average, between sending an invoice and getting paid?"

### O5. No KPI visibility
- **Signal:** Owner answers "how was last month?" with a feeling, not a number.
- **Likely pain:** Late detection of problems, decisions made on vibes, hard to scale.
- **Probe:** "What's the first number you check on a Monday morning?"

## CRM / CMS / content patterns

### C1. No CRM (or unused CRM)
- **Signal:** Customer list lives in Mailchimp contacts, an inbox, or a spreadsheet.
- **Likely pain:** No segmentation, no repeat-customer marketing, missed referral opportunities.
- **Probe:** "Can you pull a list of repeat customers from the last 12 months right now?"

### C2. CMS that the team can't update
- **Signal:** Site is on a stale framework, or only the developer can change copy.
- **Likely pain:** Stale content, missed campaigns, dependency on external dev for trivial edits.
- **Probe:** "How long does it take to update a price or photo on the site?"

### C3. SEO + reviews neglect
- **Signal:** Site has thin content, no schema, no review aggregation.
- **Likely pain:** Reliance on OTAs that take 20–25% commission.
- **Probe:** "What % of your bookings come direct vs. through OTAs?"

## Tech / infra patterns

### T1. Vendor sprawl
- **Signal:** 10+ subscriptions visible (in job ads, footers, integrations).
- **Likely pain:** Overlapping spend, integration brittleness, security gaps.
- **Probe:** "Could you list every paid tool the business uses today? Off the top of your head."

### T2. One person holds the keys
- **Signal:** A single founder or contractor manages all tech.
- **Likely pain:** Bus factor, slow change, burnout, security risk.
- **Probe:** "If [name] left tomorrow, who could log into your hosting?"

### T3. Integrations held together by humans
- **Signal:** Data moves between systems via manual export/import.
- **Likely pain:** Latency, errors, hours per week of admin.
- **Probe:** "Tell me about the last time data moved between two tools — how did it get there?"

## People / decisions patterns

### P1. No clear decision maker
- **Signal:** Multiple stakeholders, no obvious owner of "this initiative."
- **Likely pain:** Long sales cycle, unclear success criteria, scope drift.
- **Probe:** "Who has the final yes on a project like this?"

### P2. Prior failed project trauma
- **Signal:** Hints of "we tried X before and it didn't work."
- **Likely pain:** Risk-aversion, defensive scope, distrust of external vendors.
- **Probe:** "What happened with the last system project you took on?"

### P3. Owner-operator bottleneck
- **Signal:** Founder still personally answers customer inquiries / approves bookings.
- **Likely pain:** Can't scale, no vacations, knowledge can't be delegated.
- **Probe:** "What's the last thing you'd ever delegate, and why?"

## Anti-patterns (when NOT to push)

- **"Just rebuild the website."** If their ops are fine and only the website is dated, that's a website project. Refer or scope narrowly. Don't manufacture an ops problem.
- **"They need AI."** AI is a tool, not a need. If there's no measurable pain, AI features will sit unused.
- **"More dashboards."** If they're not using the dashboards they have, more dashboards won't help.
- **Forced replacement of working tools.** If a spreadsheet works for 3 people, don't replace it because it offends you aesthetically.

## Industry quick-map

| Industry | Most common patterns |
|---|---|
| Tours / boats / experiences | B1, B2, B3, B4, C3 |
| Restaurants / hospitality | B2, O2, O5, C1 |
| Local services (clinics, salons, repair) | B2, B4, O1, O4 |
| Small agencies / studios | O1, O2, O4, T1, P3 |
| E-commerce SMB | T3, O5, C1, C3 |
| Professional services (legal, accounting) | O3, O4, T2, P1 |
| Property / rentals | B1, B3, B4, T3 |
