# Delivery Vault Config

Fill in the fields below. Leave a field blank if it doesn't apply.

---

## Identity

your_name:
your_role:                    # e.g. Delivery Manager, Solution Architect, Founder
your_email:

---

## Delivery Defaults

default_milestone_weeks:      # default 2
default_sprint_weeks:         # default 2
default_status_cadence:       # weekly | biweekly
status_update_audience:       # client | internal | both
demo_required_per_milestone:  # yes | no (default yes)

---

## Tooling

issue_tracker:                # github | linear | jira | other
issue_tracker_url:
ci_provider:                  # github-actions | gitlab-ci | circleci | other
hosting_default:              # aws | gcp | azure | vercel | netlify | self-hosted | other
secret_manager:               # 1password | bitwarden | aws-secrets-manager | other

---

## Cost Awareness

infra_budget_per_engagement_monthly_eur:  # placeholder, e.g. 200
flag_if_over:                              # percentage, e.g. 80 (warn at 80% of budget)

---

## Active Engagements

# One line per active engagement; kept in sync with `open-loops.md`.
# Format: client | milestone | next_demo_date | health (green|yellow|red)
# Example: artway | M2 | 2026-06-04 | green
active_engagements:
  #
