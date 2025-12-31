# Xcode CLI

As ferramentas de linha de comando do Xcode são essenciais para desenvolvedores Apple, permitindo automatizar tarefas de build, testes e gerenciamento de projetos sem a interface gráfica do Xcode.

## Instalação

As ferramentas de linha de comando do Xcode (Command Line Tools) geralmente são instaladas como parte do Xcode ou separadamente.

```bash
xcode-select --install
```

## Comandos Principais e Exemplos Práticos

As ferramentas de linha de comando do Xcode são um conjunto robusto para automação. Vamos explorar algumas das mais importantes.

### 1. `xcode-select`: Gerenciando as Ferramentas de Linha de Comando

`xcode-select` gerencia qual instalação do Xcode ou quais Command Line Tools estão ativas no seu sistema.

*   **`xcode-select --install`**: Instala as Command Line Tools (se ainda não estiverem instaladas).
*   **`xcode-select --print-path`**: Exibe o caminho para as ferramentas de desenvolvedor ativas.
    ```bash
    xcode-select --print-path
    # Saída esperada: /Applications/Xcode.app/Contents/Developer
    ```
*   **`sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer`**: Define uma versão específica do Xcode como a ativa para as ferramentas de linha de comando. Útil se você tiver várias versões do Xcode instaladas.

### 2. `xcrun`: Executando Ferramentas do Xcode

`xcrun` permite executar qualquer ferramenta empacotada com o Xcode sem precisar especificar o caminho completo. Ele encontra a ferramenta no pacote do Xcode ativo.

*   **Compilando Código Swift:** Use `xcrun swiftc` para compilar arquivos Swift.

    ```bash
    # Exemplo: Crie um arquivo hello.swift
    echo 'print("Hello, Xcode CLI!")' > hello.swift

    # Compile o arquivo
    xcrun swiftc hello.swift

    # Execute o binário gerado
    ./hello
    # Saída: Hello, Xcode CLI!
    ```

*   **Gerenciando Simuladores com `simctl`:** O `simctl` (Simulator Control) é uma ferramenta poderosa para gerenciar dispositivos simulados.

    ```bash
    # Listar todos os dispositivos simulados
    xcrun simctl list devices

    # Criar um novo simulador (exemplo)
    # xcrun simctl create "My Custom iPhone" "iPhone 15" "com.apple.CoreSimulator.SimRuntime.iOS-17-0"

    # Abrir um simulador específico (usando o nome ou UDID)
    # xcrun simctl boot "My Custom iPhone"

    # Instalar um aplicativo (.app) em um simulador bootado
    # xcrun simctl install booted /path/to/YourApp.app

    # Iniciar um aplicativo em um simulador bootado
    # xcrun simctl launch booted com.yourcompany.YourApp
    ```

### 3. `xcodebuild`: Construindo Projetos e Workspaces

`xcodebuild` é a ferramenta central para construir projetos e workspaces do Xcode a partir da linha de comando, ideal para integração contínua (CI).

*   **Construir um Projeto:**

    ```bash
    # Navegue até o diretório do seu projeto Xcode (.xcodeproj ou .xcworkspace)
    cd /path/to/YourProject

    # Construir o projeto para um dispositivo iOS genérico
    xcodebuild build -project YourApp.xcodeproj -scheme YourApp -destination 'generic/platform=iOS'

    # Construir o projeto para um simulador específico
    # xcodebuild build -workspace YourApp.xcworkspace -scheme YourApp -destination 'platform=iOS Simulator,name=iPhone 15'

    # Limpar o projeto
    xcodebuild clean -project YourApp.xcodeproj -scheme YourApp
    ```

*   **Rodar Testes:**

    ```bash
    # Rodar testes em um simulador específico
    xcodebuild test -workspace YourApp.xcworkspace -scheme YourApp -destination 'platform=iOS Simulator,name=iPhone 15'
    ```

## A Importância da Automação

O uso dessas ferramentas em conjunto com scripts (Bash, Python, etc.) permite:
*   **Integração Contínua (CI)**: Automatizar builds, testes e distribuições em servidores remotos.
*   **Produtividade**: Agilizar tarefas repetitivas.
*   **Consistência**: Garantir que as builds e testes sejam executados de forma idêntica sempre.

Explorar o Xcode CLI é um passo fundamental para qualquer desenvolvedor Apple que busca otimizar seu fluxo de trabalho.

## Conteúdo Avançado: Automação de Code Signing e Archiving

Para a distribuição de aplicativos iOS/macOS, a assinatura de código (code signing) e o arquivamento (archiving) são etapas cruciais que podem ser totalmente automatizadas com o `xcodebuild`.

### Automação de Code Signing

O `xcodebuild` permite que você especifique o perfil de provisionamento (provisioning profile) e a identidade de assinatura (signing identity) diretamente na linha de comando, ou utilize aqueles configurados no seu projeto.

**Exemplo:** Construir e assinar um aplicativo iOS para distribuição.

```bash
xcodebuild clean archive \
  -workspace YourApp.xcworkspace \
  -scheme YourApp \
  -configuration Release \
  -destination 'generic/platform=iOS' \
  -archivePath "build/YourApp.xcarchive" \
  DEVELOPMENT_TEAM="YOUR_TEAM_ID" \
  CODE_SIGN_IDENTITY="Apple Distribution: Your Company Name (XXXXXXXXXX)" \
  PROVISIONING_PROFILE_SPECIFIER="Your_Distribution_Profile_Name"
```

**Explicação dos Parâmetros:**
*   `clean archive`: Limpa o build anterior e cria um arquivo (`.xcarchive`).
*   `-workspace YourApp.xcworkspace`: Especifica o workspace do Xcode. Use `-project YourApp.xcodeproj` se for um projeto simples.
*   `-scheme YourApp`: O scheme a ser construído.
*   `-configuration Release`: Define a configuração de build (normalmente "Release" para distribuição).
*   `-destination 'generic/platform=iOS'`: Indica que a build é para um dispositivo iOS genérico.
*   `-archivePath "build/YourApp.xcarchive"`: O caminho e nome do arquivo gerado.
*   `DEVELOPMENT_TEAM="YOUR_TEAM_ID"`: Seu ID de equipe de desenvolvedor Apple.
*   `CODE_SIGN_IDENTITY="Apple Distribution: Your Company Name (XXXXXXXXXX)"`: A identidade de assinatura a ser usada.
*   `PROVISIONING_PROFILE_SPECIFIER="Your_Distribution_Profile_Name"`: O nome do perfil de provisionamento.

### Automação de Archiving para Distribuição

Após a criação do arquivo (`.xcarchive`), a próxima etapa é exportar o IPA (para iOS) ou o APP assinado (para macOS) para distribuição. Isso também pode ser feito com `xcodebuild` e `xcrun altool` (para upload para a App Store Connect) ou `xcrun exportArchive`.

**Exemplo:** Exportar um IPA a partir de um `.xcarchive`.

Primeiro, crie um arquivo `ExportOptions.plist` que especifica como você quer exportar o arquivo (por exemplo, para App Store, Ad Hoc, Development, Enterprise).

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>method</key>
    <string>app-store</string> <!-- ou "ad-hoc", "development", "enterprise" -->
    <key>teamID</key>
    <string>YOUR_TEAM_ID</string>
    <key>uploadBitcode</key>
    <false/>
    <key>uploadSymbols</key>
    <true/>
</dict>
</plist>
```

Então, use `xcodebuild -exportArchive`:

```bash
xcodebuild -exportArchive \
  -archivePath "build/YourApp.xcarchive" \
  -exportOptionsPlist "ExportOptions.plist" \
  -exportPath "build/ipa"
```

Este comando gerará o arquivo `.ipa` (ou `.app` para macOS) no diretório `build/ipa`.

### Integração em CI/CD

A automação dessas etapas é fundamental para pipelines de CI/CD, garantindo que cada build seja consistente e possa ser distribuído com um processo repetível e livre de erros manuais. Combinando isso com ferramentas como o Fastlane, você pode criar um pipeline de deploy robusto para seus aplicativos Apple.
