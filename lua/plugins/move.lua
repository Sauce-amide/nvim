return {
  {
    "rlane/pounce.nvim",
    keys = {
      -- { "s",  mode = { "n", "o", "x" }, function() require("pounce").pounce() end,                          desc = "Pounce" },
      -- { ";",  mode = { "n", "o", "x" }, function() require("pounce").pounce{do_repeat = true} end,                          desc = "Pounce" },
      -- { "S",  mode = { "n" }, function() require("pounce").pounce({ do_repeat = true }) end,      desc = "Pounce with repeat" },
      -- { "s",  mode = { "x" }, function() require("pounce").pounce() end,                          desc = "Pounce in visual mode" },
      -- { "gs", mode = { "o" }, function() require("pounce").pounce() end,                          desc = "Pounce in operator-pending mode" },
      -- { "S",  mode = { "n" }, function() require("pounce").pounce({ input = { reg = "/" } }) end, desc = "Pounce with register /" },
    },
  },
  -- {
  --   "folke/flash.nvim",
  --   keys = {
  --     -- 禁用与 "s" 相关的键映射
  --     { "s", mode = { "n", "x", "o" }, false },
  --     { "S", mode = { "n", "x", "o" }, false },
  --   },
  -- },
  -- {
  --   "ggandor/leap.nvim",
  --   keys = {
  --     { "s", "<Plug>(leap-forward)",  mode = "n",          desc = "Leap forward in normal mode" },
  --     { "S", "<Plug>(leap-backward)", mode = "n",          desc = "Leap backward in normal mode" },
  --     { "s", "<Plug>(leap-forward)",  mode = { "x", "o" }, desc = "Leap forward in visual/operator mode" },
  --     { "S", "<Plug>(leap-backward)", mode = { "x", "o" }, desc = "Leap backward in visual/operator mode" },
  --   },
  --   config = function()
  --     -- require('leap').add_default_mappings()
  --     require('leap.user').set_repeat_keys(';', ',')
  --   end,
  -- },
  -- {
  --   "justinmk/vim-sneak",
  --   keys = {
  --     -- {"s", "<Plug>Sneak_s", mode = "n", desc = "Sneak forward"},
  --     -- {"S", "<Plug>Sneak_S", mode = "n", desc = "Sneak backward"},
  --     -- {"s", "<Plug>Sneak_s", mode = { "x", "o" }, desc = "Sneak forward"},
  --     -- {"S", "<Plug>Sneak_S", mode = { "x", "o" }, desc = "Sneak backward"},
  --     -- {"f", "<Plug>Sneak_f", mode = { "n", "x", "o" }, desc = "Sneak forward"},
  --     -- {"F", "<Plug>Sneak_F", mode = { "n", "x", "o" }, desc = "Sneak backward"},
  --     -- {"t", "<Plug>Sneak_t", mode = { "n", "x", "o" }, desc = "Sneak forward"},
  --     -- {"T", "<Plug>Sneak_T", mode = { "n", "x", "o" }, desc = "Sneak backward"},
  --   }
  -- },
  -- {
  --   "christoomey/vim-titlecase",
  --   keys = {
  --     { "gz",  "<Plug>Titlecase",     mode = "n",          desc = "Titlecase word" },
  --     { "gz",  "<Plug>Titlecase",     mode = { "x", "o" }, desc = "Titlecase visual selection" },
  --     { "gzz", "<Plug>TitleCaseLine", mode = "n",          desc = "Titlecase line" },
  --   }
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.textobjects = opts.textobjects or {}
      opts.textobjects.move = opts.textobjects.move or {}
      -- 添加新的移动键绑定，同时保留原有绑定
      opts.textobjects.move.goto_next_start = vim.tbl_extend("force", opts.textobjects.move.goto_next_start or {}, {
        ["]n"] = "@function.name", -- 跳到下一个函数名
        ["]m"] = "@call.name",     -- 跳到下一个调用名
      })
      opts.textobjects.move.goto_previous_start = vim.tbl_extend("force", opts.textobjects.move.goto_previous_start or {},
        {
          ["[n"] = "@function.name", -- 跳到上一个函数名
          ["[m"] = "@call.name",     -- 跳到上一个调用名
        })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      search = {
        ---@type Flash.Pattern.Mode
        mode = "fuzzy",
      },
      jump = {
        jumplist = false,
        autojump = true, -- 将 autojump 设置为 true
        history = true,
        register = true,
        nohlsearch = true,
        keys = { ";", "," },
        char_actions = function()
          return {
            [";"] = "next",
            [","] = "prev",
          }
        end,
      },
      modes = {
        treesitter = {
          labels = "asdfghjklqwertyuiop",
        }
      }
    },
    -- stylua: ignore
    keys = {
      -- { "s", mode = { "n", "x", "o" }, false },
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      --   { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      --   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "n", "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      --   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "smoka7/hop.nvim",
    opts = {
      keys = 'etovxqpdygfblzhckisuran'
    },
    keys = {
      { "\\", "<cmd>HopWord<cr>", mode = { "n", "o" }, desc = "Hop text objects" },
      { "gl", "<cmd>HopLine<cr>", mode = { "n", "o" }, desc = "Hop lines" },
    }
  },
}
