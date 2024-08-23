return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme =
      -- "nord",
      -- "catppuccin",
      -- "tokyonight",
      "everforest",
      -- "onedark",
    },
  },
  {
    "neanias/everforest-nvim",
    background = "dark",
    lazy = false,
    config = function()
      require("everforest").setup({
        background = "hard",
        -- background = "midium",
        -- background = "soft",
      })
    end,
  },
  { "Mofiqul/vscode.nvim",   lazy = false, },
  { "catppuccin/nvim",       lazy = false, },
  { "shaunsingh/nord.nvim" },
  { "folke/tokyonight.nvim", lazy = false,       opts = { style = "moon" }, },
  { "navarasu/onedark.nvim", lazy = false,       opts = { style = "warmer" }, },
  { "rose-pine/neovim",      name = "rose-pine", },
}
