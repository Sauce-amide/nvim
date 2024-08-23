return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = true,
  keys = {
    { "<A-1>", "<cmd>ToggleTerm size=15 direction=horizontal<CR>", mode = { "n", "t" }, noremap = true, silent = true },
    { "<A-2>", "<cmd>ToggleTerm size=60 direction=vertical<CR>",   mode = { "n", "t" }, noremap = true, silent = true },
    { "<A-3>", "<cmd>ToggleTerm size=60 direction=float<CR>",      mode = { "n", "t" }, noremap = true, silent = true },
  },
}
