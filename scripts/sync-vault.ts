/**
 * sync-vault.ts
 *
 * Purpose: Two-way sync between local `vault/` and an external knowledge base
 *          (Notion by default — adapt for Confluence, Google Drive, etc.).
 *
 * Inputs:
 *   --direction <pull|push|both>   default: pull
 *   --scope <company|products|clients|all>   default: all
 *   --dry-run                      no writes, print plan only
 *
 * Outputs:
 *   - Updates files under vault/
 *   - Prints a summary of what changed
 *
 * Notes:
 *   - Requires NOTION_API_KEY (see env/.env.example).
 *   - Skips anything under vault/clients/<client>/private/ (gitignored).
 *   - This is a placeholder. Wire to your KB of choice when ready.
 */

type Direction = "pull" | "push" | "both";
type Scope = "company" | "products" | "clients" | "all";

interface Args {
  direction: Direction;
  scope: Scope;
  dryRun: boolean;
}

function parseArgs(): Args {
  // Placeholder — replace with a proper CLI parser when implementing.
  return { direction: "pull", scope: "all", dryRun: true };
}

async function main() {
  const args = parseArgs();
  console.log("sync-vault.ts (placeholder)", args);

  // TODO: implement
  // 1. Authenticate with KB
  // 2. List remote pages under the configured root
  // 3. Diff against local vault/
  // 4. Apply changes per --direction
  // 5. Respect skip rules (private/, .gitignore-style)
  // 6. Print summary
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
