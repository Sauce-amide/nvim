return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = {
      phpactor = {
        enabled = false
      }
    }
  end
}
