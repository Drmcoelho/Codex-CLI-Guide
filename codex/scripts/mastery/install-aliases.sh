#!/bin/zsh

# install-aliases.sh
# Configura os superpoderes do Copilot e Gemini no seu Zsh.

echo "🚀 Iniciando configuração do CLI Mastery..."

ZSHRC="$HOME/.zshrc"

# 1. Configurar GitHub Copilot Aliases
echo "\n--- 1. Configurando GitHub Copilot Aliases ---"
if grep -q "gh copilot alias" "$ZSHRC"; then
    echo "✅ Aliases do Copilot já estão configurados."
else
    echo "🔧 Adicionando aliases do Copilot ao .zshrc..."
    echo "" >> "$ZSHRC"
    echo "# GitHub Copilot CLI Aliases" >> "$ZSHRC"
    echo 'eval "$(gh copilot alias -- zsh)"' >> "$ZSHRC"
    echo "✅ Adicionado! (Reinicie o terminal para usar '??', 'git?', 'gh?')"
fi

# 2. Configurar Alias para o script do Gemini
echo "\n--- 2. Configurando Alias do Gemini ---"
SCRIPT_DIR="${0:a:h}"
GEMINI_SCRIPT="$SCRIPT_DIR/gemini-pipe.sh"

if grep -q "alias gemini=" "$ZSHRC"; then
    echo "✅ Alias 'gemini' já existe."
else
    echo "🔧 Criando alias 'gemini' apontando para nossos scripts..."
    echo "" >> "$ZSHRC"
    echo "# Gemini CLI Wrapper" >> "$ZSHRC"
    echo "alias gemini='$GEMINI_SCRIPT'" >> "$ZSHRC"
    echo "✅ Alias 'gemini' criado!"
fi

echo "\n✨ Instalação concluída! Para aplicar as mudanças agora, execute:"
echo "source ~/.zshrc"
