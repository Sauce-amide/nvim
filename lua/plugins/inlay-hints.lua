return {
  "MysticalDevil/inlay-hints.nvim",
  keys = {
    { "<leader>ch", "<cmd>InlayHintsToggle<CR>", desc = "Toggle hints" },
  },
  event = "LspAttach",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    require("inlay-hints").setup()
  end
}
