return {
    'mfussenegger/nvim-dap',

    dependencies = {
        'jay-babu/mason-nvim-dap.nvim',
        'rcarriga/nvim-dap-ui',
    },

    keys = {
      {
        '<leader>tb',
        function () require('dap').toggle_breakpoint() end,
        desc = 'Toggle Breakpoint',
      },
      {
        '<leader>nb',
        function () require('dap').continue() end,
        desc = 'Start Debugging',
      },
      {
        '<leader><C-down>',
        function () require('dap').continue() end,
        desc = 'Dap: Continue',
      },
      {
         '<leader><up>',
        function () require('dap').restart_frame() end,
        desc = 'Dap: Restart Frame',
      },
      {
        '<leader><down>',
        function () require('dap').step_over() end,
        desc = 'Dap: Step over',
      },
      {
        '<leader><right>',
        function () require('dap').step_into() end,
        desc = 'Dap: Step into',
      },
      {
        '<leader><left>',
        function () require('dap').step_out() end,
        desc = 'Dap: Step out',
      },
    },

    config = function()
      local dap = require('dap')
      dap.configurations.cpp = {
          {
              type = 'codelldb';
              request = 'launch';
              name = "Launch cpp file";
              program = function()
                  return vim.fn.input(
                    "Path to executable: ",
                    vim.fn.getcwd() .. "\\build\\debug\\bin\\",
                    "file")
              end,
              cwd = "${workspaceFolder}",
              stopOnEntry = false,
          },
      }

      dap.configurations.c = dap.configurations.cpp

      dap.adapters.codelldb = {
          type = "server",
          port = "${port}",
          executable = {
              command = vim.fn.stdpath("data") .. "\\mason\\bin\\codelldb.cmd",
              args = { "--port", "${port}" },
          },
      }

      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb" },
        automatic_installation = true,
      })

      vim.fn.sign_define('DapBreakpoint', {
        text='🛑',
        texthl='',
        linehl='',
        numhl=''
      })

    end,
}
