return {
  {
    "metakirby5/codi.vim",
    config = function()
      vim.g["codi#interpreters"] = {
        cpp = {
          bin = "cling",
          prompt = "\\[cling\\]\\$ ",
        },
      }
    end,
  },
}
