-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.filetype.add({
--   extension = {
--     mdx = "markdown",
--   },
-- })

-- change highlight color in v mode
vim.cmd("hi Visual  guifg=White guibg=#3f3f46 gui=none")
-- Save
vim.keymap.set("n", "<leader>W", ":w<CR>", { desc = "Save file" })
