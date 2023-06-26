local M = {
    "stevearc/dressing.nvim",
    opts = {},
    event = "BufRead",
    init = function()
        vim.ui.select = function(...)
            require("lazy").load({ plugins = { "dressing.nvim" } })
            return vim.ui.select(...)
        end
    end
}

return M
