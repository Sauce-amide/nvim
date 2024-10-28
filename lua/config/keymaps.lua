-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 定义一个 Lua 函数来切换 blame 状态
-- function ToggleBlame()
--     -- 检查当前激活的文件类型是否为 'fugitiveblame'
--     if vim.bo.filetype == 'fugitiveblame' then
--         vim.cmd('close')
--     else
--         vim.cmd('Git blame')
--     end
-- end

function GetFileTypeWin(filetype)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.bo[buf].filetype
    if ft == filetype then
      return win
    end
  end
  return -1
end

function ToggleBlame()
    local current_win = vim.api.nvim_get_current_win()
    -- -- 尝试查找具有 fugitiveblame 文件类型的窗口
    local win_id = GetFileTypeWin('fugitiveblame')
    --
    if win_id ~= -1 then
        -- 切换到该窗口, 并关闭
        vim.api.nvim_set_current_win(win_id)
        vim.cmd('close')
    else
        vim.cmd('Git blame')
        -- scrollbind 设置
        vim.api.nvim_set_current_win(current_win)
        vim.wo[GetFileTypeWin('fugitiveblame')].scrollbind = true
        vim.wo[current_win].scrollbind = true
    end
end

-- 为普通模式绑定一个键映射，调用 ToggleBlame 函数
vim.keymap.set('n', '<leader>gb', ':lua ToggleBlame()<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { noremap = true, silent = true })

-- 交换 gi 和 gI 的功能
-- vim.keymap.set("n", "gI", "gi", { noremap = true }) -- 将 gI 映射为原来的 gi 功能
-- vim.keymap.set("n", "gi", "gI", { noremap = true }) -- 将 gi 映射为原来的 gI 功能

-- vim.keymap.set("n", "<c-n>", "<cmd>BufferLineCycleNext<cr>")
-- vim.keymap.set("n", "<c-p>", "<cmd>BufferLineCyclePrev<cr>")

-- 按行格式化
function FormatRange(start_line, end_line)
  require("conform").format({
    range = {
      start = { start_line, 0 },
      ["end"] = { end_line + 1, 0 },
    },
  })
end

-- 获取计数并调用 FormatRange
function FormatWithCount(type)
  local start_line, end_line

  if type == "line" then
    start_line = vim.fn.line("'[")
    end_line = vim.fn.line("']")
  elseif type == "visual" then
    start_line = vim.fn.line("'<")
    end_line = vim.fn.line("'>")
  else
    start_line = vim.fn.line("'[")
    end_line = vim.fn.line("']")
  end

  FormatRange(start_line, end_line)
end

vim.api.nvim_set_keymap("n", "=", ":set operatorfunc=v:lua.FormatWithCount<CR>g@", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "=gg", ":lua FormatRange(1,vim.fn.line('.'))<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "=", ":<C-u>lua FormatWithCount('visual')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "==", ":lua FormatWithCount('line')<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>wd',
  function()
    if vim.wo.diff == false then
      vim.cmd("windo diffthis")
    else
      vim.cmd("diffoff!")
    end
  end, { noremap = true, silent = true })


-- 单词跳跃不会停留在符号上
function Next_word()
  -- 跳到下一个单词
  vim.cmd('normal! w')
  -- 如果在符号上，继续向前跳
  while string.match(vim.fn.getline('.'):sub(vim.fn.col('.'), vim.fn.col('.')), '%W') do
    vim.cmd('normal! w')
  end
end

function Previous_word()
  -- 跳到上一个单词
  vim.cmd('normal! b')
  -- 如果在符号上，继续向后跳
  while string.match(vim.fn.getline('.'):sub(vim.fn.col('.'), vim.fn.col('.')), '%W') do
    vim.cmd('normal! b')
  end
end

--
-- vim.api.nvim_set_keymap('n', 'w', ':lua Next_word()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'b', ':lua Previous_word()<CR>', { noremap = true, silent = true })


----------------------------------------------------设置scrollbind
-- 创建一个函数来应用 scrollbind 设置到所有窗口，排除 Neotree 窗口
function SetScrollbindForAllWindows(scrollbind)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local filetype = vim.bo[buf].filetype
    if filetype ~= 'neo-tree' and filetype ~= 'trouble' and filetype ~= 'aerial' then
      vim.wo[win].scrollbind = scrollbind
    end
  end
end

-- 创建一个函数来切换所有窗口的 scrollbind 设置，排除 Neotree 窗口
function ToggleScrollbindForAllWindows()
  local scrollbind_enabled = vim.wo.scrollbind
  SetScrollbindForAllWindows(not scrollbind_enabled)
end

-- 设置键绑定
vim.keymap.set('n', '<leader>sb', ':lua ToggleScrollbindForAllWindows()<CR>', { noremap = true, silent = true })




------------------------------------hop.nvim 快捷键设置 --------------------------------------
-- local hop = require('hop-extensions')
-- local directions = require('hop.hint').HintDirection
-- vim.keymap.set('', 'f', function()
--   hop.ts.hint_textobjects({ direction = directions.AFTER_CURSOR, current_line_only = true })
-- end, {remap=true})
