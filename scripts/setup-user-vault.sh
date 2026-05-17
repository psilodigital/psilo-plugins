#!/usr/bin/env bash
# setup-user-vault.sh — idempotent setup for ~/Documents/psilodigital/vault/
#
# Creates the external user vault expected by all psilodigital plugins:
#   ~/Documents/psilodigital/vault/_company/         (shared company facts)
#   ~/Documents/psilodigital/vault/_company/_shared/ (shared references)
#   ~/Documents/psilodigital/vault/_clients/         (per-client folders)
#
# Copies seed content from this repo's vault/ folder if present.
# Safe to run multiple times — existing files are not overwritten.

set -euo pipefail

# Locate repo root (script lives at repo/scripts/)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Target vault root
if [[ "$(uname)" == "Darwin" || "$(uname)" == "Linux" ]]; then
  VAULT_ROOT="$HOME/Documents/psilodigital/vault"
else
  echo "Unsupported OS for this script. Run the Windows version or set up manually." >&2
  exit 1
fi

echo "Setting up user vault at: $VAULT_ROOT"

# Create directory structure
mkdir -p "$VAULT_ROOT/_company/_shared"
mkdir -p "$VAULT_ROOT/_clients"

# Seed _company/ from repo vault/company/ (no overwrite)
if [[ -d "$REPO_ROOT/vault/company" ]]; then
  echo "Seeding _company/ from repo vault/company/..."
  for f in "$REPO_ROOT/vault/company"/*.md; do
    [[ -e "$f" ]] || continue
    name="$(basename "$f")"
    if [[ ! -e "$VAULT_ROOT/_company/$name" ]]; then
      cp "$f" "$VAULT_ROOT/_company/$name"
      echo "  + _company/$name"
    else
      echo "  = _company/$name (exists, skipped)"
    fi
  done
fi

# Seed _company/_shared/ from repo vault/references/ (no overwrite)
if [[ -d "$REPO_ROOT/vault/references" ]]; then
  echo "Seeding _company/_shared/ from repo vault/references/..."
  for f in "$REPO_ROOT/vault/references"/*.md; do
    [[ -e "$f" ]] || continue
    name="$(basename "$f")"
    if [[ ! -e "$VAULT_ROOT/_company/_shared/$name" ]]; then
      cp "$f" "$VAULT_ROOT/_company/_shared/$name"
      echo "  + _company/_shared/$name"
    else
      echo "  = _company/_shared/$name (exists, skipped)"
    fi
  done
fi

# Seed _clients/ from repo vault/clients/ (excluding _template; no overwrite)
if [[ -d "$REPO_ROOT/vault/clients" ]]; then
  echo "Seeding _clients/ from repo vault/clients/..."
  for d in "$REPO_ROOT/vault/clients"/*/; do
    [[ -e "$d" ]] || continue
    name="$(basename "$d")"
    [[ "$name" == "_template" ]] && continue
    if [[ ! -e "$VAULT_ROOT/_clients/$name" ]]; then
      cp -R "$d" "$VAULT_ROOT/_clients/$name"
      echo "  + _clients/$name"
    else
      echo "  = _clients/$name (exists, skipped)"
    fi
  done
fi

# Seed per-plugin sub-vaults from each plugin's vault/ template (no overwrite)
for plugin in sales proposals delivery; do
  plugin_vault="$REPO_ROOT/$plugin/vault"
  if [[ -d "$plugin_vault" ]]; then
    target="$VAULT_ROOT/$plugin"
    if [[ ! -e "$target" ]]; then
      echo "Seeding $plugin/ sub-vault..."
      mkdir -p "$target/00_current" "$target/01_prior" "$target/02_briefs"
      [[ -e "$plugin_vault/config.md" ]] && cp "$plugin_vault/config.md" "$target/config.md" && echo "  + $plugin/config.md"
      touch "$target/open-loops.md"
      echo "  + $plugin/open-loops.md"
    else
      echo "= $plugin/ sub-vault exists, skipped"
    fi
  fi
done

echo ""
echo "Done. Your vault is at: $VAULT_ROOT"
echo ""
echo "Next steps:"
echo "  1. Open $VAULT_ROOT/<plugin>/config.md for each plugin you'll use and fill in the fields."
echo "  2. Add a per-client overview to $VAULT_ROOT/_clients/<client>/overview.md"
echo "  3. From Claude Code:  /plugin marketplace add $REPO_ROOT"
echo "  4. Install plugins:   /plugin install sales@psilodigital  (or proposals, delivery)"
