#!/usr/bin/env bash
set -euo pipefail

# These defaults are safe, lightweight tweaks. Rectangle will ignore unknown keys.

defaults write com.knollsoft.Rectangle launchOnLogin -bool true
# Gap around windows
defaults write com.knollsoft.Rectangle gapSize -int 10
# Gaps from screen edges (pixels)
defaults write com.knollsoft.Rectangle screenEdgeGapTop -int 6
defaults write com.knollsoft.Rectangle screenEdgeGapBottom -int 6
defaults write com.knollsoft.Rectangle screenEdgeGapLeft -int 6
defaults write com.knollsoft.Rectangle screenEdgeGapRight -int 6

killall Rectangle >/dev/null 2>&1 || true
open -a Rectangle >/dev/null 2>&1 || true

echo "Rectangle defaults applied (launch on login + gaps)."
