-- Get git root directory
local function get_git_root()
  local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null")
  if vim.v.shell_error == 0 then
    return vim.fn.trim(git_root)
  end
  return nil
end

local function custom_on_init()
  local project_root = get_git_root()
  local f = io.open(project_root .. "/tools/bazel/gopackagesdriver.sh", "r")
  if f ~= nil then
    io.close(f)
    local gopackagesdriver = vim.fn.expand(project_root .. "/tools/bazel/gopackagesdriver.sh")
    vim.fn.setenv("GOPACKAGESDRIVER", gopackagesdriver)
    vim.notify("GOPACKAGESDRIVER set to " .. gopackagesdriver, vim.log.levels.INFO)
  else
    vim.fn.setenv("GOPACKAGESDRIVER", "")
    vim.notify("GOPACKAGESDRIVER unset", vim.log.levels.INFO)
  end
end

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
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  config = function()
    require("go").setup({
      lsp_inlay_hints = {
        enable = true,
      },
      lsp_cfg = {
        on_init = custom_on_init,
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
