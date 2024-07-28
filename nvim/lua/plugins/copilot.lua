return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		-- lazy = true,
		keys = {
			{ "<cmd>Copilot enable<cr>", desc = "Enable copilot" },
			{ "<cmd>Copilot disable<cr>", desc = "Disable copilot" },
		},
		module = "copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false, keymap = {} },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		-- dependencies = "copilot.lua",
		-- lazy = true,
		-- keys = {
		-- 	{"<cmd>Copilot status<cr>", desc = "Active and Show Copilot status"}
		-- },
		event = { "InsertEnter", "LspAttach" },
		keys = {
			{ "<cmd>Copilot status<cr>", desc = "Active and Show Copilot status" },
			-- Deactivate Copilot
			{ "<cmd>Copilot disable<cr>", desc = "Deactivate Copilot" },
		},
		fix_pairs = true,
		opts = {},
		config = function()
			require("copilot_cmp").setup({})
		end,
	},
}
