return {
	"https://gitlab.com/yorickpeterse/nvim-window.git",
	lazy = true,
	-- 	{ "<leader>nt", "<cmd>NeoTreeShowToggle<CR>", desc = "Neotree toggle" },
	keys = { { "<leader>mw", "<cmd>lua require('nvim-window').pick()<CR>", desc = "Move between window" } },
	config = function()
		require("nvim-window").setup({
			-- The characters available for hinting windows.
			chars = {
				"a",
				"b",
				"c",
				"d",
				"e",
				"f",
				"g",
				"h",
				"i",
				"j",
			},

			-- A group to use for overwriting the Normal highlight group in the floating
			-- window. This can be used to change the background color.
			normal_hl = "Normal",

			-- The highlight group to apply to the line that contains the hint characters.
			-- This is used to make them stand out more.
			hint_hl = "Bold",

			-- The border style to use for the floating window.
			border = "single",
		})
	end,
}
