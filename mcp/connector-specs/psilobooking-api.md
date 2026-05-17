# PsiloBooking API — Connector Spec

Specification draft for the future MCP server that exposes PsiloBooking data to agents.

## Goals

- Read operational data safely.
- Power dashboards, summaries, and audits.
- Never expose customer PII to agent chat.
- Never take destructive action without explicit approval.

## Resources

| Resource | Description | Sensitivity |
|---|---|---|
| organizations | Operators using PsiloBooking | Internal |
| experiences | Tour/boat/service products | Internal |
| availability | Slots, capacity, schedules | Internal |
| bookings | Reservations, customer linkage | Confidential |
| invoices | Billing and payment records | Confidential |
| sources | Direct, OTA, walk-up source breakdown | Internal |
| widget-configs | Embedded widget settings | Internal |

## Tools

| Tool | Type | Notes |
|---|---|---|
| `availability.check` | read | Real-time availability for a window |
| `bookings.summarize` | read | Aggregated booking counts and revenue by period |
| `operator.report` | read | Monthly operator report (uptime, volume, sources) |
| `sources.performance` | read | Channel performance comparison |
| `booking.create` | write | Requires explicit operator approval per call |
| `booking.cancel` | write | Requires explicit operator approval per call |

## Authentication

- API key per operator, stored in environment variables.
- Read and write scopes split. Read-only key used by default.

## Constraints

- Rate limits: TBD by PsiloBooking backend.
- PII handling: customer names, emails, and phone numbers must not be returned in agent-visible responses without operator request.
- Audit: every write call is logged with timestamp, tool, operator, and approving user.

## Open questions

- Webhook support for real-time updates?
- Bulk export support for analytics?
- Field-level redaction policy for PII?
