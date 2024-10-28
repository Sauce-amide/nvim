return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    -- stylua: ignore
    keys = {
      -- { "<c-e>", function() require("dapui").eval() end, desc = "Eval", mode = { "n", "v" } },
      { "<leader>de", function() require("dapui").eval() require("dapui").eval() end, desc = "Eval Value"},
      { "<leader>du", function() require("dapui").toggle(2) end, desc = "Dap UI" },
    },
    opts = function(_, opts)
      opts.mappings = {
        expand = { "o", "<CR>" },
        open = "O",
      }
    end,
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        -- dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        -- dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        -- dapui.close({})
      end
    end,
  },
  {
    "LiadOz/nvim-dap-repl-highlights",
    opts = function()
      require('nvim-dap-repl-highlights').setup()
    end
  },
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<m-b>",      function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<m-c>",      function() require("dap").continue() end,          desc = "Continue" },
      { "<m-o>",      function() require("dap").step_over() end,         desc = "Step over" },
      { "<m-i>",      function() require("dap").step_into() end,         desc = "Step over" },
      { "<leader>dv", "<cmd>DapVirtualTextToggle<cr>",                   desc = "Toggle Dap Virtual-text" },
      { "<leader>dd", function() vim.diagnostic.open_float() vim.diagnostic.open_float() end, desc = "Float diagnostic" },
      { "<leader>df", function() vim.diagnostic.open_float() vim.diagnostic.open_float() end, desc = "Float diagnostic" },
      { "<leader>dr", function() require("dap").repl.toggle({height = 15}) end, desc = "Toggle REPL" },
    },
    opts = function()
      require("dap").configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch my file",
          program = "${file}",
          cwd = vim.fn.getcwd(),
        }
      }
      table.insert(require("dap").configurations.go, 1,
        {
          type = "go",
          name = "Debug with intergrated console",
          request = "launch",
          program = "${workspaceFolder}/main.go",
        }
      )
      require("dap").configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003
        }
      }
    end,
  },
}
