/**
 * audit-permissions.ts
 *
 * Purpose: Inspect configured MCP servers and report the scopes each one
 *          actually has access to. Compares against env/permissions.example.md
 *          and flags drift.
 *
 * Inputs:
 *   --config <path>   default: ~/.config/<runtime>/mcp.json
 *   --runtime <claude|codex|gemini>   default: claude
 *
 * Outputs:
 *   - A markdown report at vault/company/audits/permissions-<YYYY-MM-DD>.md
 *   - Non-zero exit code if drift is detected
 *
 * Notes:
 *   - Read-only. Never modifies remote services.
 *   - Useful before and after onboarding a new MCP server.
 */

interface Args {
  config: string;
  runtime: "claude" | "codex" | "gemini";
}

function parseArgs(): Args {
  return { config: "", runtime: "claude" };
}

async function main() {
  const args = parseArgs();
  console.log("audit-permissions.ts (placeholder)", args);

  // TODO: implement
  // 1. Load MCP config file for the runtime
  // 2. For each server, list configured scopes
  // 3. Compare against env/permissions.example.md
  // 4. Build a markdown table: server | configured | expected | drift
  // 5. Write report
  // 6. Exit non-zero on drift
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
