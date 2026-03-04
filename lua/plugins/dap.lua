return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      -- UI for nvim-dap
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup()

      -- Automatically open/close dapui when debugging starts/ends
      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      -- Keymaps
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[D]ebug Toggle [B]reakpoint' })
      vim.keymap.set('n', '<leader>dB', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = '[D]ebug [B]reakpoint Condition' })
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[D]ebug [C]ontinue' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[D]ebug Step [I]nto' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = '[D]ebug Step [O]ver' })
      vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = '[D]ebug Step [O]ut' })
      vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = '[D]ebug [T]erminate' })
      vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = '[D]ebug [U]I Toggle' })
    end,
  },
}
