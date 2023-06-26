local M = {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            globalstatus = true,
            component_seperator = "|",
            theme = "horizon",
        }
    }
}

return M
