local M = {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    build = ":TSUpdate",
    config = function()
        require ("nvim-treesitter.install").prefer_git = false
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "go",
                "lua",
                "typescript",
                "hcl",
                "terraform",
                "bash",
                "php",
                "toml",
                "yaml",
                "json",
            },

            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            additional_vim_regex_highlighting = false,
        })
    end,
}

return M
