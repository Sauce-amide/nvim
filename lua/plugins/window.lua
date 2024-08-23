return {
  "yorickpeterse/nvim-window",
  opts = {
    chars = {
      '1', '2', '3', '4', '5', '6', '7'
    },
  },
  keys = {
    { "<leader>j", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
  },
  config = function (_,opts)
    require('nvim-window').setup(opts)
  end,
}
