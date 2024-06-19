return {
  {
    "mfussenegger/nvim-dap",
    opts = function(_, opts)
      require("dap").configurations.go = {
        {
          type = "go",
          name = "Debug with intergrated console",
          request = "launch",
          program = "${file}",
          console = "integratedTerminal",
        },
      }
      --好像无效果
      -- require("dap.ext.vscode").load_launchjs("/Users/sauce/go/launch.js", { go = { "go" } })
      -- require("dap.ext.vscode").load_launchjs(nil, { go = "go" })
    end,
  },
}
