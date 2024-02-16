return {
	"christoomey/vim-tmux-navigator",
	lazy = true,
	keys = {
		{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>" },
		{ "<C-j>", "<cmd>TmuxNavigateDown<cr>" },
		{ "<C-k>", "<cmd>TmuxNavigateUp<cr>" },
		{ "<C-l>", "<cmd>TmuxNavigateRight<cr>" },
	},
	-- config = function()
	--   require("tmux").setup()
	-- end,
}
