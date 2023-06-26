local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>pf", ":Telescope find_files<CR>", { desc = "Find files" } },
        { "<C-p>", ":Telescope git_files<CR>", { desc = "Git files" } },
        { "<leader>ps", function() 
            vim.ui.input({ prompt = 'Grep > ' }, function(value)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                require("telescope.builtin").grep_string({ search = value })
            end)
        end 
        },
    }
}

return M
