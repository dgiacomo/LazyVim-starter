<!--toc:start-->

- [Claude.md](#claudemd)
- [Exploring Typescript setup](#exploring-typescript-setup)
- [Mermaid Rendering <leader+md>](#mermaid-rendering-leadermd)
- [Telescope](#telescope)
- [Claude Code](#claude-code)
- [DB Plugins - Dadbod and extensions](#db-plugins-dadbod-and-extensions)
- [Git - vim-fugitive, vim-rhubarb, gitsigns, and copilot](#git-vim-fugitive-vim-rhubarb-gitsigns-and-copilot)
<!--toc:end-->

## Claude.md

- 02319cc5e05337fbf49baa12279c0c03c57b2334 - add CLAUDE.md

## Exploring Typescript setup

c832eb6972faa90c6ab432579cb50d0158dcabb7 - drop typescript-tools.nvim and only use vstls from lazyvim

- Had both `typescript-tools.nvim` (direct tsserver protocol) and `lazyvim.plugins.extras.lang.typescript` (which configures vtsls as the LSP). These can both
  try to attach to TS buffers, giving you duplicate diagnostics and completions. LazyVim switched to vtsls as its default. Chose vstls

## Mermaid Rendering <leader+md>

- 8fcd58f04599c9a67552033b9b4f7e7b16626a69 - add mermaid rendering with image.nvim

## Telescope

- e8e96e8d6038c5fa067404af69098a0aaa7c9ed1 - add telescope-symbols extension
- b9ce335f0ff110fc006daff1df8b4b40d0b46ba7 - add nvim-dap and telescope-dap extension
- 38ca908b102519e774d75a7fc4eb6e196b0135b1 - add telescope-file-browser extension
- bed3f1fa4ba98817012bfd13b393e5c4693a89d0 - add telescope-frecency extension
- 32cf28a5459faaf36224f939aa09a73f1d963de7 - add telescrope github extension

## Claude Code

- 33af57456974a9bd36844caa9f9e8ad345dc12de - add claude code plugin

## DB Plugins - Dadbod and extensions

- 9dd5e069d0a99037667172b06da0729ddfea69e8 - add db plugins - dadbod and completions for it

## Git - vim-fugitive, vim-rhubarb, gitsigns, and copilot

- 15e873c4fcf6d3a7dc4d5503f4dbcb377f9b90f0 - adding vim-fugitive, vim-rhubarb, gitsigns and copilot
