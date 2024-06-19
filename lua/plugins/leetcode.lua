return {
  "Dhanus3133/LeetBuddy.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("leetbuddy").setup({
      domain = "cn", -- `cn` for chinese leetcode
      language = "cpp",
    })
  end,
  keys = {
    { "<leader>la", "<cmd>Lazy<cr>", desc = "Lazy" },
    { "<leader>sq", "<cmd>LBQuestions<cr>", desc = "List Questions" },
    { "<leader>ll", "<cmd>LBQuestion<cr>", desc = "View Question" },
    { "<leader>lr", "<cmd>LBReset<cr>", desc = "Reset Code" },
    { "<leader>lt", "<cmd>LBTest<cr>", desc = "Run Code" },
    { "<leader>ls", "<cmd>LBSubmit<cr>", desc = "Submit Code" },
  },
}
