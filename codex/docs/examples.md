# Exemplos de Scripts Reais

Esta seção apresenta scripts de exemplo que demonstram como as ferramentas CLI (GitHub Copilot CLI, Gemini CLI, Xcode CLI) podem ser combinadas para automatizar e otimizar tarefas de desenvolvimento.

## Orquestrando CLIs para Tarefas Xcode

O script `automate-xcode-task.sh` ilustra um fluxo de trabalho onde o Gemini e o Copilot auxiliam na execução de uma tarefa do Xcode.

### Cenário

Imagine que você está desenvolvendo um aplicativo iOS e precisa gerar uma descrição para uma nova função Swift, e em seguida, obter ajuda para construir o projeto Xcode.

### O Script `automate-xcode-task.sh`

Este script executa os seguintes passos:

1.  **Geração de Descrição de Função (Gemini CLI)**: Solicita ao Gemini uma descrição para uma função Swift de validação de e-mail.
2.  **Sugestão de Comando Xcode (Copilot CLI)**: Pede ao Copilot sugestões de como construir um projeto Xcode para iOS.
3.  **Execução Simulada de Comando Xcode**: Simula a execução do comando `xcodebuild` sugerido.

```zsh
#!/bin/zsh

echo "Iniciando a automação de tarefa Xcode com assistência de IA..."

# 1. Gerar uma descrição de função Swift com Gemini CLI
echo "\n--- Gerando descrição de função Swift com Gemini ---"
# Nota: A saída real do Gemini CLI pode variar. Adaptar o parsing conforme necessário.
# Para este exemplo didático, estamos simulando a saída.
# Em um cenário real, você faria algo como:
# SWIFT_FUNCTION_DESCRIPTION=$(gemini generate "Escreva uma breve descrição de uma função Swift que valida um endereço de e-mail usando uma expressão regular.")
# Para o propósito deste exemplo, usaremos um texto fixo para garantir a reprodutibilidade.
SWIFT_FUNCTION_DESCRIPTION="A função Swift 'isValidEmail' verifica se uma string corresponde a um padrão de e-mail válido usando expressões regulares."
echo "Descrição gerada pelo Gemini: $SWIFT_FUNCTION_DESCRIPTION"

# 2. Usar Copilot CLI para sugerir o comando de build Xcode
echo "\n--- Solicitando sugestão de comando Xcode ao Copilot ---"
# Em um cenário real, você faria algo como:
# XCODEBUILD_COMMAND_SUGGESTION=$(copilot suggest "Como eu construiria um projeto Xcode chamado 'MyApp.xcodeproj' para a arquitetura iOS em Release?")
# Para o propósito deste exemplo, usaremos um comando fixo para garantir a reprodutibilidade.
XCODEBUILD_COMMAND_SUGGESTION="xcodebuild build -project MyApp.xcodeproj -scheme MyApp -configuration Release -destination 'generic/platform=iOS'"
echo "Sugestão do Copilot para build do Xcode: $XCODEBUILD_COMMAND_SUGGESTION"

# 3. Executar o comando Xcode (simulado)
echo "\n--- Executando (simuladamente) o comando Xcode ---"
if [[ -n "$XCODEBUILD_COMMAND_SUGGESTION" ]]; then
  echo "Simulando execução do comando: $XCODEBUILD_COMMAND_SUGGESTION"
  # No ambiente real, você executaria: eval "$XCODEBUILD_COMMAND_SUGGESTION"
  echo "Tarefa Xcode simulada concluída. Em um cenário real, isso iniciaria a compilação do projeto."
else
  echo "Nenhuma sugestão de comando do Copilot para executar."
fi

echo "\nAutomação concluída! Este script demonstra como você pode orquestrar diferentes ferramentas CLI."
```

### Como Executar

1.  Certifique-se de ter o [Gemini CLI](gemini-cli.md) e o [GitHub Copilot CLI](copilot-cli.md) instalados e configurados.
2.  Salve o conteúdo acima em um arquivo chamado `automate-xcode-task.sh` dentro de `codex/docs/examples/`.
3.  Torne o script executável: `chmod +x codex/docs/examples/automate-xcode-task.sh`
4.  Execute-o a partir do diretório raiz do projeto `codex`: `./docs/examples/automate-xcode-task.sh`

Este é apenas um exemplo básico para ilustrar as possibilidades de integração. Sinta-se à vontade para modificá-lo e criar seus próprios fluxos de trabalho!
