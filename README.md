# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# Installation of tools not handled by lazy.nvim / mason

#### Neovim node package

The neovim node package provides Node.js client support for Neovim's remote API, which is commonly used by:
• Neovim plugins that need Node.js functionality
• Language servers and completion engines
• Various Neovim integrations that communicate with Node.js processes

`npm install -g neovim`

If you run `:checkhealth` it will warn if this is not installed.

#### fzf

`brew install fzf`

#### GitHub CLI (required for telescope-github.nvim)

Install the [GitHub CLI](https://github.com/cli/cli#installation) and authenticate:

```sh
brew install gh
gh auth login
```

#### diagram.nvim (diagram rendering in terminal)

`diagram.nvim` renders diagrams inline in the terminal using [image.nvim](https://github.com/3rd/image.nvim), which requires either the [Kitty](https://github.com/kovidgoyal/kitty) terminal or [Überzug++](https://github.com/jstkdng/ueberzugpp).

Install CLI tools for the renderers you want to use:

```sh
# Mermaid
npm install -g @mermaid-js/mermaid-cli

brew install d2
brew install gnuplot
brew install imagemagick
brew install jstkdng/programs/ueberzugpp
```

Use `<leader>md` in a markdown file to open a rendered diagram from the code block at cursor.

#### checkhealth

`npm install -g tree-sitter-cli` : used for generating parsers from grammar definitions
missing image conversion tools

# Configuration

There is a `lua/config` directory that has a place to set

Autocmds and keymaps loaded on the VeryLazy event. Options are automatically loaded before lazy.nvim startup

- `autocmds`: [Default autocmds](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua)
- `keymaps`: [Default keymaps](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua)

- `lazy`: Config for lazy.nvim itself. Can set lazyload, always use latest versions, disable specific plugins, set available colorschemes, check for plugin updates and notify when there is something new
- `options`: [Default options](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua)

## Autocmds
