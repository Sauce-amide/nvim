return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<c-\>]],
    },
    keys = {
      -- {"<m-3>",":ToggleTerm size=40 dir=~/Desktop direction=float name=desktop"},
      { "<m-1>", [[<cmd>ToggleTerm size=20 direction=horizontal<cr>]], mode = "n" },
      { "<m-2>", [[<cmd>ToggleTerm size=60 direction=vertical<cr>]], mode = "n" },
      { "<m-3>", [[<cmd>ToggleTerm size=40 direction=float<cr>]], mode = "n" },
      { "<m-1>", "<cmd>close<cr>", mode = "t" },
      { "<m-2>", "<cmd>close<cr>", mode = "t" },
      { "<m-3>", "<cmd>close<cr>", mode = "t" },
    },
  },
}
