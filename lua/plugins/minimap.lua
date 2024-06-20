return {
  "echasnovski/mini.map",
  version = false,
  keys = {
    {
      "<leader>mc",
      function()
        require("mini.map").close()
      end,
      desc = "Close mini.map",
    },
    {
      "<leader>mf",
      function()
        require("mini.map").toggle_focus()
      end,
      desc = "Toggle focus of mini.map",
    },
    {
      "<leader>mo",
      function()
        require("mini.map").open()
      end,
      desc = "Open mini.map",
    },
    {
      "<leader>mr",
      function()
        require("mini.map").refresh()
      end,
      desc = "Refresh mini.map with symbols",
    },
    {
      "<leader>ms",
      function()
        require("mini.map").toggle_side()
      end,
      desc = "Toggle side of mini.map",
    },
    {
      "<leader>mt",
      function()
        require("mini.map").toggle()
      end,
      desc = "Toggle mini.map",
    },
  },
  opts = function(_, opts)
    local map = require("mini.map")
    opts.integrations = {
      -- map.gen_integration.diff({
      --   add = "MiniDiffSignAdd",
      --   change = "MiniDiffSignChange",
      --   delete = "MiniDiffSignDelete"
      -- }),
      map.gen_integration.diagnostic({
        error = "DiagnosticFloatingError",
        warn = "DiagnosticFloatingWarn",
        info = "DiagnosticFloatingInfo",
        hint = "DiagnosticFloatingHint",
      }),
      map.gen_integration.builtin_search(),
      map.gen_integration.diff(),
      -- map.gen_integration.diagnostic(),
    }
    opts.symbols = {
      scroll_line = "▒",
      encode = map.gen_encode_symbols.dot("4x2"),
    }
  end,
}
