return {
  "wfxr/minimap.vim",
  --   build = "cargo install --locked code-minimap",
  --   lazy = false,
  --   cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
  --   init = function()
  --     vim.cmd("let g:minimap_width = 10")
  --     vim.cmd("let g:minimap_auto_start = 1")
  --     vim.cmd("let g:minimap_auto_start_win_enter = 1")
  --   end,
  keys = {
    { "<leader>m", "<cmd>MinimapToggle<cr>", desc = "Toggle Minimap", mode = { "n" } },
  },
  --   config = function()
  --     vim.cmd("let g:minimap_highlight_range = 1")
  --     vim.cmd("let g:minimap_highlight_search = 1")
  --     --     vim.cmd("let g:minimap_width = 10")
  --     -- vim.cmd("let g:minimap_auto_start = 0")
  --     --     vim.cmd("let g:minimap_auto_start_win_enter = 1")
  --   end,
}
