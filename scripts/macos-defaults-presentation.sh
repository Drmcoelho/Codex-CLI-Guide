#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "macOS defaults can only be applied on macOS." >&2
  exit 1
fi

# Dock: larger, no autohide for visibility
defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock tilesize -int 56
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 80

# Menu bar: show battery percentage (if available)
defaults write com.apple.menuextra.battery ShowPercent -string "YES" >/dev/null 2>&1 || true

# Finder: show all file extensions for clarity
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Screenshots: create a dedicated folder
mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Screenshots"

killall Dock Finder SystemUIServer >/dev/null 2>&1 || true

echo "Presentation defaults applied."
