# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a LazyVim-based Neovim configuration extending the starter template with custom plugins and language-specific support. Plugin management uses lazy.nvim with LazyVim as the base framework.

## Common Commands

```bash
# Format Lua files (2-space indent, 120 col width per stylua.toml)
stylua lua/ --check
stylua lua/ --config-path stylua.toml

# Sync/update all plugins (headless)
nvim --headless "+Lazy! sync" +qa

# Check health of Neovim and installed tools
nvim +checkhealth
```

## Architecture

```
init.lua                   # Entry point — bootstraps lazy.nvim via config/lazy.lua
lua/config/
  lazy.lua                 # lazy.nvim setup: imports LazyVim + lua/plugins/**
  options.lua              # Neovim options (extends LazyVim defaults)
  keymaps.lua              # Custom keymaps (extends LazyVim defaults)
  autocmds.lua             # Autocmds (e.g., disables diagnostics in markdown)
lua/plugins/
  appearance.lua           # UI plugins: tokyonight, trouble, mini.*, flash, bqf, etc.
  git.lua                  # Git: fugitive, gitsigns, copilot, openingh
  filesystem.lua           # File nav: oil.nvim, telescope-file-browser, grapple
  tests.lua                # neotest integration
  db.lua                   # vim-dadbod + completion
  dap.lua                  # nvim-dap + dapui with keymaps under <leader>d
  claude-code.lua          # claudecode.nvim integration under <leader>a
  language/
    golang.lua             # go.nvim with Bazel GOPACKAGESDRIVER auto-detection
    rust.lua               # rustaceanvim
    elixir.lua             # elixir-tools.nvim
lazyvim.json               # LazyVim extras (AI, DAP, formatting, languages, etc.)
stylua.toml                # Lua formatter config
```

## Key Patterns

**Adding plugins**: Create or edit a file in `lua/plugins/`. Each file returns a table (or list of tables) in lazy.nvim spec format. Language-specific plugins go in `lua/plugins/language/`.

**LazyVim extras**: Managed via `lazyvim.json`. To enable an extra, add it to the `"extras"` array. Enabled extras include Copilot, DAP, Telescope, Prettier/Black/Biome, and language support for Go, Rust, TypeScript, Python, Elixir, and more.

**Go/Bazel integration**: `golang.lua` auto-detects `tools/bazel/gopackagesdriver.sh` at the git root and sets `GOPACKAGESDRIVER` accordingly via a custom `on_init` LSP callback.

**Markdown**: Diagnostics are disabled for markdown buffers via `autocmds.lua`.

## Custom Keybindings

- `<leader>a*` — Claude Code (toggle, focus, resume, add buffer, send selection, accept/deny diff)
- `<leader>d*` — DAP debug (breakpoint, continue, step into/over/out, terminate, UI toggle)
- `<leader>h*` — Grapple file tags (tag, open menu, jump to 1–4, cycle next/prev)

## External Dependencies (not managed by Mason)

```bash
npm install -g neovim              # Required by various plugins
npm install -g @mermaid-js/mermaid-cli  # Mermaid diagram rendering
brew install fzf gh d2 gnuplot imagemagick
```
