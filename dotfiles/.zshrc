# Homebrew shellenv
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt share_history

# Completion
autoload -Uz compinit
compinit

# Common aliases
alias ll='ls -la'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# fzf key bindings (if installed)
if [[ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ]]; then
  source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
fi

# Starship prompt (optional)
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
