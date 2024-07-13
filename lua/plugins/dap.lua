return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for xdebug",
          port = "9003",
          log = false,
          serverSourceRoot = "/srv/www/",
          localSourceRoot = "/home/www/VVV/www/",
        },
      }
    end,
  },
}
