#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DOTFILES_DIR="$REPO_ROOT/dotfiles"

link_file() {
  local src="$1"
  local dest="$2"

  if [[ -e "$dest" && ! -L "$dest" ]]; then
    echo "Skipping $dest (already exists)."
    return 0
  fi

  mkdir -p "$(dirname "$dest")"
  ln -sf "$src" "$dest"
  echo "Linked $dest -> $src"
}

link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/.gitignore_global" "$HOME/.gitignore_global"
link_file "$DOTFILES_DIR/.editorconfig" "$HOME/.editorconfig"

# Optional: VS Code settings
if [[ -d "$REPO_ROOT/config/vscode" ]]; then
  VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
  mkdir -p "$VSCODE_USER_DIR"
  link_file "$REPO_ROOT/config/vscode/settings.json" "$VSCODE_USER_DIR/settings.json"
  link_file "$REPO_ROOT/config/vscode/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"
fi
