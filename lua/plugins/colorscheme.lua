return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
      -- colorscheme = "everforest",
    },
  },

  { "ellisonleao/gruvbox.nvim", lazy = false },
  { "folke/tokyonight.nvim", lazy = false },
  { "catppuccin/nvim", lazy = false },
  { "shaunsingh/nord.nvim", lazy = false },
  { "Mofiqul/vscode.nvim", lazy = false },
  {
    "neanias/everforest-nvim",
    lazy = false,
    config = function()
      require("everforest").setup({
        background = "hard",
      })
    end,
  },
}
