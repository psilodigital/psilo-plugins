/**
 * generate-proposal.ts
 *
 * Purpose: Render a proposal markdown file from a template + a client folder.
 *          Replaces tokens (client name, project, pricing, etc.) and writes to
 *          vault/clients/<slug>/proposals/<date>-<title>.md.
 *
 * Inputs:
 *   --client <slug>          required, must match a folder under vault/clients/
 *   --title <title>          required, short kebab-case
 *   --template <path>        default: vault/templates/proposal.md
 *
 * Outputs:
 *   - vault/clients/<slug>/proposals/<YYYY-MM-DD>-<title>.md
 *
 * Notes:
 *   - This is a placeholder. Wire to a templating engine (eta, mustache, or
 *     plain string replace) when implementing.
 *   - Does NOT call an LLM. The proposal-writer skill handles content;
 *     this script handles formatting and file placement.
 */

interface Args {
  client: string;
  title: string;
  template: string;
}

function parseArgs(): Args {
  return {
    client: "",
    title: "",
    template: "vault/templates/proposal.md",
  };
}

async function main() {
  const args = parseArgs();
  console.log("generate-proposal.ts (placeholder)", args);

  // TODO: implement
  // 1. Validate client folder exists
  // 2. Load template
  // 3. Load context from vault/clients/<slug>/ (research, scope, architecture)
  // 4. Replace tokens
  // 5. Write proposals/<date>-<title>.md
  // 6. Print path
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
