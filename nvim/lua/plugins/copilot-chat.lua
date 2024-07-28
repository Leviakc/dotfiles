return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		keys = {
			{ "<leader>cc", "<cmd>CopilotChatToggle<CR>", desc = "toggle copilot chat" },
		},
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
			window = {
				layout = "float", -- 'vertical', 'horizontal', 'float', 'replace''
				width = 0.6, -- fractional width of parent, or absolute width in columns when > 1
				height = 0.6, -- fractional height of parent, or absolute height in rows when > 1
			},
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
