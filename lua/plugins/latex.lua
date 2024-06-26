return {
  --   {
  --     "lervag/vimtex",
  --     lazy = false, -- lazy-loading will disable inverse search
  --     config = function()
  --       vim.api.nvim_create_autocmd({ "FileType" }, {
  --         group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
  --         pattern = { "bib", "tex" },
  --         callback = function()
  --           vim.wo.conceallevel = 2
  --         end,
  --       })
  --
  --       vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
  --       vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
  --
  --       -- 设置默认预览程序和选项
  --       -- vim.g.vimtex_view_general_viewer = "/Applications/Skim.app/Contents/SharedSupport/displayline"
  --       -- vim.g.vimtex_view_general_options = "-r @line @pdf @tex"
  --       -- vim.g.vimtex_compiler_method = "latexmk -xelatex"
  --       vim.g.tex_flavor = "latex"
  --       vim.g.vimtex_view_method = "skim"
  --       vim.g.vimtex_view_skim_sync = 1
  --       vim.g.vimtex_view_skim_activate = 1
  --       -- vim.g.qf_auto_open_quickfix = 0
  --       -- 关闭vimtex的quickfix
  --       -- vim.g.vimtex_quickfix_mode=0
  --       vim.g.vimtex_quickfix_enabled = 0
  --       vim.g.vimtex_quickfix_ignore_filters = {
  --         "Command terminated with space",
  --         "LaTeX Font Warning: Font shape",
  --         "Package caption Warning: The option",
  --         [[Underfull \\hbox (badness [0-9]*) in]],
  --         "Package enumitem Warning: Negative labelwidth",
  --         [[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in]],
  --         [[Package caption Warning: Unused \\captionsetup]],
  --         "Package typearea Warning: Bad type area settings!",
  --         [[Package fancyhdr Warning: \\headheight is too small]],
  --         [[Underfull \\hbox (badness [0-9]*) in paragraph at lines]],
  --         "Package hyperref Warning: Token not allowed in a PDF string",
  --         [[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in paragraph at lines]],
  --       }
  --       -- vim.opt.signcolumn = "no"
  --       vim.api.nvim_create_autocmd({ "BufEnter" }, {
  --         pattern = { "Table of contents (VimTeX)" },
  --         callback = function()
  --           vim.opt.signcolumn = "no"
  --         end,
  --       })
  --       vim.g.vimtex_toc_config = {
  --         split_width = 30,
  --         show_help = 0,
  --         -- split_pos = "leftabove",
  --         mode = 1,
  --       }
  --       -- vim.g.vimtex_compiler_latexmk_engines = { ["_"] = "-xelatex" }
  --       vim.g.vimtex_compiler_latexmk = {
  --         executable = "latexmk",
  --         options = {
  --           -- "-xelatex",
  --           "-file-line-error",
  --           "-synctex=1",
  --           "-interaction=nonstopmode",
  --           "-f",
  --         },
  --       }
  --     end,
  --   },
}
