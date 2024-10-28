return {
  {
    "t9md/vim-quickhl",
    keys = {
      -- nmap <Space>m <Plug>(quickhl-manual-this)
      -- xmap <Space>m <Plug>(quickhl-manual-this)
      -- nmap <Space>M <Plug>(quickhl-manual-reset)
      -- xmap <Space>M <Plug>(quickhl-manual-reset)
      -- nmap <Space>w <Plug>(quickhl-manual-this-whole-word)
      -- xmap <Space>w <Plug>(quickhl-manual-this-whole-word)
      --
      -- nmap <Space>c <Plug>(quickhl-manual-clear)
      -- vmap <Space>c <Plug>(quickhl-manual-clear)
      --
      -- nmap <Space>j <Plug>(quickhl-cword-toggle)
      -- nmap <Space>] <Plug>(quickhl-tag-toggle)
      -- map H <Plug>(operator-quickhl-manual-this-motion)
      { "<Space>h", "<Plug>(quickhl-manual-this)",  mode = { "n", "x" } },
      { "<Space>H", "<Plug>(quickhl-manual-reset)", mode = { "n", "x" } },
      -- { "<Space>w", "<Plug>(quickhl-manual-this-whole-word)", mode = { "n", "x" } },
      -- { "<Space>c", "<Plug>(quickhl-manual-clear)", mode = { "n", "v" } },
      -- { "<Space>j", "<Plug>(quickhl-cword-toggle)", mode = { "n" } },
      -- { "<Space>]", "<Plug>(quickhl-tag-toggle)", mode = { "n" } },
      -- { "H", "<Plug>(operator-quickhl-manual-this-motion)", mode = { "n" } },
      opt = function()
        vim.g.quickhl_manual_colors = {
          -- { "cterm=bold ctermfg=16 ctermbg=153 gui=bold guifg=#ffffff guibg=#0a7383" },
          -- { "cterm=bold ctermfg=7 ctermbg=1 gui=bold guibg=#a07040 guifg=#ffffff" },
          -- { "cterm=bold ctermfg=7 ctermbg=2 gui=bold guibg=#4070a0 guifg=#ffffff" },
          -- { "cterm=bold ctermfg=7 ctermbg=3 gui=bold guibg=#40a070 guifg=#ffffff" },
          -- { "cterm=bold ctermfg=7 ctermbg=4 gui=bold guibg=#70a040 guifg=#ffffff" },
          -- { "cterm=bold ctermfg=7 ctermbg=5 gui=bold guibg=#0070e0 guifg=#ffffff" },
          -- { "cterm=bold ctermfg=7 ctermbg=6 gui=bold guibg=#007020 guifg=#ffffff" },
          -- { "cterm=bold ctermfg=7 ctermbg=21 gui=bold guibg=#d4a00d guifg=#ffffff" },
          -- { "cterm=bold ctermfg=7 ctermbg=22 gui=bold guibg=#06287e guifg=#ffffff" },
          -- { "cterm=bold ctermfg=7 ctermbg=45 gui=bold guibg=#5b3674 guifg=#ffffff" },
          -- { "cterm=bold ctermfg=7 ctermbg=16 gui=bold guibg=#4c8f2f guifg=#ffffff" },
          -- { "cterm=bold ctermfg=7 ctermbg=50 gui=bold guibg=#1060a0 guifg=#ffffff" },
          -- { "cterm=bold ctermfg=7 ctermbg=56 gui=bold guibg=#a0b0c0 guifg=black" },
          -- 继续添加更多的颜色定义，直到达到20个
          -- { "cterm=bold ctermfg=7 ctermbg=59 gui=bold guibg=#8B4513 guifg=#ffffff" }, -- 沙棕色
          -- { "cterm=bold ctermfg=7 ctermbg=60 gui=bold guibg=#4682B4 guifg=#ffffff" }, -- 钢蓝色
          -- { "cterm=bold ctermfg=7 ctermbg=61 gui=bold guibg=#6A5ACD guifg=#ffffff" }, -- 板岩蓝
          -- { "cterm=bold ctermfg=7 ctermbg=62 gui=bold guibg=#2E8B57 guifg=#ffffff" }, -- 海绿色
          -- { "cterm=bold ctermfg=7 ctermbg=63 gui=bold guibg=#8B0000 guifg=#ffffff" }, -- 深红色
          -- { "cterm=bold ctermfg=7 ctermbg=64 gui=bold guibg=#556B2F guifg=#ffffff" }, -- 暗橄榄绿色
          -- { "cterm=bold ctermfg=7 ctermbg=65 gui=bold guibg=#8B4513 guifg=#ffffff" }, -- 沙棕色
          -- { "cterm=bold ctermfg=7 ctermbg=66 gui=bold guibg=#4682B4 guifg=#ffffff" }, -- 钢蓝色
          -- { "cterm=bold ctermfg=7 ctermbg=67 gui=bold guibg=#6A5ACD guifg=#ffffff" }, -- 板岩蓝
          -- { "cterm=bold ctermfg=7 ctermbg=69 gui=bold guibg=#8B0000 guifg=#ffffff" }, -- 深红色
          -- { "cterm=bold ctermfg=7 ctermbg=70 gui=bold guibg=#00ff00 guifg=#000000" }, -- 绿色
          -- { "cterm=bold ctermfg=7 ctermbg=71 gui=bold guibg=#0000ff guifg=#ffffff" }, -- 蓝色
          -- { "cterm=bold ctermfg=7 ctermbg=72 gui=bold guibg=#ffff00 guifg=#000000" }, -- 黄色
          -- { "cterm=bold ctermfg=7 ctermbg=73 gui=bold guibg=#00ffff guifg=#000000" }, -- 青色
          -- { "cterm=bold ctermfg=7 ctermbg=74 gui=bold guibg=#ff00ff guifg=#ffffff" }, -- 品红色
          -- { "cterm=bold ctermfg=7 ctermbg=75 gui=bold guibg=#ff0000 guifg=#ffffff" }, -- 红色
          -- { "cterm=bold ctermfg=7 ctermbg=76 gui=bold guibg=#000000 guifg=#ffffff" }, -- 黑色背景，白色前景
          -- { "cterm=bold ctermfg=7 ctermbg=77 gui=bold guibg=#808080 guifg=#000000" } -- 灰色背景，黑色前景
        }
      end,
    },
  }
}
