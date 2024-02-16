return {
	"NTBBloodbath/rest.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>rn", "<cmd>lua require('rest-nvim').run()<CR>",     desc = 'Run near http request' },
		{ "<leader>rl", "<cmd>lua require('rest-nvim').last()<CR>",    desc = "Run last http resquest" },
		{ "<leader>rp", "<cmd>lua require('rest-nvim').run(true)<CR>", desc = "Preview http curl" },
	},
	lazy = true,
	ft = "http",
	config = function()
		local rest_nvim = require("rest-nvim")

		rest_nvim.setup({
			-- Open request results in a horizontal split
			result_split_horizontal = false,
			-- Keep the http file buffer above|left when split horizontal|vertical
			result_split_in_place = true,
			-- Skip SSL verification, useful for unknown certificates
			skip_ssl_verification = true,
			encode_url = true,
			-- Highlight request on run
			highlight = {
				enabled = true,
				timeout = 150,
			},
			result = {
				-- toggle showing URL, HTTP info, headers at top the of result window
				show_url = true,
				show_http_info = true,
				show_headers = true,
			},
			-- Jump to request line on run
			jump_to_request = false,
			env_file = ".env",
			custom_dynamic_variables = {},
			yank_dry_run = true,
		})
	end,
}
