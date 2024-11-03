-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.cmd("set wrap")

vim.g["codi#interpreters"] = {
  interpreters = {
    cpp = {
      bin = "cling",
      quitcmd = ".q",
      prompt = "^\\[cling\\]\\$ ",
    },
  },
}

local opt = vim.opt
opt.shiftwidth = 4
opt.tabstop = 4
-- require("lazy").setup("plugins", {
--   change_detection = {
--     notify = false,
--   },
-- })

vim.g.lazyvim_php_lsp = "intelephense"

-- for neovide settings
vim.o.guifont = "FantasqueSansM Nerd Font Propo:h16:w0:#h-none"
vim.o.linespace = 0
vim.g.neovide_transparency = 0.95
-- vim.g.neovide_window_blurred = true
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_remember_window_size = true
vim.g.neovide_profiler = false -- 显示帧率
vim.g.neovide_input_macos_option_key_is_meta = true
