return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "TodoTrouble", "TodoTelescope" },
	event = { "BufReadPost", "BufNewFile" },
	config = true,
	-- stylua: ignore
	keys = {
		{ "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
		{ "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
		{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME,WARN,WARNING<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
		{ "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
		{ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Todo/Fix/Fixme" },
	},
}
-- TODO
-- HACK
-- FIXME
-- WARN
-- PERF
-- NOTE
-- TEST
