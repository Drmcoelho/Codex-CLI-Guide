#!/bin/zsh

# fix_startup.sh
# Corrige erros de sintaxe e conflitos que impedem o carregamento do shell.

echo "🔧 Iniciando reparo do Zsh Startup..."

# --- 1. Corrigir erro de sintaxe em begin_jupyterlab.zsh ---
FILE_JUPYTER="$HOME/.config/zsh/profiles/begin_jupyterlab.zsh"
if [ -f "$FILE_JUPYTER" ]; then
    echo "🩹 Corrigindo begin_jupyterlab.zsh..."
    # Faz backup
    cp "$FILE_JUPYTER" "$FILE_JUPYTER.bak"
    
    # Remove a linha errada 'fi' (linha 19 no original lido)
    # A estrutura errada era: if ...; then \n fi \n ensure...
    # Vamos reescrever o bloco problemático usando perl para multiline replacement seguro
    perl -0777 -i -pe 's/if command -v ensure_cask >\/dev\/null 2>&1; then\s+fi\s+ensure_cask/if command -v ensure_cask >\/dev\/null 2>&1; then\n    ensure_cask/gs' "$FILE_JUPYTER"
    
    # Também vamos comentar chamadas interativas no escopo global/bootstrap se houver
    # (Nesse arquivo parece estar dentro de funções, o que é OK, exceto se a função for chamada no source)
    # O arquivo começa carregando 'conda_miniforge.zsh'. Vamos garantir que ele não execute nada interativo.
    
    echo "✅ Sintaxe de JupyterLab corrigida."
else
    echo "⚠️  begin_jupyterlab.zsh não encontrado. Pulando."
fi

# --- 2. Corrigir conflito de alias ghexplain em 30_functions.zsh ---
# O erro "defining function based on alias" acontece porque ghexplain deve estar aliased em algum lugar.
# Vamos adicionar um 'unalias' explícito antes da definição da função.
FILE_FUNCTIONS="$HOME/.config/zsh/30_functions.zsh"
if [ -f "$FILE_FUNCTIONS" ]; then
    echo "🩹 Prevenindo conflito de alias em 30_functions.zsh..."
    if ! grep -q "unalias ghexplain" "$FILE_FUNCTIONS"; then
        # Adiciona unalias antes da função ghexplain
        sed -i '' 's/ghexplain() {/unalias ghexplain 2>\/dev\/null\\
ghexplain() {/' "$FILE_FUNCTIONS"
        echo "✅ Unalias ghexplain adicionado."
    else
        echo "✅ Unalias já presente."
    fi
fi

# --- 3. Verificar Profile Codex ---
PROFILE_CODEX="$HOME/.config/zsh/profiles/codex_mastery.zsh"
if [ -f "$PROFILE_CODEX" ]; then
    echo "🔍 Verificando Profile Codex..."
    # Verificar se o PATH dos scripts está correto (expansão de til ~ dentro de aspas simples não rola)
    # Vamos forçar o path correto no arquivo se necessário.
    
    # Pega o diretório real deste script
    REAL_SCRIPT_DIR="${0:a:h}"
    # Caminho esperado dos scripts mastery
    MASTERY_DIR="$REAL_SCRIPT_DIR"
    
    # Atualiza o path no profile para ter certeza absoluta
    # Substitui a linha CODEX_SCRIPTS_DIR=... pela correta
    escaped_dir=$(echo "$MASTERY_DIR" | sed 's/\//\\\//g')
    sed -i '' "s/^CODEX_SCRIPTS_DIR=.*/CODEX_SCRIPTS_DIR=\"$escaped_dir\"/" "$PROFILE_CODEX"
    
    echo "✅ Path do Codex atualizado para: $MASTERY_DIR"
fi

echo "\n✨ Reparos concluídos! Tente rodar 'source ~/.zshrc' novamente."
