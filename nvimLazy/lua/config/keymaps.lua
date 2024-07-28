-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

-- Terminal
vim.keymap.set("t", "JK", "<ESC><C-\\><C-n>")
vim.keymap.set("t", "KJ", "<ESC><C-\\><C-n>")

vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit neovim" })
vim.keymap.set("n", "<leader>e", ":x<CR>", { desc = "Save and quit neovim" })
vim.keymap.set("n", "<leader>as", ":q!<CR>", { desc = "Quit neovim without save" })
vim.keymap.set("n", "<leader>to", ":set hlsearch!<CR>", { desc = "Toggle search highlight" })
vim.keymap.set("n", "<leader>so", ":source%<CR>", { desc = "Reload config" })
vim.keymap.set("n", "<leader>od", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostic floating window" })
-- vim.keymap.set("n", "<leader>ba", ":%bd|e#", { desc = "Open diagnostic floating window" })

-- Save
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Duplicate line
vim.keymap.set("n", "<leader>du", ":t.<CR>", { desc = "Duplicate line" })

-- Delete all
vim.keymap.set("n", "<leader>da", ":%d<CR>", { desc = "Delete all lines" })
-- Yank all
vim.keymap.set("n", "<leader>ya", ":%y<CR>", { desc = "Copy all lines" })
-- Select all
vim.keymap.set("n", "<leader>va", "ggVG<CR>", { desc = "Select all lines" })
