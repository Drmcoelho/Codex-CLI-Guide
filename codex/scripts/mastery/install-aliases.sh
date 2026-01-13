#!/bin/zsh

# install-aliases.sh
# Instala o Profile Codex Mastery no seu Mega Zsh Modular.

echo "🚀 Instalando Codex Mastery Profile..."

# Caminhos
REPO_DIR="${0:a:h}"
PROFILE_SOURCE="$REPO_DIR/codex_mastery_profile.zsh"
ZSH_PROFILES_DIR="$HOME/.config/zsh/profiles"
PROFILE_DEST="$ZSH_PROFILES_DIR/codex_mastery.zsh"
ZPROF_CTL="$HOME/.config/zsh/60_profiles_loader.zsh"

# 1. Verificar diretório de profiles
if [ ! -d "$ZSH_PROFILES_DIR" ]; then
    echo "❌ Diretório de profiles não encontrado: $ZSH_PROFILES_DIR"
    echo "Certifique-se que sua estrutura Mega Zsh está correta."
    exit 1
fi

# 2. Criar Symlink (Mantém o profile atualizado com o repo)
echo "🔗 Linkando profile..."
ln -sf "$PROFILE_SOURCE" "$PROFILE_DEST"

if [ -L "$PROFILE_DEST" ]; then
    echo "✅ Profile linkado em: $PROFILE_DEST"
else
    echo "❌ Falha ao criar link simbólico."
    exit 1
fi

# 3. Habilitar via zprofctl (Simulando a lógica pois zprofctl é uma função de shell, não um script executável isolado)
ENABLED_FILE="$HOME/.config/zsh/enabled_profiles"
PROFILE_NAME="codex_mastery"

if grep -q "^$PROFILE_NAME$" "$ENABLED_FILE" 2>/dev/null; then
    echo "✅ Profile '$PROFILE_NAME' já estava habilitado."
else
    echo "🔧 Habilitando profile '$PROFILE_NAME'..."
    echo "$PROFILE_NAME" >> "$ENABLED_FILE"
    echo "✅ Profile habilitado!"
fi

echo "\n✨ Instalação Concluída!"
echo "Para ativar as mudanças agora, rode:"
echo "source ~/.zshrc"
echo "Ou reinicie seu terminal."

