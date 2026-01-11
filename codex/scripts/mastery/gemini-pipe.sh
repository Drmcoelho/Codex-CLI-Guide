#!/bin/zsh

# gemini-pipe.sh
# Permite usar o Gemini via pipe no terminal.
# Requer uma variável de ambiente GEMINI_API_KEY.
# Uso: echo "conteudo" | gemini-pipe "prompt"

API_KEY="$GEMINI_API_KEY"

if [ -z "$API_KEY" ]; then
    echo "❌ Erro: A variável de ambiente GEMINI_API_KEY não está definida."
    echo "Defina-a com: export GEMINI_API_KEY='sua-chave-aqui'"
    exit 1
fi

# Captura a entrada do Pipe (stdin) se houver
PIPED_INPUT=""
if [ ! -t 0 ]; then
    PIPED_INPUT=$(cat)
fi

PROMPT="$1"
FULL_CONTEXT="Contexto:\n$PIPED_INPUT\n\nInstrução:\n$PROMPT"

# Escapar o conteúdo para JSON usando Python (mais seguro que sed/awk)
JSON_PAYLOAD=$(python3 -c "import json, sys; print(json.dumps({'contents': [{'parts': [{'text': sys.argv[1]}]}]}))" "$FULL_CONTEXT")

echo "🤖 Consultando o Gemini..."

# Chamada API (Usando Gemini 1.5 Flash por ser rápido para CLI)
RESPONSE=$(curl -s \
  -H "Content-Type: application/json" \
  -d "$JSON_PAYLOAD" \
  "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$API_KEY")

# Extrair apenas o texto da resposta (requer jq ou python)
echo "$RESPONSE" | python3 -c "import sys, json; print(json.load(sys.stdin)['candidates'][0]['content']['parts'][0]['text'])"
