return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers.gopls.settings.gopls.analyses.fieldalignment = false
    opts.servers.gopls.settings.gopls.hints.parameterNames = false

    -- 使得gopls跳转到库中时，gr还能跳回来。通过锁定工作区为打开nvim时的文件夹实现。
    opts.servers.gopls.root_dir = function(fname)
      return vim.fn.getcwd()
    end
  end,
}
