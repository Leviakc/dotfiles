-- Lazy
return {
	"piersolenski/wtf.nvim",
	-- lazy = true,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		-- search_engine = "google" | "duck_duck_go" | "stack_overflow" | "github",
	},
	config = function()
		-- require("wtf").setup({
		-- 	search_engine = "google" | "duck_duck_go" | "stack_overflow" | "github",
		-- })
	end,
	keys = {
		{
			"gw",
			mode = { "n", "x" },
			function()
				require("wtf").ai()
			end,
			desc = "Debug diagnostic with AI",
		},
		{
			mode = { "n" },
			"gW",
			function()
				require("wtf").search()
			end,
			desc = "Search diagnostic with Google",
		},
	},
}
