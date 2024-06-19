return {
  "echasnovski/mini.map",
  version = false,
  opts = function(_, opts)
    local MiniMap = require("mini.map")
    opts.integrate = {
      MiniMap.gen_integration.diff({ "add", "change", "delete" }),
      MiniMap.gen_integration.diagnostic({
        error = "DiagnosticFloatingError",
        warn = "DiagnosticFloatingWarn",
        info = "DiagnosticFloatingInfo",
        hint = "DiagnosticFloatingHint",
      }),
    }
  end,
}
