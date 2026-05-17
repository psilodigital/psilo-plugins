# mcp/servers

This folder defines or references **MCP (Model Context Protocol) servers** that the agent system uses to talk to external tools — CRM, calendar, email, observability, Stripe, Linear, Notion, etc.

## Servers we plan to use (or already do)

| Server | Purpose | Status |
|---|---|---|
| `slack` | Team chat — read/post in approved channels | planned |
| `notion` | Vault sync, knowledge base | planned |
| `linear` | Task tracker for delivery | planned |
| `hubspot` (or alt CRM) | Pipeline, contacts, deals | planned |
| `stripe` | Revenue, customer billing (read-only by default) | planned |
| `sentry` / `axiom` | Observability for PsiloBooking | planned |
| `supabase` | DB & auth ops for PsiloBooking | planned |
| `gmail` / `ms365` | Email read + draft | planned |
| `gcal` / `outlook` | Calendar prep | planned |
| `github` | Code, PRs, issues | planned |

## Structure

For any custom MCP server we build, drop the source under `mcp/servers/<name>/`. For third-party servers we only consume, document the connection requirements here (no secrets).

## Rules

- **Never commit credentials.** All auth lives in env per `env/secrets-policy.md`.
- **Default read-only.** Write scopes require an explicit allowlist in `env/permissions.example.md`.
- **Per-runtime config:** Claude / Codex / Gemini consume MCP differently. See `mcp/configs/`.
