#!/usr/bin/env bash
set -euo pipefail

if ! command -v code >/dev/null 2>&1; then
  echo "VS Code CLI not found. Install VS Code and enable 'code' in PATH to continue." >&2
  exit 0
fi

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
EXT_FILE="$REPO_ROOT/config/vscode/extensions.txt"

if [[ -f "$EXT_FILE" ]]; then
  while IFS= read -r extension || [[ -n "$extension" ]]; do
    [[ -z "$extension" ]] && continue
    code --install-extension "$extension" || true
  done < "$EXT_FILE"
fi
