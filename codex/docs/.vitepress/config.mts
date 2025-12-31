import { defineConfig } from 'vitepress'

export default defineConfig({
  title: "Codex - Guias de CLI",
  description: "Explorando GitHub Copilot, Gemini CLI e Xcode CLI",
  head: [
    ['link', { rel: 'icon', href: '/favicon.svg', type: 'image/svg+xml' }],
    // Algolia DocSearch CSS
    ['link', { rel: 'stylesheet', href: 'https://cdn.jsdelivr.net/npm/@docsearch/css@3' }]
  ],
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
          { text: 'Exemplos Práticos', link: '/integracao' },
          { text: 'Exemplos de Scripts Reais', link: '/examples' }
        ]
      },
      {
        text: 'Melhores Práticas',
        items: [
          { text: 'Combinando o Poder das CLIs', link: '/best-practices' }
        ]
      },
      {
        text: 'Configuração do Site',
        items: [
          { text: 'Domínio Personalizado', link: '/custom-domain' }
        ]
      }
    ],

    // Algolia DocSearch
    // Para configurar a busca, você precisará de um App ID, API Key e Index Name do Algolia DocSearch.
    // Registre seu site no DocSearch: https://docsearch.algolia.com/
    // Após a aprovação, você receberá suas credenciais.
    algolia: {
      appId: 'YOUR_ALGOLIA_APP_ID', // Substitua pelo seu Algolia App ID
      apiKey: 'YOUR_ALGOLIA_API_KEY', // Substitua pela sua Algolia Search API Key
      indexName: 'YOUR_ALGOLIA_INDEX_NAME' // Substitua pelo seu Algolia Index Name
    }
  }
})
