-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 打开文件时自动打开 Neotree
-- vim.api.nvim_create_autocmd('BufWinEnter', {
--   pattern = '*',
--   callback = function()
--     local buftype = vim.bo.buftype
--     if buftype == '' or buftype == 'acwrite' or buftype == 'help' then
--       vim.cmd('Neotree show')
--     end
--   end,
-- })

-- 创建自动命令，在每次打开新窗口时禁用新窗口的 scrollbind
vim.api.nvim_create_autocmd('WinNew', {
  pattern = '*',
  callback = function()
    vim.schedule(function()
      vim.wo.scrollbind = false
    end)
  end,
})

-- 暂时无效
-- vim.api.nvim_create_autocmd("dashboard", {
--   -- pattern = "dashboard",
--   -- command = "Neotree toggle",
--   callback = function()
--     --弹出消息
--     vim.notify("Dashboard opened\n")
--   end,
-- })
