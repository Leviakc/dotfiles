vim.g.mapleader = " "
--vim.keymap.set('n', "<leader>pv", vim.cmd.Ex)
--vim.keymap.set('i', 'jk', '<ESC>')

-- :tnoremap <Esc> <C-\><C-n>
-- close terminal
vim.keymap.set("t", "JK", "<ESC><C-\\><C-n>")
vim.keymap.set("t", "KJ", "<ESC><C-\\><C-n>")

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit neovim" })
vim.keymap.set("n", "<leader>e", ":x<CR>", { desc = "Save and quit neovim" })
vim.keymap.set("n", "<leader>as", ":q!<CR>", { desc = "Quit neovim without save" })
vim.keymap.set("n", "<leader>to", ":set hlsearch!<CR>", { desc = "Toggle search highlight" })
vim.keymap.set("n", "<leader>so", ":source%<CR>", { desc = "Reload config" })

-- Save
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- format
vim.keymap.set("n", "<leader>W", ":lua vim.lsp.buf.format()<CR>", { desc = "Format file" })
-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Duplicate line
vim.keymap.set("n", "<leader>du", ":t.<CR>", { desc = "Duplicate line" })

-- Delete all
vim.keymap.set("n", "<leader>da", ":%d<CR>", { desc = "Delete all lines" })
-- Yank all
vim.keymap.set("n", "<leader>ya", ":%y<CR>", { desc = "Copy all lines" })
-- Select all
vim.keymap.set("n", "<leader>va", "ggVG<CR>", { desc = "Select all lines" })

-- Delete buffer
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Delete Buffer" })
-- nnoremap <leader>bd :for i in getbufinfo({'bufmodified':1}) \| execute 'bd' . i.bufnr \| endfor<cr>
-- Delete buffer (Force)
vim.keymap.set("n", "<leader>bD", ":bd!<CR>", { desc = "Delete Buffer (Force)" })

--Tab close
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
--tabnext
vim.keymap.set("n", "<S-l>", "<cmd>bNext<CR>", { desc = "Next tab" })
--tabprevious
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous tab" })

-- toggle line
vim.keymap.set("v", "mc", ":'<,'>normal gcc<CR>", { desc = "Toggle comment line" })

-- Show buffers availables
vim.keymap.set("n", "<leader>ls", ":ls<CR>", { desc = "Show buffers available" })
-- Like telescope for the moment
-- vim.keymap.set("n", "<leader>ff", ":ls<CR> :b ", { desc = "Pick a buffer" })

vim.keymap.set("n", "<leader>dab", function()
	vim.cmd(":%bd|e#")
	vim.cmd("bNext")
	vim.cmd("bd")
end, { desc = "Delete all buffers but current" })

-- vim.keymap.set
vim.keymap.set("n", "<leader>od", function()
	vim.diagnostic.open_float()
end, { desc = "Open diagnostic floating window" })

-- **** macros ****

-- @a - make a function declaration a arrow function
-- vim.keymap.set("n", "@a", "@a", { desc = "Transform function declaration to arrow function" })

-- debugger
