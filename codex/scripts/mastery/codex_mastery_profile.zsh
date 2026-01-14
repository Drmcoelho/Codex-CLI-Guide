# ~/.config/zsh/profiles/codex_mastery.zsh
# Profile dedicado ao Codex CLI Mastery
# Objetivo: Integrações de IA e Scripts de Automação sem conflitos.

# Só em shell interativo
[[ $- != *i* ]] && return

# --- Caminhos dos Scripts do Codex ---
# (Ajuste este caminho se mover o repo)
CODEX_SCRIPTS_DIR="$HOME/Library/Mobile Documents/com~apple~CloudDocs/MacBook Air/GitHub/MacBook/codex/scripts/mastery"

# --- 1. Gemini Integration ---
# Mantemos seu alias 'gemini' original intacto.
# Criamos 'gemini_pipe' para o uso com pipes (ex: cat log | gemini_pipe "Explain")
unalias gemini_pipe 2>/dev/null
if [ -f "$CODEX_SCRIPTS_DIR/gemini-pipe.sh" ]; then
    alias gemini_pipe="$CODEX_SCRIPTS_DIR/gemini-pipe.sh"
else
    # Fallback se o script não for encontrado no path hardcoded
    # Tenta achar via path relativo do profile (menos robusto mas útil)
    alias gemini_pipe="echo '❌ Script gemini-pipe.sh não encontrado em $CODEX_SCRIPTS_DIR'"
fi

# --- 2. Copilot Unified Interface (The "Cop" Command) ---
# Uma única porta de entrada para o Copilot CLI
unalias cop 2>/dev/null
cop() {
  local sub="${1:-}"
  # Se o primeiro argumento não for um subcomando conhecido, assume "ask"
  if [[ "$sub" != "explain" && "$sub" != "suggest" && "$sub" != "ask" ]]; then
      # Se for vazio, mostra ajuda
      if [ -z "$sub" ]; then
          echo "🤖 Copilot Wrapper"
          echo "Uso: cop <pergunta>        (Ask/Interactive)"
          echo "     cop explain <cmd>   (Explicar comando)"
          echo "     cop suggest <intent> (Sugerir comando)"
          return 1
      fi
      # Assume 'ask' implicitamente
      copilot -i "$@"
      return
  fi

  # Remove o subcomando dos argumentos
  shift 2>/dev/null || true
  
  case "$sub" in
    "ask")     copilot -i "$@" ;;
    "explain") copilot explain "$@" ;;
    "suggest") copilot suggest "$@" ;;
  esac
}

# Aliases curtos para memória muscular (Opcional, comente se não quiser)
unalias "??" "git?" "gh?" 2>/dev/null
alias '??'='cop suggest'
alias 'git?'='cop suggest git'
alias 'gh?'='cop suggest gh'

# --- 3. Xcode Automation ---
unalias xc 2>/dev/null
if [ -f "$CODEX_SCRIPTS_DIR/xcode-control.sh" ]; then
    alias xc="$CODEX_SCRIPTS_DIR/xcode-control.sh"
fi

# --- 4. JupyterLab: abrir N-esimo notebook do diretorio atual ---
unalias xcnb 2>/dev/null
xcnb() {
  local idx="${1:-1}"
  local -a nbs
  nbs=( *.ipynb(N) )
  if (( ${#nbs} == 0 )); then
    echo "nenhum .ipynb no diretorio atual"
    return 1
  fi
  if [[ "$idx" != <-> ]]; then
    echo "uso: xcnb <numero>"
    return 1
  fi
  if (( idx < 1 || idx > ${#nbs} )); then
    echo "indice fora do intervalo: 1-${#nbs}"
    return 1
  fi
  jupyter lab "${nbs[$idx]}"
}

alias xcnb1='xcnb 1'
alias xcnb2='xcnb 2'
alias xcnb3='xcnb 3'
alias xcnb4='xcnb 4'
alias xcnb5='xcnb 5'
alias xcnb6='xcnb 6'
alias xcnb7='xcnb 7'
alias xcnb8='xcnb 8'
alias xcnb9='xcnb 9'
