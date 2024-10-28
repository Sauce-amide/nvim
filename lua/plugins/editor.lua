return {
  {
    'stevearc/aerial.nvim',
    opts = {
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        -- "Struct",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim"
        },
        opts = { lsp = { auto_attach = true } }
      }
    },
    keys = {
      { "<leader>n", "<cmd>Navbuddy<cr>", desc = "Open NavBuddy" },
    },
    -- your lsp config or other stuff
  },
}
