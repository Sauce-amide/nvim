return {
  "zbirenbaum/copilot.lua",
  keys = {
    {
      "<m-j>",
      function()
        require("copilot.suggestion").next()
      end,
      mode = { "i" },
    },
    {
      "<m-k>",
      function()
        require("copilot.suggestion").prev()
      end,
      mode = { "i" },
    },
    {
      "<m-l>",
      function()
        require("copilot.suggestion").accept_line()
      end,
      mode = { "i" },
    },
  },
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  -- opts = {
  --   suggestion = {
  --     keymap = {
  --       accept = "<m-l>",
  --       next = "<m-j>",
  --       prev = "<m-k>",
  --       dismiss = "<m-h>",
  --     },
  --   },
  --   -- panel = { enabled = false },
  --   filetypes = {
  --     markdown = true,
  --     help = true,
  --   },
  -- },
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = { keymap = { accept = "<c-l>", next = "<c-j>", prev = "<c-k>", dismiss = "<c-h>" } },
  --     })
  --     print("copilot ready!")
  --   end,
}
