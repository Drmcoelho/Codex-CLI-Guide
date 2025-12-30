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
