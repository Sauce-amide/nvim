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
