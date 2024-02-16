return {
	{
		"brenoprata10/nvim-highlight-colors",
		keys = {
			{ "<leader>th", "<cmd>lua require('nvim-highlight-colors').toggle()<cr>", desc = "Turn on highlight" },
		},
		lazy = true,
		cconfig = function()
			require("nvim-highlight-colors")
					.setup({
						render = "background",
						enable_tailwind = true,
					})
					.turnOn()
		end,
	},
}
