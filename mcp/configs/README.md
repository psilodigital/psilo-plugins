# mcp/configs

Runtime-specific MCP wiring. Each runtime has its own way of registering MCP servers; we keep the shapes here so the team has a single place to update them.

## Suggested files

- `claude.example.json` — Claude Code MCP config shape
- `codex.example.json` — Codex MCP config shape
- `gemini.example.json` — Gemini CLI MCP config shape
- `mapping.md` — table of which servers are enabled per runtime

## Pattern

Each example file should reference env variables, never inline secrets:

```jsonc
{
  "mcpServers": {
    "linear": {
      "command": "npx",
      "args": ["-y", "@linear/mcp"],
      "env": { "LINEAR_API_KEY": "${LINEAR_API_KEY}" }
    }
  }
}
```

Real config lives outside this repo (in the operator's machine config directory). The `.example.json` files exist so an operator can copy + fill in.

## Rules

- **Mirror, don't duplicate.** Same server → same name across runtimes.
- **Document scopes** for each server in `mapping.md` (read-only vs. write).
- **Test config changes** locally before committing.
