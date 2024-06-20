-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- for wincopy
-- vim.opt.clipboard:append('unnamedplus')
--
-- vim.g.clipboard = {
--     name = 'win32yank-wsl',
--     copy = {
--         ['+'] = '/home/sauce/win32yank.exe -i --crlf',
--         ['*'] = '/home/sauce/win32yank.exe -i --crlf',
--     },
--     paste = {
--         ['+'] = '~/win32yank.exe -o --lf',
--         ['*'] = '~/win32yank.exe -o --lf',
--     },
--     cache_enabled = 0,
-- }

local clip_path = '/mnt/c/Windows/System32/clip.exe'

if vim.fn.executable(clip_path) == 1 then
    vim.cmd([[
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(']] .. clip_path .. [[', @0) | endif
        augroup END
    ]])
end
