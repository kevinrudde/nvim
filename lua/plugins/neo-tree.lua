local M = {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    enabled = true,
    lazy = false,
    keys = {
        { "<leader>e", ":Neotree<CR>", { desc = "[E]xplorer" } },
    },
	opts = {
        window = {
            mappings = {
                ["m"] = { "move", config = { show_path = "relative" } },
            },
        },
        filesystem = {
            follow_current_file = true,
            use_libuv_file_watcher = true,
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
            },
		    hijack_netrw_behavior = "open_default",
		},
	},
}

return M
