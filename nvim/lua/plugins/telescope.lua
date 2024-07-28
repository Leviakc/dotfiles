return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6", -- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files/documents" },
		{
			"<leader>fF",
			"<cmd>lua require('telescope.builtin').find_files({cwd = '%:h'}, opts)<cr>",
			desc = "Find files/documents (cwd)",
		},

		{
			"<leader>fG",
			"<cmd>lua require('telescope.builtin').live_grep({cwd = '%:h'}, opts)<cr>",
			desc = "Find word (cwd)",
		},
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find word" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
		-- git
		{ "<leader>fc", "<cmd>Telescope git_commits<CR>", desc = "Show git commits" },
		--{'<leader>ps', '<cmd>Telescope help_tags<cr>'},
		-- Diagnostics
		{ "<leader>xx", "<cmd>Telescope diagnostics<cr>", desc = "Document Diagnostics" },
		-- whichkey like
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Show keymaps" },
		-- import packages
		{ "<leader>fi", "<cmd>Telescope import<cr>", desc = "Find package" },
	},
	opts = {
		defaults = {
			file_ignore_patterns = { "node_modules", "plugged", ".git", "target" },
		},
		pickers = {
			find_files = {
				hidden = true,
			},
		},
	},
}
