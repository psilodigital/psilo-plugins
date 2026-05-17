# Proposals Vault Config

Fill in the fields below. Leave a field blank if it doesn't apply. This file is read by every proposals skill — complete it before running your first proposal.

---

## Identity

your_name:
your_role:
your_email:

---

## Pricing Anchors

# Placeholders only — final pricing always requires human approval.
typical_discovery_fee:        # e.g. €1500 fixed, or "free for qualified"
typical_mvp_range_low:        # e.g. 15000
typical_mvp_range_high:       # e.g. 45000
typical_engagement_weeks_low: # e.g. 6
typical_engagement_weeks_high:# e.g. 12
typical_payment_terms:        # e.g. 50% upfront, 50% on delivery
currency:                     # EUR | USD | GBP | …

---

## Proposal Defaults

default_validity_days:        # e.g. 30 (proposal validity)
default_acceptance_method:    # e.g. signed PDF, e-signature, email confirmation
include_optional_addons:      # yes | no — whether proposals show optional scope by default

---

## Service Catalog (used by op-build-proposal)

# Comma-separated service identifiers from _company/services.md
# Example: ai-readiness-assessment, ops-automation-sprint, custom-integration-build, ai-product-mvp
offered_services:

---

## Active Proposals

# One line per active proposal; the plugin keeps these in sync with `open-loops.md`.
# Format: client | stage | next_step | next_step_date
# Example: artway | drafting | review with solution architect | 2026-05-25
active_proposals:
  #
