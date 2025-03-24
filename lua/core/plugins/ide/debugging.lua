return {
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    config = function()
      local dap = require 'dap'

      dap.adapters.python = {
        type = 'executable',
        command = 'python',
        args = { '-m', 'debugpy.adapter' },
      }

      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          pythonPath = function()
            return 'python' -- Adjust if using a virtual environment
          end,
        },
      }
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      require('dapui').setup()
    end,
  },
  {
    'mfussenegger/nvim-dap-python',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      require('dap-python').setup 'python' -- Adjust path if needed
    end,
  },
}
