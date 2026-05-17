# vault/templates

Reusable markdown templates for the artifacts agents produce. Skills reference these so output stays consistent across clients.

## Suggested templates

- `proposal.md` — proposal skeleton (mirrors `skills/proposal-writer.md` output)
- `scope.md` — scope skeleton
- `delivery-plan.md` — delivery plan skeleton
- `weekly-status.md` — weekly status update
- `meeting-prep.md` — discovery / pitch prep
- `meeting-notes.md` — post-meeting notes
- `change-request.md` — scope CR template
- `incident-report.md` — PsiloBooking incident template
- `audit-monthly.md` — PsiloBooking monthly audit template
- `nda-tracker.md` — list of clients with NDAs in place

## Rules

- **Templates are read-only at runtime.** Agents copy them into `vault/clients/<client>/` and edit there.
- **Keep them lean.** A template should be a useful skeleton, not a 30-page boilerplate.
- **Update them when patterns change.** If three projects in a row needed an extra section, add it.
