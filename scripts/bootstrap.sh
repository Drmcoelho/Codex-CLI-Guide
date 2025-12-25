#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This setup is intended for macOS only." >&2
  exit 1
fi

if ! xcode-select -p >/dev/null 2>&1; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install || true
  echo "Re-run this script after the installer finishes."
  exit 0
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Ensure brew is available in this shell session
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

"$(dirname "$0")/profile-select.sh"
"$(dirname "$0")/link-dotfiles.sh"
"$(dirname "$0")/macos-defaults.sh"
if [[ -f "$(dirname "$0")/ssh-setup.sh" ]]; then
  "$(dirname "$0")/ssh-setup.sh"
fi

if [[ -f "$(dirname "$0")/vscode.sh" ]]; then
  "$(dirname "$0")/vscode.sh"
fi

echo "Bootstrap complete."
