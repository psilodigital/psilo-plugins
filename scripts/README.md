# scripts/

Utility TypeScript scripts that support the agent system. These are **runnable helpers**, not application code.

## Conventions

- TypeScript. Run with `tsx` (`npx tsx scripts/<name>.ts`) or `bun`.
- Each script is a single file with a top-of-file header explaining purpose, inputs, and outputs.
- No script may write outside this repo unless it's documented and approved.
- No script may modify production. Use a separate ops repo for that.

## Index

| Script | Purpose | Risk |
|---|---|---|
| [sync-vault.ts](sync-vault.ts) | Sync vault content from / to Notion (or another KB) | R2 |
| [generate-proposal.ts](generate-proposal.ts) | Render a proposal from a markdown template + client folder | R1 |
| [audit-permissions.ts](audit-permissions.ts) | Audit configured MCP servers and report scopes | R1 |

## Adding a script

1. Add the file with a header docblock.
2. Add a row above.
3. If the script does anything destructive, add `--dry-run` as the default mode.
4. Add it to the agent's allowed list in `env/permissions.example.md` if agents should be able to run it.
