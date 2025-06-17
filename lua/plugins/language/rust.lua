local opts = {
  'mrcjkb/rustaceanvim',
  tag = 'v6.0.3', -- Recommended
  lazy = false, -- This plugin is already lazy
  dependencies = {
    'neovim/nvim-lspconfig',
  },
}

-- optional plugin - dots for crate graph
-- install with brew install graphviz

return opts
