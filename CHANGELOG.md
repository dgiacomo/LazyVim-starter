## Exploring Typescript setup

c832eb6972faa90c6ab432579cb50d0158dcabb7 - drop typescript-tools.nvim and only use vstls from lazyvim

- Had both `typescript-tools.nvim` (direct tsserver protocol) and `lazyvim.plugins.extras.lang.typescript` (which configures vtsls as the LSP). These can both
  try to attach to TS buffers, giving you duplicate diagnostics and completions. LazyVim switched to vtsls as its default. Chose vstls
