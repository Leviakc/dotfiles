return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
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
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules", "plugged", ".git" },
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
			extensions = {
				import = {
					-- Add imports to the top of the file keeping the cursor in place
					insert_at_top = true,
					-- Support additional languages
					custom_languages = {
						{
							-- The regex pattern for the import statement
							-- regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
							-- The Vim filetypes
							filetypes = { "typescript", "typescriptreact", "javascript", "react" },
							-- The filetypes that ripgrep supports (find these via `rg --type-list`)
							extensions = { "js", "ts", "tsx", "jsx" },
						},
					},
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- even more opts
					}),
				},
			},
		})
		require("telescope").load_extension("ui-select")
		-- require("telescope").load_extension("import")
	end,
}
