return {
  -- "f-person/git-blame.nvim",
  "tpope/vim-fugitive",
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "<leader>xg", ":Gitsigns setloclist<cr>", mode = { "n" }, desc = "Preview Hunk Inline" }
    },
    opts = function(_, opts)
      opts.current_line_blame = true -- Toggle with `:Gitsigns toggle_current_line_blame`
      opts.current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
        delay = 250,
        ignore_whitespace = false,
        virt_text_priority = 500,
      }
    end,
  }
}
