# Permissions (example)

Defines what the agent system is allowed to **read** and **write** per integration. Copy to `env/permissions.md` (gitignored) and adjust per environment.

Defaults are **read-only**. Writes are explicitly listed.

## Slack
- Read: yes (channels: `#leads`, `#delivery`, `#psilobooking-ops`)
- Write: drafts only — never auto-post
- DMs: never

## Notion
- Read: yes (workspace-wide)
- Write: limited to `Agent Outputs` database

## Linear
- Read: yes
- Write: create/update issues in projects assigned to active workflows

## HubSpot (or CRM)
- Read: contacts, deals, companies
- Write: notes only — no deal stage changes without operator approval

## Email (Gmail / MS365)
- Read: yes
- Send: never automatically — always draft only

## Calendar
- Read: yes
- Write: tentative invites only; never confirm without operator approval

## GitHub
- Read: all repos in `psilodigital/*`
- Write: branches and PRs; **never** push to `main` or merge

## Stripe
- Read: yes (restricted key, reporting scope only)
- Write: never

## Supabase / PsiloBooking DB
- Read: yes (read-only role)
- Write: blocked from the agent layer; ops scripts are out-of-band

## Filesystem (this repo)
- Read: anywhere
- Write: `vault/clients/*/drafts/`, `vault/clients/*/communications/`, `vault/products/psilobooking/audits/`
- Write requires confirmation: `vault/company/`, `vault/products/psilobooking/` (excluding audits)
