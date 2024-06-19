return {
  -- LSP keymaps
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "c", "cpp" })
      end
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("neo-tree").setup({
        window = {
          width = 35,
          mappings = {
            -- ['e'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
            -- ['b'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
            -- ['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
            ["o"] = "open",
            ["oc"] = "none",
            ["od"] = "none",
            ["og"] = "none",
            ["om"] = "none",
            ["on"] = "none",
            ["os"] = "none",
            ["ot"] = "none",
            -- ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
            ["s"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
            ["sc"] = { "order_by_created", nowait = false },
            ["sd"] = { "order_by_diagnostics", nowait = false },
            ["sg"] = { "order_by_git_status", nowait = false },
            ["sm"] = { "order_by_modified", nowait = false },
            ["sn"] = { "order_by_name", nowait = false },
            ["ss"] = { "order_by_size", nowait = false },
            ["st"] = { "order_by_type", nowait = false },
            -- ["s"] = "open_vsplit",
            ["|"] = "open_vsplit",
            -- ["S"] = "open_split",
            ["-"] = "open_split",
          },
        },
      })
    end,
  },

  {
    "folke/todo-comments.nvim",
    -- stylua: ignore
    lazy = false,
    opts = {
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "BREAKPOINT" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      highlight = {
        pattern = [[.*<(KEYWORDS)\s*:]],
      },
      search = {
        -- pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        pattern = [[\b(KEYWORDS):]], -- match without the extra colon. You'll likely get false positives
      },
      -- list of named colors where we try to extract the guifg from the
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
      },
    },
  },
}
