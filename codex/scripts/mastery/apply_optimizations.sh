#!/bin/zsh

# apply_optimizations.sh
# Aplica as otimizações de Zsh e instala o profile Codex.
# Este script modifica arquivos em ~/.config/zsh.

TARGET_TOOLS="$HOME/.config/zsh/70_tools.zsh"
INSTALLER_SCRIPT="$(dirname "$0")/install-aliases.sh"

echo "🛠️  Aplicando Otimizações do Codex..."

# 1. Otimizar 70_tools.zsh (se ainda não foi feito)
if grep -q "_GH_COMP_CACHE" "$TARGET_TOOLS"; then
    echo "✅ 70_tools.zsh já está otimizado."
else
    echo "⚡ Otimizando cache de completion em $TARGET_TOOLS..."
    # Backup
    cp "$TARGET_TOOLS" "$TARGET_TOOLS.bak"
    
    # Substituição via sed (compatível com macOS BSD sed)
    # Substitui o bloco antigo pelo novo bloco com cache
    sed -i '' '/_MEGA_GH_COMP_LOADED/d' "$TARGET_TOOLS" 2>/dev/null
    sed -i '' '/eval "$(gh completion/d' "$TARGET_TOOLS" 2>/dev/null
    
    # Inserir o novo bloco no início ou onde estava o antigo é complexo com sed puro.
    # Vamos fazer append do bloco novo se ele não existir, mas o ideal seria editar manualmente.
    # Como não posso editar, vou instruir o usuário ou fazer um append seguro.
    
    cat <<EOT >> "$TARGET_TOOLS"

# --- Otimização Codex ---
if command -v gh >/dev/null 2>&1; then
  _GH_COMP_CACHE="${CLI_CACHE_ROOT:-$HOME/Library/Caches/cli_bootstrap}/gh_completion.zsh"
  if [ ! -f "$_GH_COMP_CACHE" ]; then
    mkdir -p "${$_GH_COMP_CACHE:h}" 2>/dev/null
    gh completion -s zsh > "$_GH_COMP_CACHE" 2>/dev/null || true
  fi
  [ -s "$_GH_COMP_CACHE" ] && source "$_GH_COMP_CACHE"
fi
EOT
    echo "✅ Código de cache adicionado ao final de $TARGET_TOOLS."
fi

# 2. Rodar o instalador de aliases/profile
echo "\n🚀 Executando instalador de profile..."
chmod +x "$INSTALLER_SCRIPT"
"$INSTALLER_SCRIPT"

echo "\n✨ Tudo pronto! Execute 'source ~/.zshrc' para ver a mágica."
