-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- local c_family = { "*.{c,h,cpp,hpp,cc,hh,c++,h++,cxx,hxx}" }
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = c_family,
--   callback = function()
--     vim.bo.tabstop = 4
--     vim.bo.shiftwidth = 4
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gomod",
  callback = function()
    vim.opt_local.commentstring = "// %s"
  end,
})
