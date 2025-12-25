#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

cat <<'MSG'
Choose a setup profile:

1) Web Dev
   - Full-stack toolkit: Node, Python, Go, Rust
   - Dev apps: VS Code, Docker, Postman
   - Browsing + window management: Chrome, Rectangle

2) Teaching
   - Lightweight CLI: git/gh, search tools, jq
   - Teaching apps: Zoom, OBS, Slack
   - Browsing + window management: Chrome, Rectangle

3) Minimal
   - Only core CLI tools + VS Code

MSG

read -r -p "Select [1-3]: " choice

case "$choice" in
  1)
    BREWFILE="$REPO_ROOT/Brewfile.webdev"
    ;;
  2)
    BREWFILE="$REPO_ROOT/Brewfile.teaching"
    ;;
  3)
    BREWFILE="$REPO_ROOT/Brewfile"
    ;;
  *)
    echo "Invalid choice." >&2
    exit 1
    ;;
esac

if [[ ! -f "$BREWFILE" ]]; then
  echo "Brewfile not found: $BREWFILE" >&2
  exit 1
fi

echo "Using $BREWFILE"
BREWFILE="$BREWFILE" "$REPO_ROOT/scripts/brew.sh"
