-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yank",
	group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})

-- resize splits if window size changes
vim.api.nvim_create_autocmd({ "VimResized" }, {
	desc = "Resize splits if window size changes",
	group = vim.api.nvim_create_augroup("ResizeSplits", { clear = true }),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"PlenaryTestPopup",
		"Telescope",
		"help",
		"gitrebase",
		"lspinfo",
		"man",
		"fugitive",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
		"gitcommit",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "lua", "go" },
-- 	command = "colorscheme habamax",
-- 	group = vim.api.nvim_create_augroup("MyLuaGoColorscheme", {}),
-- })

-- vim.api.nvim_create_autocmd("FileType", {
-- 	group = vim.api.nvim_create_augroup("rust_colorscheme", { clear = true }),
-- 	pattern = "rust",
-- 	callback = function()
-- 		-- vim.cmd("colorscheme habamax")
-- 		require("kanagawa").load("wave")
-- 		require("scrollbar").setup({
-- 			handle = {
-- 				text = " ",
-- 				blend = 30, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
-- 				color = nil,
-- 				color_nr = nil, -- cterm
-- 				highlight = "CursorColumn",
-- 				hide_if_all_visible = true, -- Hides handle if all lines are visible
-- 			},
-- 		}) --
-- 	end,
-- })

-- local bufs=vim.api.nvim_list_bufs()
-- local current_buf=vim.api.nvim_get_current_buf()
-- for _,i in ipairs(bufs) do
--     if i~=current_buf then
--         vim.api.nvim_buf_delete(i,{})
--     end
-- end
