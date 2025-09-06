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

# Configuration

There is a `lua/config` directory that has a place to set

Autocmds and keymaps loaded on the VeryLazy event. Options are automatically loaded before lazy.nvim startup

- `autocmds`: [Default autocmds](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua)
- `keymaps`: [Default keymaps](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua)

* `lazy`: Config for lazy.nvim itself. Can set lazyload, always use latest versions, disable specific plugins, set available colorschemes, check for plugin updates and notify when there is something new
* `options`: [Default options](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua)

## Autocmds
