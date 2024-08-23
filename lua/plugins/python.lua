return {
  {
    "linux-cultist/venv-selector.nvim",
    opts = function(_, opts)
      opts.settings.options = {
        notify_user_on_venv_activation = true,
        tdap_enabled = true,
      }
    end
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "mfussenegger/nvim-dap-python",
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
        { "<leader>dPc", function() require('dap-python').test_class() end,  desc = "Debug Class",  ft = "python" },
      },
      config = function()
        if vim.fn.has("win32") == 1 then
          require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "/venv/Scripts/pythonw.exe"))
        else
          -- require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "/venv/bin/python"))
          require("dap-python").setup("/home/sauce/miniconda3/envs/core_celery/bin/python")
        end
      end,
    },
  },
}
