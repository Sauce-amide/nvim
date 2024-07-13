-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
keymap.set("n", "<m-b>", function()
  require("dap").toggle_breakpoint()
end)
keymap.set("n", "<m-c>", function()
  require("dap").continue()
end)

keymap.set("n", "<c-n>", "<cmd>BufferLineCycleNext<cr>")
keymap.set("n", "<c-p>", "<cmd>BufferLineCyclePrev<cr>")

keymap.set("n", "<leader>vc", ":e ~/.config/nvim/lua<cr><space>e")

keymap.set("n", "<leader>dd", vim.diagnostic.open_float)

keymap.del("n", "<leader>l") -- Remove default keymap for lazygit
-- keymap.del("i", "<M-k>")
-- keymap.del("i", "<M-j>")

local MiniMap = require("mini.map")
vim.keymap.set("n", "<Leader>mc", MiniMap.close)
vim.keymap.set("n", "<Leader>mf", MiniMap.toggle_focus)
vim.keymap.set("n", "<Leader>mo", MiniMap.open)
vim.keymap.set("n", "<Leader>mr", function()
  MiniMap.refresh({ symbols = { encode = MiniMap.gen_encode_symbols.dot("4x2") } })
end)
vim.keymap.set("n", "<Leader>ms", MiniMap.toggle_side)
vim.keymap.set("n", "<Leader>mt", MiniMap.toggle)

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
