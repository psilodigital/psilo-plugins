# Sales Vault Config

Fill in the fields below. Leave a field blank if it doesn't apply. This file is read by every sales skill — complete it before running your first brief.

---

## Identity

your_name:
your_role:                    # e.g. Founder, Sales Lead, Account Executive
your_email:
your_calendar_link:           # URL for self-serve meeting booking

---

## ICP (Ideal Customer Profile)

icp_industries:               # comma-separated, e.g. healthcare, hospitality, professional services
icp_company_size_min:         # employees, e.g. 5
icp_company_size_max:         # employees, e.g. 200
icp_geographies:              # countries or regions, comma-separated
icp_must_have:                # comma-separated signals, e.g. existing CRM, online booking, recurring revenue
icp_disqualifier:             # comma-separated, e.g. pre-revenue, enterprise-only, regulated industries we don't serve

---

## Outreach

outreach_signature:           # one-line signature, e.g. "Andre — Psilodigital"
outreach_cta_default:         # e.g. "15-min call this week or next?"
outreach_calendar_link:       # link to share for self-serve booking
linkedin_profile_url:

---

## Pricing Anchors

# Placeholders only — do not commit to a price without explicit approval.
typical_discovery_fee:        # e.g. €1500 fixed, or "free for qualified"
typical_mvp_range_low:        # e.g. 15000
typical_mvp_range_high:       # e.g. 45000
typical_engagement_weeks_low: # e.g. 6
typical_engagement_weeks_high:# e.g. 12

---

## Active Prospects

# One line per active prospect; the plugin will keep these in sync with `open-loops.md`.
# Format: client_id | stage | next_step | next_step_date
# Example: artway | discovery-scheduled | prep meeting brief | 2026-05-22
active_prospects:
  #

---

## Tools

crm:                          # e.g. HubSpot, Pipedrive, Close, none
crm_url:
calendar_provider:            # google | outlook | other
email_provider:               # gmail | outlook | other
