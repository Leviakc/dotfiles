return {
	"tpope/vim-fugitive",
	lazy = true,
	keys = {
		{ "<leader>gs", "<cmd>G<CR>", desc = "Show git status" },
		{ "<leader>gc", "<cmd>G commit<CR>", desc = "Git commit" },
		{ "<leader>gp", "<cmd>G push<CR>", desc = "Git push" },
		{ "<leader>gA", "<cmd>G add .<CR>", desc = "Git Add All" },
		{ "<leader>gmt", "<cmd>G mergetool<CR>", desc = "Git mergetool" },
	},
}
