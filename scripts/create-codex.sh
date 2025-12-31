#!/bin/zsh

# Script to automate the creation of a VitePress-based "Codex" project
# This script sets up a documentation site with pre-filled content about
# GitHub Copilot CLI, Gemini CLI, and Xcode CLI.

set -e

PROJECT_NAME="$1"

if [ -z "$PROJECT_NAME" ]; then
  echo "Uso: $0 <nome_do_projeto>"
  echo "Exemplo: $0 meu-codex-docs"
  exit 1
fi

PROJECT_DIR="$(pwd)/$PROJECT_NAME"

echo "Criando o projeto Codex em: $PROJECT_DIR"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

echo "Inicializando o repositório Git..."
git init

echo "Criando o package.json..."
cat << EOF > package.json
{
  "name": "$PROJECT_NAME",
  "version": "1.0.0",
  "description": "Um guia interativo para GitHub Copilot CLI, Gemini CLI e Xcode CLI.",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "docs:dev": "vitepress dev docs",
    "docs:build": "vitepress build docs",
    "docs:preview": "vitepress preview docs"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "type": "module",
  "devDependencies": {
    "vitepress": "^1.0.0-rc.45",
    "vue": "^3.4.21"
  }
}
EOF

echo "Instalando VitePress e Vue..."
npm install

echo "Criando estrutura de diretórios do VitePress..."
mkdir -p docs/.vitepress

echo "Criando docs/.vitepress/config.mts..."
cat << EOF > docs/.vitepress/config.mts
import { defineConfig } from 'vitepress'

export default defineConfig({
  title: "Codex",
  description: "Explorando GitHub Copilot, Gemini CLI e Xcode CLI",
  themeConfig: {
    nav: [
      { text: 'Início', link: '/' },
      { text: 'Guias', link: '/copilot-cli' }
    ],

    sidebar: [
      {
        text: 'Introdução',
        items: [
          { text: 'Sobre o Codex', link: '/' }
        ]
      },
      {
        text: 'Ferramentas CLI',
        items: [
          { text: 'GitHub Copilot CLI', link: '/copilot-cli' },
          { text: 'Gemini CLI', link: '/gemini-cli' },
          { text: 'Xcode CLI', link: '/xcode-cli' }
        ]
      },
      {
        text: 'Integração',
        items: [
          { text: 'Exemplos Práticos', link: '/integracao' }
        ]
      }
    ]
  }
})
EOF

echo "Criando docs/index.md (página inicial)..."
cat << EOF > docs/index.md
---
layout: home

hero:
  name: "Codex"
  text: "Seu Guia Interativo para CLIs Modernas."
  tagline: Explorando GitHub Copilot, Gemini CLI e Xcode CLI em um só lugar.
  actions:
    - theme: brand
      text: Começar
      link: /copilot-cli
    - theme: alt
      text: Ver no GitHub
      link: # A ser preenchido com o link do repositório

features:
  - title: GitHub Copilot CLI
    details: Aprenda a usar o Copilot diretamente do seu terminal para obter sugestões de comandos, explicações e muito mais.
  - title: Gemini CLI
    details: Descubra como interagir com o modelo Gemini através da linha de comando, explorando suas capacidades didáticas e interativas.
  - title: Xcode CLI
    details: Explore as ferramentas de linha de comando do Xcode para automatizar tarefas de desenvolvimento iOS/macOS, compilação e testes.
---

# Codex: Explorando GitHub Copilot, Gemini CLI e Xcode CLI

Bem-vindo ao projeto Codex! Este repositório é dedicado a explorar e documentar o uso do GitHub Copilot CLI, Gemini CLI e Xcode CLI, com foco em suas funcionalidades interativas e na integração entre eles.

## Como Usar Este Guia

Este projeto é estruturado como um guia interativo. Cada tópico possui seu próprio arquivo Markdown detalhando o uso e exemplos práticos. Sinta-se à vontade para navegar pelos arquivos e experimentar os comandos por conta própria.

Vamos começar a desvendar o poder dessas ferramentas!
EOF

echo "Criando copilot-cli.md..."
cat << EOF > docs/copilot-cli.md
# GitHub Copilot CLI

O GitHub Copilot CLI é uma ferramenta poderosa que traz a inteligência artificial do Copilot diretamente para o seu terminal. Ele pode ajudar com sugestões de comandos, explicações, e até mesmo na resolução de problemas.

## Instalação

Certifique-se de que o GitHub Copilot CLI esteja instalado. Se você seguiu os passos anteriores do nosso assistente, ele já deve estar pronto!

## Autenticação

Na primeira vez que você usar o 
`copilot`
, ele pode pedir para você se autenticar com sua conta GitHub. Siga as instruções no terminal.

## Comandos Principais

*   **`copilot suggest <prompt>`**: Solicita sugestões de comandos com base na sua descrição.
*   **`copilot explain <comando>`**: Explica um comando existente.
*   **`copilot --help`**: Exibe a ajuda e as opções disponíveis.

## Exemplos Interativos

Aqui vamos explorar exemplos práticos e interativos de como usar o GitHub Copilot CLI para diversas tarefas.

### Sugerir Comandos com `copilot suggest`

Você pode pedir ao Copilot para sugerir comandos para você, descrevendo o que você quer fazer em linguagem natural.

**Exemplo:** Como listar todos os arquivos grandes (>10MB) no diretório atual?

`copilot suggest "how to find all files larger than 10MB in the current directory"`

O Copilot irá analisar sua solicitação e pode retornar algo como:

`# Finds all files larger than 10MB in the current directory
find . -type f -size +10M`

Você pode então optar por executar o comando sugerido ou pedir por outras opções.

### Explicar Comandos com `copilot explain`

Se você se deparar com um comando que não entende, o Copilot pode explicá-lo em detalhes.

**Exemplo:** Explique o comando `tar -czvf archive.tar.gz /path/to/directory`

`copilot explain "tar -czvf archive.tar.gz /path/to/directory"`

O Copilot fornecerá uma explicação detalhada de cada parte do comando:

`The 
`tar`
 command is used to create, maintain, and extract archived files.
- 
`c`
: Create a new archive.
- 
`z`
: Compress the archive with gzip.
- 
`v`
: Verbose output, showing the files being added to the archive.
- 
`f`
: Specify the filename of the archive.
- 
`archive.tar.gz`
: The name of the archive file to be created.
- 
`/path/to/directory`
: The directory to be archived.
`

## Integração com o Visual Studio Code

Embora estejamos focados no Copilot CLI, é importante mencionar que o GitHub Copilot também possui uma poderosa extensão para o Visual Studio Code (e outros IDEs). Essa extensão oferece sugestões de código em tempo real diretamente no seu editor, complementando o fluxo de trabalho do CLI.

**Recursos no VS Code:**

*   **Preenchimento automático de código**: Sugere linhas inteiras ou blocos de código enquanto você digita.
*   **Geração de funções**: Pode gerar funções inteiras a partir de comentários ou nomes de funções.
*   **Refatoração**: Ajuda a refatorar e otimizar seu código.

Para uma experiência completa, é recomendável usar a extensão do Copilot no VS Code em conjunto com o Copilot CLI.
EOF

echo "Criando gemini-cli.md..."
cat << EOF > docs/gemini-cli.md
# Gemini CLI

O Gemini CLI permite interagir com o modelo de inteligência artificial Gemini diretamente do seu terminal, oferecendo uma maneira didática e interativa de explorar suas capacidades.

## Instalação e Configuração

Para usar o Gemini CLI, você precisa de uma chave de API do Google Gemini.

1.  **Obtenha uma Chave de API:**
    *   Vá para o [Google AI Studio](https://aistudio.google.com/app/apikey).
    *   Crie ou selecione um projeto e gere sua chave de API.

2.  **Configure a Chave de API (variável de ambiente):**
    É altamente recomendável definir sua chave de API como uma variável de ambiente para evitar expô-la em seu código.

    `export GOOGLE_API_KEY="SUA_CHAVE_DE_API_AQUI"`
    Para que essa variável seja persistente, adicione a linha acima ao seu arquivo `~/.zshrc`, `~/.bashrc` ou `~/.profile`.

3.  **Instale o Gemini CLI (se ainda não o fez):**
    O Gemini CLI geralmente é parte de um SDK maior ou pode ser instalado via npm ou pip, dependendo da implementação específica. Para este guia, assumimos que você tem uma forma de interagir com o modelo Gemini via linha de comando. (Nota: A implementação exata do "Gemini CLI" pode variar, este guia foca na interação conceitual via terminal.)

## Comandos Principais

*   **`gemini chat`**: Inicia uma sessão de chat interativa com o modelo Gemini. Ótimo para conversas em tempo real e para obter respostas contextuais.
*   **`gemini generate <prompt>`**: Gera texto, código, ou outros conteúdos com base em um prompt. Útil para tarefas de geração única.
*   **`gemini --help`**: Exibe a ajuda e as opções disponíveis para o comando `gemini`.

## Exemplos Interativos

Vamos mergulhar em exemplos práticos de como usar o Gemini CLI para gerar ideias, escrever código, obter explicações e muito mais.

### 1. Conversa Interativa com `gemini chat`

Para iniciar um chat interativo, basta digitar:

`gemini chat`

Você será saudado por um prompt onde pode digitar suas perguntas. O Gemini manterá o contexto da conversa.

**Exemplo de interação:**

`>>> gemini chat
You: Me conte uma piada.
Gemini: Por que o tomate não foi à festa? Porque ele estava 
`passado`
!
You: Que tipo de piadas você gosta?
Gemini: Eu gosto de piadas que me fazem "pensar"... mas como sou uma IA, isso é figurativo! Talvez piadas sobre computação ou lógica sejam as minhas favoritas.
You: Me dê um script simples em Python para listar arquivos em um diretório.
Gemini: Claro! Aqui está um script Python básico:

`import os

def list_files_in_directory(path='.'):
    """Lists all files and directories in a given path."""
    for item in os.listdir(path):
        print(item)

if __name__ == "__main__":
    list_files_in_directory()
`

### 2. Geração de Conteúdo Único com `gemini generate`

Use `gemini generate` para obter respostas diretas ou criar conteúdo específico sem iniciar uma sessão de chat contínua.

**Exemplo 1: Gerar um trecho de código**

`gemini generate "Me escreva uma função em JavaScript para calcular o fatorial de um número."`

O Gemini pode retornar algo como:

`function factorial(n) {
  if (n === 0 || n === 1) {
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}

// Exemplo de uso:
console.log(factorial(5)); // Saída: 120
`

**Exemplo 2: Obter uma explicação rápida**

`gemini generate "O que é um algoritmo de ordenação 'Bubble Sort'?"`

O Gemini fornecerá uma explicação concisa sobre o Bubble Sort.

Lembre-se que a qualidade e o formato das respostas podem variar. Experimente diferentes prompts para obter os melhores resultados!
EOF

echo "Criando xcode-cli.md..."
cat << EOF > docs/xcode-cli.md
# Xcode CLI

As ferramentas de linha de comando do Xcode são essenciais para desenvolvedores Apple, permitindo automatizar tarefas de build, testes e gerenciamento de projetos sem a interface gráfica do Xcode.

## Instalação

As ferramentas de linha de comando do Xcode (Command Line Tools) geralmente são instaladas como parte do Xcode ou separadamente.

`xcode-select --install`

## Comandos Principais e Exemplos Práticos

As ferramentas de linha de comando do Xcode são um conjunto robusto para automação. Vamos explorar algumas das mais importantes.

### 1. `xcode-select`: Gerenciando as Ferramentas de Linha de Comando

`xcode-select` gerencia qual instalação do Xcode ou quais Command Line Tools estão ativas no seu sistema.

*   **`xcode-select --install`**: Instala as Command Line Tools (se ainda não estiverem instaladas).
*   **`xcode-select --print-path`**: Exibe o caminho para as ferramentas de desenvolvedor ativas.
    `xcode-select --print-path`
    # Saída esperada: /Applications/Xcode.app/Contents/Developer
*   **`sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer`**: Define uma versão específica do Xcode como a ativa para as ferramentas de linha de comando. Útil se você tiver várias versões do Xcode instaladas.

### 2. `xcrun`: Executando Ferramentas do Xcode

`xcrun` permite executar qualquer ferramenta empacotada com o Xcode sem precisar especificar o caminho completo. Ele encontra a ferramenta no pacote do Xcode ativo.

*   **Compilando Código Swift:** Use `xcrun swiftc` para compilar arquivos Swift.

    `# Exemplo: Crie um arquivo hello.swift`
    `echo 'print("Hello, Xcode CLI!")' > hello.swift`

    `# Compile o arquivo`
    `xcrun swiftc hello.swift`

    `# Execute o binário gerado`
    `./hello`
    # Saída: Hello, Xcode CLI!

*   **Gerenciando Simuladores com `simctl`:** O `simctl` (Simulator Control) é uma ferramenta poderosa para gerenciar dispositivos simulados.

    `# Listar todos os dispositivos simulados`
    `xcrun simctl list devices`

    `# Criar um novo simulador (exemplo)`
    `# xcrun simctl create "My Custom iPhone" "iPhone 15" "com.apple.CoreSimulator.SimRuntime.iOS-17-0"`

    `# Abrir um simulador específico (usando o nome ou UDID)`
    `# xcrun simctl boot "My Custom iPhone"`

    `# Instalar um aplicativo (.app) em um simulador bootado`
    `# xcrun simctl install booted /path/to/YourApp.app`

    `# Iniciar um aplicativo em um simulador bootado`
    `# xcrun simctl launch booted com.yourcompany.YourApp`

### 3. `xcodebuild`: Construindo Projetos e Workspaces

`xcodebuild` é a ferramenta central para construir projetos e workspaces do Xcode a partir da linha de comando, ideal para integração contínua (CI).

*   **Construir um Projeto:**

    `# Navegue até o diretório do seu projeto Xcode (.xcodeproj ou .xcworkspace)`
    `cd /path/to/YourProject`

    `# Construir o projeto para um dispositivo iOS genérico`
    `xcodebuild build -project YourApp.xcodeproj -scheme YourApp -destination 'generic/platform=iOS'`

    `# Construir o projeto para um simulador específico`
    `# xcodebuild build -workspace YourApp.xcworkspace -scheme YourApp -destination 'platform=iOS Simulator,name=iPhone 15'`

    `# Limpar o projeto`
    `xcodebuild clean -project YourApp.xcodeproj -scheme YourApp`

*   **Rodar Testes:**

    `# Rodar testes em um simulador específico`
    `xcodebuild test -workspace YourApp.xcworkspace -scheme YourApp -destination 'platform=iOS Simulator,name=iPhone 15'`

## A Importância da Automação

O uso dessas ferramentas em conjunto com scripts (Bash, Python, etc.) permite:
*   **Integração Contínua (CI)**: Automatizar builds, testes e distribuições em servidores remotos.
*   **Produtividade**: Agilizar tarefas repetitivas.
*   **Consistência**: Garantir que as builds e testes sejam executados de forma idêntica sempre.

Explorar o Xcode CLI é um passo fundamental para qualquer desenvolvedor Apple que busca otimizar seu fluxo de trabalho.
EOF

echo "Criando integracao.md..."
cat << EOF > docs/integracao.md
# Integração e Exemplos Práticos: Copilot, Gemini e Xcode CLI Juntos

Nesta seção, exploraremos como o GitHub Copilot CLI, Gemini CLI e Xcode CLI podem ser integrados para otimizar o fluxo de trabalho de desenvolvimento, especialmente para projetos iOS/macOS. A combinação dessas ferramentas permite automação inteligente, assistência de codificação e gerenciamento eficiente de builds e testes.

## Cenário de Exemplo: Automação de Tarefas iOS com Assistência de IA

Vamos imaginar um cenário onde precisamos criar um script para:
1.  Gerar um novo arquivo Swift para um ViewModel.
2.  Adicionar um código boilerplate a esse arquivo.
3.  Compilar e testar o projeto Xcode para garantir que as mudanças não introduziram erros.

Aqui, veremos como as três CLIs podem colaborar.

### Passo 1: Gerando o Código do ViewModel com Gemini CLI

Podemos usar o Gemini CLI para gerar o código boilerplate para o nosso `ViewModel`.

**Prompt para o Gemini:**
`gemini generate "Me escreva um código Swift básico para um ViewModel de uma tela de lista de itens, usando Combine, com um published property para a lista de itens e uma função para carregar dados simulados."`

O Gemini poderia retornar algo como:

`import Combine
import Foundation

class ItemListViewModel: ObservableObject {
    @Published var items: [String] = []
    private var cancellables = Set<AnyCancellable>()

    init() {
        loadItems()
    }

    func loadItems() {
        // Simulating an asynchronous data load
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
        }
    }
}
`

Salvaríamos este código em um novo arquivo `ItemListViewModel.swift` dentro do nosso projeto Xcode.

### Passo 2: Usando o Copilot CLI para Sugestões de Comando

Agora que temos o novo arquivo, podemos querer adicioná-lo ao Git e compilar o projeto. Se não temos certeza dos comandos exatos, podemos pedir ajuda ao Copilot CLI.

**Exemplo com Copilot:**

`copilot suggest "Como adiciono o novo arquivo 'ItemListViewModel.swift' ao git e depois compilo um projeto Xcode chamado 'MyiOSApp' que está em um workspace 'MyiOSApp.xcworkspace' para um simulador?"`

O Copilot poderia sugerir algo como:

`git add ItemListViewModel.swift
xcodebuild build -workspace MyiOSApp.xcworkspace -scheme MyiOSApp -destination 'platform=iOS Simulator,name=iPhone 15'`

### Passo 3: Compilando e Testando com Xcode CLI

Com o comando sugerido pelo Copilot, podemos agora usar o `xcodebuild` para compilar e, opcionalmente, testar nosso projeto.

`# Compilar o projeto (adaptando o nome do workspace e scheme)`
`xcodebuild build -workspace MyiOSApp.xcworkspace -scheme MyiOSApp -destination 'platform=iOS Simulator,name=iPhone 15'`

`# Ou rodar testes`
`xcodebuild test -workspace MyiOSApp.xcworkspace -scheme MyiOSApp -destination 'platform=iOS Simulator,name=iPhone 15'`

## Conclusão

Este exemplo demonstra como a combinação da inteligência generativa do Gemini, a assistência de comandos do Copilot e a automação robusta do Xcode CLI podem criar um fluxo de trabalho de desenvolvimento muito mais eficiente e interativo. Cada ferramenta complementa as outras, formando um ecossistema poderoso para desenvolvedores.
EOF

echo "Projeto '$PROJECT_NAME' criado e configurado com sucesso!"
echo "Para iniciar o servidor de desenvolvimento, navegue até a pasta '$PROJECT_NAME' e execute:"
echo "npm run docs:dev"
