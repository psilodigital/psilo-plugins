# Permissions (example)

Default scopes per connector. Copy and adapt per environment. Real scopes live outside this repo.

## GitHub
- Read: repos under `psilodigital/*`
- Write: drafts only — never push to `main`, never merge without approval

## Gmail
- Read: yes
- Write: drafts only — never send automatically

## Google Drive
- Read: yes (shared with Psilodigital account)
- Write: never modify client-shared files without approval

## Slack
- Read: approved internal channels
- Write: drafts only — never DM, never post without approval

## PsiloBooking
- Read: yes (read-only key)
- Write: blocked from agent layer; each write requires operator approval per call

## Filesystem (this repo)
- Read: anywhere
- Write: `outputs/`, `vault/clients/*/drafts/`, `logs/`
- Restricted: `vault/company/`, `vault/products/`, `governance/`, `env/`
