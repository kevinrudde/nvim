return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "harper-ls",
      },
    },
    keys = {
      {
        "<leader>uH",
        function()
          local clients = vim.lsp.get_clients({ name = "harper_ls" })
          if #clients > 0 then
            for _, client in ipairs(clients) do
              vim.lsp.stop_client(client.id)
            end
            vim.notify("Harper-ls disabled", vim.log.levels.INFO)
          else
            vim.cmd("LspStart harper_ls")
            vim.notify("Harper-ls enabled", vim.log.levels.INFO)
          end
        end,
        desc = "Toggle Harper-ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = {
          autostart = false,
        },
      },
    },
  },
}
