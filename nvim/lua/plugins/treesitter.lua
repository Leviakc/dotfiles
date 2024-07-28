return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		--    "nvim-treesitter/playground",
		-- "nvim-treesitter/nvim-treesitter-refactor",
		-- "nvim-treesitter/nvim-treesitter-textobjects",
		-- "JoosepAlviste/nvim-ts-context-commentstring",
		-- "HiPhish/nvim-ts-rainbow2",
		-- "windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"astro",
				"bash",
				"css",
				"go",
				"gomod",
				"javascript",
				"lua",
				"markdown",
				"markdown_inline",
				"query",
				"python",
				"html",
				"jsdoc",
				"rust",
				"typescript",
				"vim",
				"xml",
				"http",
				"json",
				"graphql",
				"yaml",
			},
			-- List of parsers to ignore installing (for "all")
			highlight = {
				enable = true,
				disable = { "html" },
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = false,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
			-- textobjects = {
			--   move = {
			--     enable = true,
			--     set_jumps = true, -- whether to set jumps in the jumplist
			--     goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
			--     goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
			--     goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
			--     goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
			--   },
			--   select = {
			--     enable = true,
			--     lookahead = true,
			--     keymaps = {
			--       ["af"] = "@function.outer",
			--       ["if"] = "@function.inner",
			--       ["ac"] = "@class.outer",
			--       ["ic"] = "@class.inner",
			--       -- ["ac"] = "@conditional.outer",
			--       -- ["ic"] = "@conditional.inner",
			--       ["al"] = "@loop.outer",
			--       ["il"] = "@loop.inner",
			--     },
			--   },
			-- },
		})
	end,
}
