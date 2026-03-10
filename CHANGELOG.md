# Changelog

| Category    | Commit               | Description                                                       |
| ----------- | -------------------- | ----------------------------------------------------------------- |
| Claude.md   | [`02319cc`](02319cc) | Add CLAUDE.md                                                     |
| TypeScript  | [`c832eb6`](c832eb6) | Drop `typescript-tools.nvim`; use `vtsls` only via LazyVim extras |
| Mermaid     | [`8fcd58f`](8fcd58f) | Add mermaid rendering with `image.nvim` (`<leader>md`)            |
| Telescope   | [`e8e96e8`](e8e96e8) | Add `telescope-symbols` extension                                 |
| Telescope   | [`b9ce335`](b9ce335) | Add `nvim-dap` and `telescope-dap` extension                      |
| Telescope   | [`38ca908`](38ca908) | Add `telescope-file-browser` extension                            |
| Telescope   | [`bed3f1f`](bed3f1f) | Add `telescope-frecency` extension                                |
| Telescope   | [`32cf28a`](32cf28a) | Add `telescope-github` extension                                  |
| Claude Code | [`33af574`](33af574) | Add `claude-code` plugin                                          |
| DB          | [`9dd5e06`](9dd5e06) | Add `vim-dadbod` and completions                                  |
| Git         | [`15e873c`](15e873c) | Add `vim-fugitive`, `vim-rhubarb`, `gitsigns`, and `copilot`      |

## Notes

**TypeScript**: Both `typescript-tools.nvim` (direct tsserver protocol) and
`lazyvim.plugins.extras.lang.typescript` (which configures vtsls as the LSP) can attach to TS
buffers simultaneously, causing duplicate diagnostics and completions. LazyVim switched to vtsls as
its default — dropped `typescript-tools.nvim` to avoid conflicts.

## On Deck

- <https://dotfyle.com/plugins/folke/trouble.nvim> - help solve problems
- <https://github.com/dmmulroy/ts-error-translator.nvim> — ports Matt Pocock's popular VSCode extension that rewrites cryptic TypeScript errors into plain English. Pairs well with your existing setup.
- neotest adapter — you have neotest but no TypeScript test runner adapter. Depending on what you use: <https://github.com/marilari88/neotest-vitest> or <https://github.com/nvim-neotest/neotest-jest>.
- <https://github.com/nvimdev/lspsaga.nvim> - better LSP experience
- <https://github.com/folke/zen-mode.nvim> - zen mode - single file
- <https://github.com/akinsho/toggleterm.nvim> - toggle-term
