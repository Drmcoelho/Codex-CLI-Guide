#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$REPO_ROOT/config/iterm2/DynamicProfiles/matheus.json"
DEST_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"
DEST="$DEST_DIR/matheus.json"

mkdir -p "$DEST_DIR"
ln -sf "$SRC" "$DEST"

echo "iTerm2 dynamic profile linked to $DEST"
