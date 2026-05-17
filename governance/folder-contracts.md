# Folder Contracts

Each folder has a clear purpose.

## agents/

Role definitions. Do not put full procedures here.

## skills/

Reusable procedures. Do not put company facts here.

## vault/

Facts, context, templates, and references. Do not put execution logic here.

## workflows/

End-to-end business processes combining agents, skills, and context.

## governance/

Rules, boundaries, permissions, and review standards.

## mcp/

Connector specifications and future MCP configuration.

## env/

Environment examples and secret policies. No real secrets.

## scripts/

Deterministic helper scripts.

## prompts/

Bootstrap prompts for creating new parts of the system.

## outputs/

Generated work products. Usually not long-term source of truth.

## logs/

Execution/audit history. Be careful with sensitive data.

## apps/

Future web app/control plane.
