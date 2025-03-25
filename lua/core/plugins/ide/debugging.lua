return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
    },
    lazy = false, -- Ensure it's always loaded
    config = function()
      local dap = require 'dap'

      dap.adapters.python = {
        type = 'executable',
        command = '/usr/bin/python3',
        args = { '-m', 'debugpy.adapter' },
      }

      dap.configurations.python = {
        {
          type = 'python', -- Correct
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          pythonPath = function()
            return '/usr/bin/python3' -- Adjust if using a virtual environment
          end,
        },
      }
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio', -- Required for nvim-dap-ui
    },
    config = function()
      require('dapui').setup()
    end,
  },
  {
    'mfussenegger/nvim-dap-python',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      require('dap-python').setup '/usr/bin/python3' -- Adjust path if needed
    end,
  },
}
