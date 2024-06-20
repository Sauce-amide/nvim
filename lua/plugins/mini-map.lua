return {
    "echasnovski/mini.map",
    keys = {
        {
            "<leader>um",
            function()
                require("mini.map").toggle()
            end,
            desc = "Toggle mini.map",
        },
    },
}
