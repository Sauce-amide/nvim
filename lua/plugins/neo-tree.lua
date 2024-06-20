return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        { "o",  false },
        { "oc", false },
        { "od", false },
        { "og", false },
        { "om", false },
        { "on", false },
        { "os", false },
        { "ot", false },
    },
    opts = {
        filesystem = {
            window = {
                mappings = {
                    ["o"] = "open",
                    ["s"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
                    ["sc"] = { "order_by_created", nowait = false },
                    ["sd"] = { "order_by_diagnostics", nowait = false },
                    ["sg"] = { "order_by_git_status", nowait = false },
                    ["sm"] = { "order_by_modified", nowait = false },
                    ["sn"] = { "order_by_name", nowait = false },
                    ["ss"] = { "order_by_size", nowait = false },
                    ["st"] = { "order_by_type", nowait = false },
                }
            }
        }
    }
}
