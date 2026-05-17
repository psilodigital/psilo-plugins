# Secrets Policy

## TL;DR

- **No secret ever lives in this repo.**
- `.env` is gitignored. Only `.env.example` ships.
- Real secrets live in the operator's local secret manager (1Password, macOS Keychain, doppler, Vercel env, etc.).
- Production secrets live in the hosting platform (Vercel / Fly / AWS Secrets Manager). They are not duplicated to laptops.

## Categories

| Category | Where it lives | Rotation |
|---|---|---|
| Personal agent keys (Anthropic, OpenAI, Gemini) | Operator's secret manager | Quarterly |
| Integration keys (Notion, Slack, Linear, HubSpot) | Operator's secret manager | Quarterly |
| Production keys (Stripe, Supabase service role, AWS) | Hosting platform secrets | Monthly or on incident |
| OAuth refresh tokens | Operator's secret manager, encrypted at rest | Every 90 days |

## Rules

1. **No secret in chat.** Don't paste keys into agent prompts. If a key is mentioned, the agent should refuse to repeat it.
2. **No secret in git.** Pre-commit hook recommended (`detect-secrets`, `gitleaks`).
3. **Per-environment.** Dev / staging / prod use distinct keys. No shared keys across envs.
4. **Least privilege.** Restricted scopes only. E.g. Stripe **restricted key** with reporting scope, not the live secret key.
5. **On compromise:** rotate immediately, run `scripts/audit-permissions.ts`, audit access logs, notify the team.
6. **Departures:** rotate any secret a departing operator had access to within 24 hours.

## What to do if you find a leaked secret

1. Rotate the key immediately.
2. Force-push the secret out of git history only if it's local. If pushed publicly, treat as compromised and rotate — never trust history rewriting alone.
3. File an incident note under `vault/products/psilobooking/incidents/` if production is affected.
