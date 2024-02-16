return {
	"lewis6991/gitsigns.nvim",
	-- lazy = false,
	event = "VeryLazy",
	keys = {
		{ "<leader>hs", "<cmd>Gitsigns toggle_signs<cr>" },
	},
	-- map('n', '<leader>hs', gs.stage_hunk)
	config = function()
		require("gitsigns").setup()
	end,
}
