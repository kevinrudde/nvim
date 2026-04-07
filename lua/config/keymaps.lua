-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

if vim.fn.executable("lazygit") == 1 then
  map("n", "<leader>gG", function() Snacks.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
  map("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
end

map("x", "p", [["_dP]], { desc = "Paste Without Replacing Clipboard" })
map("x", "<C-v>", [["_dP]], { desc = "Paste Without Replacing Clipboard" })
map("x", "<D-v>", [["_dP]], { desc = "Paste Without Replacing Clipboard" })
