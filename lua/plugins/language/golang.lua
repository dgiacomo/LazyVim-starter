local opts = {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  version = "v0.10.0",
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  on_init = function()
    local f = io.open("./tools/bazel/gopackagesdriver.sh", "r")
    if f ~= nil then
      io.close(f)
      dir = vim.fn.getcwd()
      vim.fn.setenv("GOPACKAGESDRIVER", dir .. "/tools/bazel/gopackagesdriver.sh")
    else
      vim.fn.setenv("GOPACKAGESDRIVER", "")
    end
  end,
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  config = function()
    require("go").setup({
      lsp_inlay_hints = {
        enable = true,
      },
      lsp_cfg = {
        settings = {
          gopls = {
            usePlaceholders = false,
            analyses = {
              ST1003 = false,
            },
            buildFlags = { "-tags", "integration,unit,endtoendtest,smoke" },
          },
        },
      },
      lsp_keymaps = false,
      run_in_floaterm = true,
      floaterm = { -- position
        posititon = "right", -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
        title_colors = "monokai", -- default to nord, one of {'nord', 'tokyo', 'dracula', 'rainbow', 'solarized ', 'monokai'}
        -- can also set to a list of colors to define colors to choose from
        -- e.g {'#D8DEE9', '#5E81AC', '#88C0D0', '#EBCB8B', '#A3BE8C', '#B48EAD'}
      },
      trouble = true, -- true: use trouble to open quickfix
      icons = false,
      dap_debug_keymap = false,
      dap_debug_gui = false,
    })
  end,
}
return opts
