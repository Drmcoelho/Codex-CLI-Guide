#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "macOS defaults can only be applied on macOS." >&2
  exit 1
fi

# Trackpad: tap to click
if defaults read com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking >/dev/null 2>&1; then
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
fi
if defaults read com.apple.AppleMultitouchTrackpad Clicking >/dev/null 2>&1; then
  defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
fi

# Keyboard repeat rate
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15

# Finder preferences
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Screenshots
mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Screenshots"
defaults write com.apple.screencapture type -string "png"

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock mineffect -string "scale"

echo "Restarting affected services..."
killall Dock Finder SystemUIServer >/dev/null 2>&1 || true
