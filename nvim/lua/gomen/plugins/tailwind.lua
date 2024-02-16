return {
	{
		"NvChad/nvim-colorizer.lua",
		-- event = "VeryLazy",
		event = "VeryLazy",
		opts = {
			user_default_options = {
				tailwind = true,
				-- mode = "virtualtext",
			},
		},
	},
	{
		"js-everts/cmp-tailwind-colors",
		config = true,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "roobert/tailwindcss-colorizer-cmp.nvim" },
		-- event = "VeryLazy",
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},
}
