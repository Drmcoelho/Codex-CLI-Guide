import { defineConfig } from 'vitepress'

export default defineConfig({
  title: "Codex - Guias de CLI",
  description: "Explorando GitHub Copilot, Gemini CLI e Xcode CLI",
  head: [
    ['link', { rel: 'icon', href: '/favicon.svg', type: 'image/svg+xml' }]
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
          { text: 'Exemplos Práticos', link: '/integracao' }
        ]
      }
    ]
  }
})
