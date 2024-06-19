return {
  {
    "ojroques/vim-oscyank",
    keys = {
      { "<leader>y", "<Plug>OSCYankOperator", desc = "copy to sys_clipboard", mode = { "n" }, expr = true },
      { "<leader>yy", "<Plug>OSCYankOperator_", desc = "copy line to sys_clipboard", mode = { "n" }, remap = true },
      { "<leader>y", "<Plug>OSCYankVisual", desc = "copy to sys_clipboard", mode = { "v" } },
    },
  },
}
