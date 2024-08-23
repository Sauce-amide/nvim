return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window.width = 30
    opts.window.mappings = {
      ["oc"] = "none",
      ["od"] = "none",
      ["og"] = "none",
      ["om"] = "none",
      ["on"] = "none",
      ["os"] = "none",
      ["ot"] = "none",
      ["o"] = "open",
      ["s"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "s" } },
      ["sc"] = { "order_by_created", nowait = false },
      ["sd"] = { "order_by_diagnostics", nowait = false },
      ["sg"] = { "order_by_git_status", nowait = false },
      ["sm"] = { "order_by_modified", nowait = false },
      ["sn"] = { "order_by_name", nowait = false },
      ["ss"] = { "order_by_size", nowait = false },
      ["st"] = { "order_by_type", nowait = false },
      -- Lazyvim
      ["l"] = "open",
      ["h"] = "close_node",
      ["<space>"] = "none",
      ["Y"] = {
        function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.setreg("+", path, "c")
        end,
        desc = "Copy Path to Clipboard",
      },
      ["O"] = {
        function(state)
          require("lazy.util").open(state.tree:get_node().path, { system = true })
        end,
        desc = "Open with System Application",
      },
      ["P"] = { "toggle_preview", config = { use_float = false } },
    }
  end,
  -- opts = {
  --   filesystem = {
  --     window = {
  --       width = 30,
  --       mappings = {
  --         ["oc"] = "none",
  --         ["od"] = "none",
  --         ["og"] = "none",
  --         ["om"] = "none",
  --         ["on"] = "none",
  --         ["os"] = "none",
  --         ["ot"] = "none",
  --         ["o"] = "open",
  --         ["s"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "s" } },
  --         ["sc"] = { "order_by_created", nowait = false },
  --         ["sd"] = { "order_by_diagnostics", nowait = false },
  --         ["sg"] = { "order_by_git_status", nowait = false },
  --         ["sm"] = { "order_by_modified", nowait = false },
  --         ["sn"] = { "order_by_name", nowait = false },
  --         ["ss"] = { "order_by_size", nowait = false },
  --         ["st"] = { "order_by_type", nowait = false },
  --       }
  --     }
  --   }
  -- }
}
