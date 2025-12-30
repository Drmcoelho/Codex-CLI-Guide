# GitHub Copilot CLI

O GitHub Copilot CLI é uma ferramenta poderosa que traz a inteligência artificial do Copilot diretamente para o seu terminal. Ele pode ajudar com sugestões de comandos, explicações, e até mesmo na resolução de problemas.

## Instalação

Certifique-se de que o GitHub Copilot CLI esteja instalado. Se você seguiu os passos anteriores do nosso assistente, ele já deve estar pronto!

## Autenticação

Na primeira vez que você usar o `copilot`, ele pode pedir para você se autenticar com sua conta GitHub. Siga as instruções no terminal.

## Comandos Principais

*   **`copilot suggest <prompt>`**: Solicita sugestões de comandos com base na sua descrição.
*   **`copilot explain <comando>`**: Explica um comando existente.
*   **`copilot --help`**: Exibe a ajuda e as opções disponíveis.

## Exemplos Interativos

Aqui vamos explorar exemplos práticos e interativos de como usar o GitHub Copilot CLI para diversas tarefas.

### Sugerir Comandos com `copilot suggest`

Você pode pedir ao Copilot para sugerir comandos para você, descrevendo o que você quer fazer em linguagem natural.

**Exemplo:** Como listar todos os arquivos grandes (>10MB) no diretório atual?

```bash
copilot suggest "how to find all files larger than 10MB in the current directory"
```

O Copilot irá analisar sua solicitação e pode retornar algo como:

```bash
# Finds all files larger than 10MB in the current directory
find . -type f -size +10M
```

Você pode então optar por executar o comando sugerido ou pedir por outras opções.

### Explicar Comandos com `copilot explain`

Se você se deparar com um comando que não entende, o Copilot pode explicá-lo em detalhes.

**Exemplo:** Explique o comando `tar -czvf archive.tar.gz /path/to/directory`

```bash
copilot explain "tar -czvf archive.tar.gz /path/to/directory"
```

O Copilot fornecerá uma explicação detalhada de cada parte do comando:

```
The `tar` command is used to create, maintain, and extract archived files.
- `c`: Create a new archive.
- `z`: Compress the archive with gzip.
- `v`: Verbose output, showing the files being added to the archive.
- `f`: Specify the filename of the archive.
- `archive.tar.gz`: The name of the archive file to be created.
- `/path/to/directory`: The directory to be archived.
```

## Integração com o Visual Studio Code

Embora estejamos focados no Copilot CLI, é importante mencionar que o GitHub Copilot também possui uma poderosa extensão para o Visual Studio Code (e outros IDEs). Essa extensão oferece sugestões de código em tempo real diretamente no seu editor, complementando o fluxo de trabalho do CLI.

**Recursos no VS Code:**

*   **Preenchimento automático de código**: Sugere linhas inteiras ou blocos de código enquanto você digita.
*   **Geração de funções**: Pode gerar funções inteiras a partir de comentários ou nomes de funções.
*   **Refatoração**: Ajuda a refatorar e otimizar seu código.

Para uma experiência completa, é recomendável usar a extensão do Copilot no VS Code em conjunto com o Copilot CLI.
