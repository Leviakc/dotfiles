return {
	"petertriho/nvim-scrollbar",
	-- event = "VeryLazy",
	lazy = false,
	-- event = "WinEnter",
	keys = { { "<leader>sc", "<cmd>ScrollbarShow<cr>", desc = "Show scrollbar" } },
	opts = {
		show = true,
		show_in_active_only = false,
		set_highlights = true,
		folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
		max_lines = false, -- disables if no. of lines in buffer exceeds this
		handle = {
			text = " ",
			color = "#32257c",
			cterm = nil,
			highlight = "CursorColumn",
			hide_if_all_visible = true, -- Hides handle if all lines are visible
		},
		marks = {
			Search = {
				text = { "-", "=" },
				priority = 0,
				color = "#ffd8a8",
				cterm = nil,
				highlight = "Search",
			},
			Error = {
				text = { "-", "=" },
				priority = 1,
				--color = "#c92a2a",
				color = "#F50000",
				cterm = nil,
				highlight = "DiagnosticVirtualTextError",
			},
			Warn = {
				text = { "-", "=" },
				priority = 2,
				--color = "#693535",
				color = "#ffec99",
				cterm = nil,
				highlight = "DiagnosticVirtualTextWarn",
			},
			Info = {
				text = { "-", "=" },
				priority = 3,
				color = "#a5d8ff",
				cterm = nil,
				highlight = "DiagnosticVirtualTextInfo",
			},
			Hint = {
				text = { "-", "=" },
				priority = 4,
				color = "#b2f2bb",
				cterm = nil,
				highlight = "DiagnosticVirtualTextHint",
			},
			Misc = {
				text = { "-", "=" },
				priority = 5,
				color = "#fcc2d7",
				cterm = nil,
				highlight = "Normal",
			},
		},
		excluded_buftypes = {
			"terminal",
		},
		excluded_filetypes = {
			"prompt",
			"TelescopePrompt",
		},
		autocmd = {
			render = {
				"BufWinEnter",
				"TabEnter",
				"TermEnter",
				"WinEnter",
				"CmdwinLeave",
				"TextChanged",
				"VimResized",
				"WinScrolled",
			},
			clear = {
				"BufWinLeave",
				"TabLeave",
				"TermLeave",
				"WinLeave",
			},
		},
		handlers = {
			diagnostic = true,
			search = false, -- Requires hlslens to be loaded, will run require("scrollbar.handlers.search").setup() for you
		},
	},
	-- config = function()
	-- 	vim.api.nvim_create_autocmd("FileType", {
	-- 		group = vim.api.nvim_create_augroup("rust_colorscheme", { clear = true }),
	-- 		pattern = "rust",
	-- 		callback = function()
	-- 			require("scrollbar").setup({
	-- 				handle = {
	-- 					text = " ",
	-- 					color = "#ff0000",
	-- 					cterm = nil,
	-- 					highlight = "CursorColumn",
	-- 					hide_if_all_visible = true, -- Hides handle if all lines are visible
	-- 				},
	-- 			})
	-- 		end,
	-- 	})
	-- end,
}
