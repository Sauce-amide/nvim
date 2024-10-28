return {
  {
    "linux-cultist/venv-selector.nvim",
    opts = { debug = true }
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    opts = function(_, opts)
      opts.settings.options = {
        debug = true,
        notify_user_on_venv_activation = true,
        dap_enabled = true,
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
        -- 获取虚拟环境的根路径
        local handle = io.popen("which python")
        local python_path = handle:read("*a")
        handle:close()
        local venv_path = python_path:match("(.*/bin/)"):gsub("/bin/$", "")

        if vim.fn.has("win32") == 1 then
          require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "/venv/Scripts/pythonw.exe"))
        else
          -- require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "/venv/bin/python"))
          require("dap-python").setup(venv_path .. "/bin/python")
          -- vim.notify("nvim-dap-python setup done: "..venv_path.."/bin/python")
          -- require("dap-python").setup("/home/sauce/miniconda3/envs/core_celery/bin/python")
          -- local python_interpreter = require('venv-selector').venv()
        end
      end,
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-treesitter/nvim-treesitter"
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          -- Here you can specify the settings for the adapter, i.e.
          -- runner = "/home/sauce/miniconda3/envs/core_celery/bin/pytest",
          runner = "pytest",
          -- python = ".venv/bin/python",
          pytest_discover_instances = true,
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local handle = io.popen("which python")
      local python_path = handle:read("*a")
      handle:close()
      local venv_path = python_path:match("(.*/bin/)"):gsub("/bin/$", "")

      local lspconfig = require("lspconfig")
      require("lspconfig.configs").pyls = {
        default_config = {
          cmd = { venv_path .. "/bin/pyls" }, -- 指定 pyls 解释器路径
          filetypes = { "python" },
          root_dir = function(fname)
            return lspconfig.util.find_git_ancestor(fname) or lspconfig.util.path.dirname(fname)
          end,
          settings = {
            pyls = {
              configurationSources = { "flake8" },
              plugins = {
                jedi_completion = { enabled = true },
                jedi_hover = { enabled = true },
                jedi_references = { enabled = true },
                jedi_signature_help = { enabled = true },
                jedi_symbols = { enabled = true, all_scopes = true },
              },
            },
          },
        },
      }

      opts.servers.pyls = {
        settings = {
          pyls = {
            plugins = {
              pycodestyle = {
                enabled = false,     -- 如果想禁用 pycodestyle 完全，设置为 false
                ignore = { "E301" }, -- 禁用特定的错误
                maxLineLength = 155, -- 可自定义行的最大长度
              },
              pylint = {
                enabled = true,
                args = {
                  '--errors-only',
                  "--load-plugins",
                  "pylint_django",
                  "--django-settings-module=app.settings",
                },
              },
              jedi = {
                enabled = true,
              },
              flake8 = {
                enabled = false,     -- 启用 flake8
                maxLineLength = 200, -- 设定最大行长度
                args = { "--ignore=E201,E301" },
              },
            },
          },
        },
        cmd = { venv_path .. "/bin/pyls" },
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local servers = { "pyls", "ruff", "pyright" }
      for _, server in ipairs(servers) do
        opts.servers[server] = opts.servers[server] or {}
        opts.servers[server].enabled = server == "pyls"
      end
    end,
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, opts)
  --     -- 获取虚拟环境的根路径
  --     local function get_venv_path()
  --       local handle = io.popen("which python")
  --       local python_path = handle:read("*a")
  --       handle:close()
  --       return python_path:match("(.*/bin/)")
  --     end
  --
  --     local function get_python_version(venv_path)
  --       local python_cmd = venv_path and (venv_path .. "/bin/python") or "python"
  --       local handle = io.popen(python_cmd .. " --version 2>&1")
  --       local result = handle:read("*a")
  --       handle:close()
  --       return result:match("%d+%.%d+")
  --     end
  --
  --     local function select_lsp_for_python(opts)
  --       local venv_path = get_venv_path()
  --       local python_version = get_python_version()
  --       vim.notify("prepare to select lsp for python")
  --       if python_version and python_version:match("^2") then
  --         vim.notify("Python 2 now!")
  --         -- pylsp 的配置
  --         opts.servers.pylsp = {
  --           on_new_config = function(new_config, _)
  --             if venv_path then
  --               new_config.cmd = { venv_path .. "/bin/pylsp" }
  --             else
  --               new_config.cmd = { "pylsp" }
  --             end
  --           end,
  --           settings = { pylsp = { plugins = {
  --                 pycodestyle = {
  --                   enabled = false,       -- 如果想禁用 pycodestyle 完全，设置为 false
  --                   -- ignore = { "E231", "E501", "E261", "E401", "E131" }, -- 禁用特定的错误
  --                   maxLineLength = 155,   -- 可自定义行的最大长度
  --                 },
  --                 pylint = {
  --                   enabled = true,
  --                   executable = function()
  --                     return venv_path and (venv_path .. "/bin/pylint") or "pylint"
  --                   end,
  --                 },
  --                 jedi = {
  --                   environment = function()
  --                     return venv_path or nil
  --                   end,
  --                 },
  --           }, }, }, }
  --       else
  --         opts.servers.pylsp = nil
  --       end
  --     end
  --
  --     -- 在 VimEnter 或打开 Python 文件时根据 Python 版本选择 LSP
  --     vim.api.nvim_create_autocmd("BufReadPre", {
  --       pattern = "*.py",
  --       callback = function()
  --         vim.notify("Python file detected, running LSP setup")
  --         select_lsp_for_python(opts)
  --       end,
  --     })
  --   end,
  -- }

}
