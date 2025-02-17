-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Navigation
vim.keymap.set({ "n", "v" }, "<A-j>", "b", { desc = "Backward one word" })
vim.keymap.set({ "n", "v" }, "<A-k>", "w", { desc = "Forward one word" })

-- text edition
vim.keymap.set("n", "yY", ":%y+<CR>")
vim.keymap.set("n", "<A-BS>", "ciw")
vim.keymap.set("i", "<A-BS>", "<C-w>")
