# Configurando um Domínio Personalizado no GitHub Pages

Ter um domínio personalizado para sua documentação do VitePress hospedada no GitHub Pages adiciona um toque profissional e facilita o acesso. Este guia descreve os passos necessários para configurar isso.

## Pré-requisitos

*   Um domínio registrado (ex: `meudominio.com`).
*   Acesso às configurações DNS do seu domínio.
*   Seu projeto VitePress implantado no GitHub Pages.

## Passos para Configurar o Domínio Personalizado

### 1. Criar um Arquivo `CNAME`

No diretório `public` do seu projeto VitePress (que é `codex/docs/public` neste projeto), crie um arquivo chamado `CNAME` (sem extensão) contendo apenas o seu domínio personalizado.

**Exemplo de `codex/docs/public/CNAME`:**

```
docs.meudominio.com
```

Ou, se você estiver usando o domínio raiz:

```
meudominio.com
```

Este arquivo é essencial para que o GitHub Pages saiba qual domínio ele deve servir.

### 2. Configurar os Registros DNS do Seu Domínio

Você precisará adicionar ou modificar os registros DNS para o seu domínio no painel de controle do seu provedor de domínio (ex: GoDaddy, Namecheap, Cloudflare).

#### Para um Subdomínio (ex: `docs.meudominio.com`)

Crie um registro `CNAME` que aponte do seu subdomínio para `SEU_USUARIO.github.io` (ou `SEU_USUARIO.github.io/SEU_REPOSITORIO` se for um projeto de repositório).

**Exemplo:**
*   **Tipo**: `CNAME`
*   **Nome**: `docs` (ou o nome do seu subdomínio)
*   **Valor**: `drmcoelho.github.io` (substitua `drmcoelho` pelo seu nome de usuário GitHub)

#### Para um Domínio Raiz (ex: `meudominio.com`)

Crie registros `A` que apontem para os endereços IP do GitHub Pages. Estes IPs podem mudar, então é bom verificar a documentação oficial do GitHub Pages para os IPs mais recentes, mas geralmente são:

*   **Tipo**: `A`
*   **Nome**: `@` (ou vazio, dependendo do seu provedor)
*   **Valor**: `185.199.108.153`
*   **Tipo**: `A`
*   **Nome**: `@`
*   **Valor**: `185.199.109.153`
*   **Tipo**: `A`
*   **Nome**: `@`
*   **Valor**: `185.199.110.153`
*   **Tipo**: `A`
*   **Nome**: `@`
*   **Valor**: `185.199.111.153`

### 3. Configurar o GitHub Pages no seu Repositório

Vá para as configurações do seu repositório no GitHub (`Settings` -> `Pages`).
*   Em "Custom domain", insira seu domínio personalizado (ex: `docs.meudominio.com`).
*   Clique em "Save".

O GitHub Pages verificará seus registros DNS. Pode levar alguns minutos (ou até algumas horas) para que as alterações de DNS se propaguem e o domínio comece a funcionar.

### 4. Forçar HTTPS

Após a configuração, geralmente há uma opção para "Enforce HTTPS" nas configurações do GitHub Pages. Certifique-se de que esta opção esteja marcada para garantir que seu site seja servido via HTTPS.

## Notas Importantes

*   Se você estiver usando o workflow de CI/CD que configuramos, o arquivo `CNAME` deve ser incluído no seu build e deploy. O `actions/upload-pages-artifact` deve pegar este arquivo se ele estiver no diretório `codex/docs/public`.
*   A propagação de DNS pode levar algum tempo. Seja paciente.
*   Consulte a documentação oficial do GitHub Pages e do seu provedor de domínio para obter as informações mais atualizadas e específicas.

Com esses passos, sua documentação do Codex estará acessível através do seu próprio domínio personalizado!
