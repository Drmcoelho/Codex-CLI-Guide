# Gemini CLI

O Gemini CLI permite interagir com o modelo de inteligência artificial Gemini diretamente do seu terminal, oferecendo uma maneira didática e interativa de explorar suas capacidades.

## Instalação e Configuração

Para usar o Gemini CLI, você precisa de uma chave de API do Google Gemini.

1.  **Obtenha uma Chave de API:**
    *   Vá para o [Google AI Studio](https://aistudio.google.com/app/apikey).
    *   Crie ou selecione um projeto e gere sua chave de API.

2.  **Configure a Chave de API (variável de ambiente):**
    É altamente recomendável definir sua chave de API como uma variável de ambiente para evitar expô-la em seu código.

    ```bash
    export GOOGLE_API_KEY="SUA_CHAVE_DE_API_AQUI"
    ```
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

```bash
gemini chat
```

Você será saudado por um prompt onde pode digitar suas perguntas. O Gemini manterá o contexto da conversa.

**Exemplo de interação:**

```
>>> gemini chat
You: Me conte uma piada.
Gemini: Por que o tomate não foi à festa? Porque ele estava `passado`!
You: Que tipo de piadas você gosta?
Gemini: Eu gosto de piadas que me fazem "pensar"... mas como sou uma IA, isso é figurativo! Talvez piadas sobre computação ou lógica sejam as minhas favoritas.
You: Me dê um script simples em Python para listar arquivos em um diretório.
Gemini: Claro! Aqui está um script Python básico:

```python
import os

def list_files_in_directory(path='.'):
    """Lists all files and directories in a given path."""
    for item in os.listdir(path):
        print(item)

if __name__ == "__main__":
    list_files_in_directory()
```

### 2. Geração de Conteúdo Único com `gemini generate`

Use `gemini generate` para obter respostas diretas ou criar conteúdo específico sem iniciar uma sessão de chat contínua.

**Exemplo 1: Gerar um trecho de código**

```bash
gemini generate "Me escreva uma função em JavaScript para calcular o fatorial de um número."
```

O Gemini pode retornar algo como:

```javascript
function factorial(n) {
  if (n === 0 || n === 1) {
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}

// Exemplo de uso:
console.log(factorial(5)); // Saída: 120
```

**Exemplo 2: Obter uma explicação rápida**

```bash
gemini generate "O que é um algoritmo de ordenação 'Bubble Sort'?"
```

O Gemini fornecerá uma explicação concisa sobre o Bubble Sort.

Lembre-se que a qualidade e o formato das respostas podem variar. Experimente diferentes prompts para obter os melhores resultados!
