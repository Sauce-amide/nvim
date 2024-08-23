return {
  {
    "neovim/nvim-lspconfig",
    -- opts =
    --     function()
    --       require("lspconfig").phpactor.setup({
    --         enabled = true,
    --         cmd = { vim.fn.expand("~/.config/composer/vendor/bin/phpactor"), "language-server" },
    --         filetypes = { "php" },
    --       })
    --     end
    -- {
    -- servers = {
    --   phpactor = {
    --     enabled = true,
    --     cmd = { "~/.config/composer/vendor/bin/phpactor", "language-server" },
    --     filetypes = { "php" },
    --     -- root_dir = function(fname)
    --     --   return require('lspconfig').util.find_git_ancestor(fname) or require('lspconfig').util.path.dirname(fname)
    --     -- end,
    --     -- settings = {},
    --   },
    -- },
    -- },
  },
}
