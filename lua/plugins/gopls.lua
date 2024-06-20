return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    if opts.servers and opts.servers.gopls and opts.servers.gopls.settings and opts.servers.gopls.settings.gopls then
      opts.servers.gopls.settings.gopls.hints.assignVariableTypes = false
    end
  end,
}

