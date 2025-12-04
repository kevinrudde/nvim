return {
  desc = "Snacks File Explorer",
  recommended = true,
  "folke/snacks.nvim",
  opts = { explorer = {} },
  keys = {
    {
      "<leader>fe",
      function()
        Snacks.explorer({ cwd = LazyVim.root() })
      end,
      desc = "Explorer Snacks (root dir)",
    },
    {
      "<leader>fE",
      function()
        Snacks.explorer()
      end,
      desc = "Explorer Snacks (cwd)",
    },
    {
      "<leader>B",
      function()
        if Snacks.picker.get({ source = "explorer" })[1] == nil then
          Snacks.picker.explorer()
        elseif Snacks.picker.get({ source = "explorer" })[1]:is_focused() == true then
          vim.cmd("wincmd p") -- go back to previous window instead of reopening explorer
        elseif Snacks.picker.get({ source = "explorer" })[1]:is_focused() == false then
          Snacks.picker.get({ source = "explorer" })[1]:focus()
        end
      end,
    },
    { "<leader>e", "<leader>B", desc = "Explorer Snacks (root dir)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Explorer Snacks (cwd)", remap = true },
  },
}
