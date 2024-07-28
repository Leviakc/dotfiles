return {
	{
		"vhyrro/luarocks.nvim",
    event = "VeryLazy",
		priority = 1000,
		config = true,
	},
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		keys = {
			{
				"<leader>rr",
				"<cmd>Rest run<cr>",
				"Run request under the cursor",
			},
			{
				"<leader>rl",
				"<cmd>Rest run last<cr>",
				"Re-run latest request",
			},
		},
		dependencies = { "luarocks.nvim" },
		config = function()
			require("rest-nvim").setup({})
		end,
	},
}
