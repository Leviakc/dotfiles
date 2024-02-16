return {
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		config = true,
		keys = { { "<C-space>", "<cmd>ToggleTerm<CR>", desc = "Toggle floating terminal" } },
		cmd = "ToggleTerm",
		opts = {
			-- size = 10,
			open_mapping = [[<C-space>]],
			hide_numbers = false,
			shade_filetypes = {},
			shade_terminals = true,
			shade_factor = 10,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				width = 75,
				border = "curved",
				winblend = 3,
			},
		},
	},
}
