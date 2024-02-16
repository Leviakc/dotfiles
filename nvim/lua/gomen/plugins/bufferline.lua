return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	-- lazy = true,
	dependencies = "nvim-tree/nvim-web-devicons",
	keys = {
		{
			"<A-1>",
			"<Cmd>BufferLineGoToBuffer 1<CR>",
			desc = "Go to Buffer",
		},
		{
			"<A-2>",
			"<Cmd>BufferLineGoToBuffer 2<CR>",
			desc = "Go to Buffer",
		},
		{
			"<A-3>",
			"<Cmd>BufferLineGoToBuffer 3<CR>",
			desc = "Go to Buffer",
		},
		{
			"<A-4>",
			"<Cmd>BufferLineGoToBuffer 4<CR>",
			desc = "Go to Buffer",
		},
		{
			"<A-5>",
			"<Cmd>BufferLineGoToBuffer 5<CR>",
			desc = "Go to Buffer",
		},
		{
			"<S-h>",
			"<Cmd>BufferLineCyclePrev<CR>",
			desc = "Go Previous tab",
		},
		{
			"<S-l>",
			"<Cmd>BufferLineCycleNext<CR>",
			desc = "Go Next tab",
		},
		{
			"<leader>cl",
			"<Cmd>BufferLineCloseRight<CR> <Cmd>BufferLineCloseLeft<CR>",
			desc = "Close all buffers",
		},
	},
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				numbers = "ordinal",
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = true,
				-- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or ""
					return " " .. icon .. count
				end,
			},
		})
	end,
}
