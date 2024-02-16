return {
	"Bryley/neoai.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	cmd = {
		"NeoAI",
		"NeoAIOpen",
		"NeoAIClose",
		"NeoAIToggle",
		"NeoAIContext",
		"NeoAIContextOpen",
		"NeoAIContextClose",
		"NeoAIInject",
		"NeoAIInjectCode",
		"NeoAIInjectContext",
		"NeoAIInjectContextCode",
	},
	lazy = true,
	keys = {
		{ "<leader>oa", "<cmd>NeoAI<cr>", desc = "Open NeoAI" },
		{ "<leader>oc", "<cmd>NeoAIClose<cr>", desc = "Close NeoAI" },
		{ "<leader>ag", desc = "generate git message" },
	},
	config = function()
		require("neoai").setup({
			-- open_ai = {
			-- 	api_key = {
			-- 		env = "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",
			-- 		value = nil,
			-- 	},
			-- },
			-- Options go here
		})
	end,
}
