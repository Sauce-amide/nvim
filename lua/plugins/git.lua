return {
  -- "f-person/git-blame.nvim",
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      --     { "<leader>gf", mode = { "n", "x", "o" },                                                           false },
      { "<leader>fh", function() require("telescope").extensions.git_file_history.git_file_history() end, mode = { "n" }, desc = "Git file history" },
    },
    dependencies = {
      {
        "isak102/telescope-git-file-history.nvim",
        dependencies = { "tpope/vim-fugitive" }
      }
    }
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "sindrets/diffview.nvim",
    keys = {
      {
        "<leader>gd",
        function()
          local lib = require("diffview.lib")
          local view = lib.get_current_view()
          if view then
            -- Current tabpage is a Diffview; close it
            vim.cmd.DiffviewClose()
          else
            -- No open Diffview exists: open a new one
            vim.cmd.DiffviewOpen()
          end
        end
        ,
        desc = "Diffview"
      },
      { "<leader>gf", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "<leader>xg", ":Gitsigns setloclist<cr>",    mode = { "n" }, desc = "show gitloclist" },
      -- { "<leader>go", ":Gitsigns preview_hunk_inline<cr>", mode = { "n"}, desc = "Preview Hunk Inline" },
      { "<leader>gn", ":Gitsigns toggle_linehl<cr>", mode = { "n" }, desc = "toggle_Gitsigns_linehl" },
      { "<leader>gc", ":Gclog<cr>",                  mode = { "n" }, desc = "Gclog" },
    },
    opts = function(_, opts)
      opts.current_line_blame           = true -- Toggle with `:Gitsigns toggle_current_line_blame`
      opts.current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
        delay = 250,
        ignore_whitespace = false,
        virt_text_priority = 500,
      }
      opts.linehl                       = false -- Toggle with `:Gitsigns toggle_linehl`
      opts.current_line_blame_formatter = '<author>, <author_time:%R> - <summary>'
    end,
  }
}
