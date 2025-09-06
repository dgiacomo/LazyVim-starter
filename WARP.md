# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Overview

This is a LazyVim-based Neovim configuration that extends the starter template with custom plugins and language-specific configurations. The setup uses lazy.nvim for plugin management and includes extensive language support for Go, Rust, TypeScript, Elixir, and more.

## Common Development Commands

### Neovim Configuration Management

```bash
# Launch Neovim in the config directory
nvim ~/.config/nvim

# Check Neovim health and installed tools
nvim +checkhealth

# Format Lua configuration files
stylua lua/ --check
stylua lua/ --config-path stylua.toml

# Install/update all plugins
nvim --headless "+Lazy! sync" +qa

# View plugin status
nvim +Lazy
```

### Required External Dependencies

```bash
# Install neovim Node.js package (required by various plugins)
npm install -g neovim

# Verify installation
npm list -g neovim
```

### Language-Specific Setup

#### Go Development
The Go configuration includes Bazel integration with automatic GOPACKAGESDRIVER detection:
- For Bazel projects: Automatically sets GOPACKAGESDRIVER if `tools/bazel/gopackagesdriver.sh` exists
- LSP build flags include integration, unit, endtoendtest, and smoke tags
- Uses go.nvim with floating terminal for commands

#### Rust Development
- Uses rustaceanvim for enhanced Rust support
- Optional: Install graphviz for crate dependency graphs: `brew install graphviz`

## Architecture and Code Organization

### Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Entry point - bootstraps lazy.nvim
├── lua/
│   ├── config/                 # Core configuration
│   │   ├── lazy.lua           # Lazy.nvim setup and plugin specs
│   │   ├── options.lua        # Neovim options (extends LazyVim defaults)
│   │   ├── keymaps.lua        # Custom keymaps (extends LazyVim defaults)
│   │   └── autocmds.lua       # Auto commands (includes markdown diagnostic disable)
│   └── plugins/               # Plugin configurations
│       ├── appearance.lua     # UI/visual plugins (themes, statusline, etc.)
│       ├── telescope.lua      # Fuzzy finder with extensive keybindings
│       ├── git.lua           # Git integration (fugitive, gitsigns, copilot)
│       ├── filesystem.lua     # File management (oil.nvim, grapple, file browser)
│       ├── tests.lua         # Testing framework integration
│       ├── db.lua            # Database tools
│       ├── markdown.lua      # Markdown-specific plugins
│       └── language/         # Language-specific configurations
│           ├── golang.lua    # Go with Bazel integration
│           ├── rust.lua      # Rust with rustaceanvim
│           ├── typescript.lua # TypeScript tools
│           └── elixir.lua    # Elixir support
├── stylua.toml               # Lua formatter configuration
├── lazyvim.json              # LazyVim extras and configuration
└── lazy-lock.json            # Plugin version lockfile
```

### Key Architectural Decisions

**Plugin Management**: Uses lazy.nvim with LazyVim as the base framework. Custom plugins are organized by function rather than alphabetically.

**Language Support**: Extensive language support through LazyVim extras combined with custom language-specific configurations in `lua/plugins/language/`.

**File Navigation**: Multiple approaches available:
- Oil.nvim for filesystem editing
- Telescope for fuzzy finding with extensive search capabilities
- Grapple for file tagging and quick navigation
- Neo-tree for traditional file explorer

**Go Integration**: Special Bazel workspace detection automatically configures GOPACKAGESDRIVER for monorepo development.

**Lazy Loading**: Most plugins are lazy-loaded based on file types or commands to optimize startup time.

### Custom Keybindings

The Telescope configuration includes extensive search keybindings under `<leader>s`:
- `<leader>sf` - Find files
- `<leader>sg` - Live grep
- `<leader>sw` - Search current word
- `<leader>sl` - Live grep with arguments
- `<leader>sn` - Search Neovim config files
- `<leader>s<leader>` - Switch buffers

Grapple (file tagging) uses `<leader>h`:
- `<leader>ha` - Tag current file
- `<leader>ho` - Open tags menu
- `<leader>h1-4` - Jump to tagged files 1-4

### LazyVim Extras Integration

The configuration leverages many LazyVim extras (see lazyvim.json):
- AI: Copilot integration and chat
- DAP: Debug adapter protocol support
- Formatting: Prettier, Black, Biome
- Languages: Go, Rust, TypeScript, Python, Elixir, and more
- Testing: Core testing framework integration

### Development Workflow

This configuration is optimized for:
1. **Multi-language development** with strong Go/Bazel integration
2. **Git-heavy workflows** with fugitive, gitsigns, and GitHub integration
3. **Search-driven navigation** via Telescope with hidden file support
4. **Modern editing features** via mini.nvim plugins (surround, move, pairs)
5. **Code quality** with integrated LSP, diagnostics, and formatting

### Customization Points

- Markdown files have diagnostics disabled (see autocmds.lua)
- Telescope searches include hidden files by default
- Go configuration detects Bazel workspaces automatically
- Plugin versions are pinned for stability (telescope, go.nvim, typescript-tools)
