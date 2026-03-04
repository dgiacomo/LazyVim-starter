local opts = { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  commit = 'a4ed82509cecc56df1c7138920a1aeaf246c0ac5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    {
      'nvim-telescope/telescope-live-grep-args.nvim',
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = '^1.0.0',
    },
    { 'nvim-telescope/telescope-github.nvim' },
    { 'nvim-telescope/telescope-frecency.nvim' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'nvim-telescope/telescope-dap.nvim' },
    { 'nvim-telescope/telescope-symbols.nvim' },
    { 'nvim-telescope/telescope-media-files.nvim' },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!
    --- trouble

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      pickers = {
        find_files = {
          hidden = true,
        },
        grep_string = {
          additional_args = { '--hidden' },
        },
        live_grep = {
          additional_args = { '--hidden' },
        },
      },
      defaults = {
        mappings = {
          i = {
            ['<C-q>'] = function(prompt_bufnr)
              require('telescope.actions').smart_send_to_qflist(prompt_bufnr)
              require('telescope.actions').open_qflist(prompt_bufnr)
            end,
            ['<C-f>'] = require('telescope.actions').to_fuzzy_refine,
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        file_browser = {
          hidden = true,
        },
        media_files = {
          filetypes = { 'png', 'jpg', 'jpeg', 'gif', 'mp4', 'webm', 'pdf' },
          find_cmd = 'rg',
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'live_grep_args')
    pcall(require('telescope').load_extension, 'gh')
    pcall(require('telescope').load_extension, 'frecency')
    pcall(require('telescope').load_extension, 'file_browser')
    pcall(require('telescope').load_extension, 'dap')
    pcall(require('telescope').load_extension, 'media_files')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.search_history, { desc = '[S]earch [H]istory' })
    vim.keymap.set('n', '<leader>st', builtin.help_tags, { desc = '[S]earch Help [T]ags' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sF', "<cmd>Telescope frecency workspace=CWD<CR>", { desc = '[S]earch [F]recency' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>sz', builtin.spell_suggest, { desc = '[S]pelling Suggestions' })
    vim.keymap.set('n', '<leader>se', "<cmd>Telescope symbols<CR>", { desc = '[S]earch [E]mojis/Symbols' })
    vim.keymap.set('n', '<leader>sm', "<cmd>Telescope media_files<CR>", { desc = '[S]earch [M]edia Files' })
    vim.keymap.set('n', '<leader>sqh', builtin.quickfixhistory, { desc = '[H]istory' })
    vim.keymap.set('n', '<leader>sqo', builtin.quickfix, { desc = '[O]pen quickfix list' })
    vim.keymap.set('n', '<leader>sql', builtin.loclist, { desc = 'View locList' })
    vim.keymap.set('n', '<leader>sch', builtin.command_history, { desc = '[H]istory' })
    vim.keymap.set('n', '<leader>sco', builtin.commands, { desc = '[O]pen' })
    vim.keymap.set('n', '<leader>s<leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>sl', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = '[S]earch by Live Grep' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>sC', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 0,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- GitHub extension keymaps (requires `gh` CLI)
    local gh = require('telescope').extensions.gh
    vim.keymap.set('n', '<leader>ghi', gh.issues, { desc = '[G]it[H]ub [I]ssues' })
    vim.keymap.set('n', '<leader>ghp', gh.pull_request, { desc = '[G]it[H]ub [P]ull Requests' })
    vim.keymap.set('n', '<leader>ghg', gh.gist, { desc = '[G]it[H]ub [G]ists' })
    vim.keymap.set('n', '<leader>ghr', gh.run, { desc = '[G]it[H]ub Workflow [R]uns' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sb', "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = '[S]earch File [B]rowser' })
    vim.keymap.set('n', '<leader>dsc', "<cmd>Telescope dap commands<CR>", { desc = '[D]AP [S]earch [C]ommands' })
    vim.keymap.set('n', '<leader>dsb', "<cmd>Telescope dap list_breakpoints<CR>", { desc = '[D]AP [S]earch [B]reakpoints' })
    vim.keymap.set('n', '<leader>dsv', "<cmd>Telescope dap variables<CR>", { desc = '[D]AP [S]earch [V]ariables' })
    vim.keymap.set('n', '<leader>dsf', "<cmd>Telescope dap frames<CR>", { desc = '[D]AP [S]earch [F]rames' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })

    require('telescope').load_extension 'ui-select'
  end,
}

return opts
