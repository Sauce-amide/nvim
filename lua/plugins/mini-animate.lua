return {
  "echasnovski/mini.animate",
  opts = function(_, opts)
    local animate = require("mini.animate")
    opts.scroll.timing = animate.gen_timing.linear({ duration = 50, unit = "total" })
  end,
}
