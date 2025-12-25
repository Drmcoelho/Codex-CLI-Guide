#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Run scripts/bootstrap.sh first." >&2
  exit 1
fi

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BREWFILE_PATH="${BREWFILE:-$REPO_ROOT/Brewfile}"

if [[ ! -f "$BREWFILE_PATH" ]]; then
  echo "Brewfile not found at $BREWFILE_PATH" >&2
  exit 1
fi

brew update
brew bundle --file "$BREWFILE_PATH"
