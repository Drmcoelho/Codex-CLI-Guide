#!/usr/bin/env bash
set -euo pipefail

SSH_DIR="$HOME/.ssh"
KEY_PATH="$SSH_DIR/id_ed25519"
PUB_PATH="$KEY_PATH.pub"

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

if [[ ! -f "$KEY_PATH" ]]; then
  echo "Generating new SSH key at $KEY_PATH"
  ssh-keygen -t ed25519 -a 100 -f "$KEY_PATH" -N "" -C "$(whoami)@$(hostname)"
fi

if [[ -f "$PUB_PATH" ]]; then
  eval "$(ssh-agent -s)" >/dev/null
  ssh-add --apple-use-keychain "$KEY_PATH" >/dev/null 2>&1 || ssh-add "$KEY_PATH" >/dev/null

  CONFIG_FILE="$SSH_DIR/config"
  if ! grep -q "Host github.com" "$CONFIG_FILE" 2>/dev/null; then
    cat <<'CFG' >> "$CONFIG_FILE"
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
CFG
    echo "Added GitHub SSH config."
  fi

  if command -v gh >/dev/null 2>&1; then
    if gh auth status >/dev/null 2>&1; then
      TITLE="$(scutil --get ComputerName 2>/dev/null || hostname)-$(date +%Y%m%d)"
      gh ssh-key add "$PUB_PATH" --title "$TITLE" >/dev/null 2>&1 || true
      echo "GitHub SSH key upload attempted."
    else
      echo "gh is installed but not authenticated. Run: gh auth login"
    fi
  fi
else
  echo "Public key not found at $PUB_PATH" >&2
  exit 1
fi
