# Melhores Práticas: Combinando o Poder das CLIs

Dominar o GitHub Copilot CLI, Gemini CLI e Xcode CLI individualmente já é um grande passo. No entanto, o verdadeiro poder se revela quando você os integra de forma inteligente no seu fluxo de trabalho diário. Esta seção oferece algumas melhores práticas e dicas para maximizar a produtividade e a eficiência.

## 1. Mantenha o Contexto Ativo

*   **Copilot CLI**: Ao usar `copilot suggest` ou `copilot explain`, seja o mais específico possível no seu prompt. O Copilot se beneficia enormemente de um contexto claro e detalhado. Se você está em um repositório Git, ele pode usar o contexto do seu código para sugestões mais relevantes.
*   **Gemini CLI**: Em sessões de `gemini chat`, o modelo mantém o contexto da conversa. Aproveite isso para refinar perguntas e explorar ideias mais a fundo. Para `gemini generate`, forneça um prompt com todas as informações necessárias para uma resposta precisa.

## 2. Automação e Scripting são Seus Amigos

*   **Scripts Shell (`.zsh`, `.bash`)**: Use o Copilot para gerar trechos de scripts que automatizem tarefas repetitivas. Por exemplo, um script para "limpar caches do Xcode e rebuildar meu projeto" pode ser gerado rapidamente.
*   **Integração de Comandos**: Combine comandos das três CLIs em scripts maiores. Por exemplo, um script que:
    1.  Usa o Gemini para gerar um trecho de código.
    2.  Pede ao Copilot sugestões para o comando `xcodebuild` para integrar esse código.
    3.  Executa o `xcodebuild` para verificar.

## 3. Feedback e Refinamento Contínuos

*   **Copilot CLI**: Se a sugestão inicial não for perfeita, refine seu prompt. Peça ao Copilot para "ignorar tal coisa" ou "focar em X".
*   **Gemini CLI**: Da mesma forma, para respostas do Gemini, se algo não estiver correto ou completo, peça ao modelo para revisar: "Você pode reescrever isso de forma mais concisa?" ou "Inclua um exemplo de uso."

## 4. Otimização do Desenvolvimento Xcode com CLI

*   **CI/CD**: Utilize `xcodebuild` em pipelines de Integração Contínua/Entrega Contínua (CI/CD). Isso garante builds consistentes e automatiza testes e distribuições.
*   **Simuladores**: Use `xcrun simctl` para gerenciar seus simuladores de forma programática. Crie, liste, reinicie simuladores conforme a necessidade dos seus testes automatizados.
*   **Fastlane e Xcode CLI**: Ferramentas como o Fastlane se baseiam extensivamente no Xcode CLI. Aprender os fundamentos do `xcodebuild` e `simctl` tornará a depuração e customização de pipelines de Fastlane muito mais fácil.

## 5. Documentação e Compartilhamento

*   **Gerar Documentação com Gemini**: Use o Gemini para gerar descrições, READMEs ou até mesmo comentários para suas funções.
*   **Manter o Codex Atualizado**: Este próprio projeto "Codex" é um exemplo de como documentar suas descobertas. Mantenha-o atualizado com novas dicas e truques que você aprender.

## 6. Resolução de Problemas (Troubleshooting)

Mesmo com as melhores ferramentas, problemas podem ocorrer. Aqui estão soluções para cenários comuns:

*   **Copilot CLI - Falha na Autenticação**:
    *   *Sintoma*: `Error: You are not signed in.`
    *   *Solução*: Execute `gh auth login` para renovar suas credenciais do GitHub CLI, que o Copilot utiliza.

*   **Gemini CLI - Erro de Quota (429)**:
    *   *Sintoma*: `ResourceExhausted` ou erros de limite de taxa.
    *   *Solução*: Verifique sua cota no Google AI Studio. Implemente um "backoff exponencial" (espera progressiva) em seus scripts se estiver fazendo muitas requisições seguidas.

*   **Xcode CLI - "Command not found"**:
    *   *Sintoma*: O terminal não reconhece `xcodebuild` ou `xcrun`.
    *   *Solução*: Redefina o caminho das ferramentas com `sudo xcode-select --reset` ou aponte manualmente com `sudo xcode-select -s /Applications/Xcode.app`.

Ao aplicar essas práticas, você transformará seu terminal em um ambiente de desenvolvimento ainda mais poderoso e eficiente, alavancando a inteligência artificial para otimizar cada etapa do processo.