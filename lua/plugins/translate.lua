return {
  "uga-rosa/translate.nvim",
  config = function()
    require("translate").setup({
      default = {
        command = "google",
        position = "right",
        min_size = 5,
        max_size = 0.5,
        name = "translate://output",
        filetype = "translate",
        append = false,
      },
    })
  end,
  keys = {
    -- 添加快捷键映射
    {
      "<space>tw",
      "<cmd>Translate ZH -output=split<CR>",
      desc = "Translate word to Chinese",
      mode = { "n", "i", "x" },
    },
  },
}
