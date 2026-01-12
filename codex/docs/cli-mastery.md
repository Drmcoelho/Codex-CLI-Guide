# Mestria CLI no VS Code

Transforme seu terminal em uma cabine de comando avançada. Esta página documenta os scripts e técnicas do nosso "Dojo" de treinamento.

## Scripts de Automação

Estes scripts estão disponíveis no diretório `scripts/mastery/` do repositório.

### 1. Instalação Automática de Aliases (`install-aliases.sh`)

Configura atalhos poderosos no seu Zsh para o GitHub Copilot e Gemini.

*   **Uso:** `./scripts/mastery/install-aliases.sh`
*   **O que faz:** Adiciona `??`, `git?` e `gemini` ao seu `.zshrc`.

::: details Ver código fonte
```zsh
<<< @/../scripts/mastery/install-aliases.sh
```
:::

### 2. Gemini Pipe (`gemini-pipe.sh`)

Permite injetar logs e arquivos diretamente no Gemini para análise via terminal.

*   **Requisito:** `export GEMINI_API_KEY="sua-chave"`
*   **Uso:** `cat erro.log | gemini "Explique este erro"`

::: details Ver código fonte
```zsh
<<< @/../scripts/mastery/gemini-pipe.sh
```
:::

### 3. Controle do Xcode (`xcode-control.sh`)

Gerencie simuladores iOS sem abrir a interface pesada do Xcode.

*   **Requisito:** Xcode completo instalado (não apenas Command Line Tools).
*   **Uso:** `./scripts/mastery/xcode-control.sh`

::: details Ver código fonte
```zsh
<<< @/../scripts/mastery/xcode-control.sh
```
:::

## Segredos do VS Code no Mac

### O Comando `xed`
Você sabia que pode abrir o projeto atual no Xcode diretamente do terminal do VS Code?
```zsh
xed .
```
Isso é útil quando você precisa editar configurações de Build (.xcodeproj) que são difíceis de mexer manualmente.

### Split Terminals
Use `Cmd + \` para dividir seu terminal. Mantenha seu servidor rodando na esquerda e seus comandos git na direita.

### Arrastar e Soltar
Arraste qualquer arquivo da barra lateral do VS Code para o terminal para colar seu caminho absoluto instantaneamente.

## Solução de Problemas Comuns

### "xcrun: error: unable to find utility 'simctl'"
Se você ver este erro, seu sistema está apontando para uma instalação mínima de ferramentas.

**Correção:**
```zsh
sudo xcode-select -s /Applications/Xcode.app
```

```