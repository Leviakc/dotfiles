--vim.g.catppuccin_flavour = "macchiato"
--local macchiato = require("catppuccin.palettes").get_palette("macchiato")
local colors = require("catppuccin.palettes").get_palette()
local web_devicons = require("nvim-web-devicons")
local green = "#87af87"
local darkYellow = "#d1bd74"
local skin = "#FFEACA"
local blue = "#519aba"
local lightBlue = "#84a9ac"
local darkBlue = "#41535b"
local pink = "#cc6699"
local red = "#cb3837"
local orangeYellow = "#F0A500"
local darkOrange = "#D67D3E"
local purple = "#7A4988"

require("catppuccin").setup({
	flavour = "mocha", -- mocha, macchiato, frappe, latte
	--color_overrides = {
	--all = {
	--peach = "#862e9c",
	--},
	--},
	custom_highlights = {
		Comment = { fg = colors.text },
		["@constant"] = { fg = colors.rosewater },
		["@character"] = { fg = colors.red },
		["@comment"] = { fg = colors.mauve, style = { "italic" } },
		["@conditional"] = { fg = colors.red },
		["@debug"] = { fg = colors.red },
		--TSMethod = { fg = colors.teal },
		--TSField = { fg = colors.mauve },
		["@exepction"] = { fg = colors.red },
		["@keyword.return"] = { fg = colors.red },
		["@keyword"] = { fg = colors.mauve },
		["@repeat"] = { fg = colors.red },
		["@operator"] = { fg = colors.red, style = { "italic" } },
		["@property"] = { fg = colors.pink },
		["@namespace"] = { fg = colors.red },
		["@variable"] = { fg = colors.rosewater, style = { "italic" } },
		["@variable.builtin"] = { fg = colors.rosewater, style = { "italic" } },
		["@underlined"] = { style = { "italic", fg = colors.peach } }, -- (preferred) text that stands out, HTML links
		["@background"] = { style = { "italic", fg = colors.peach } }, -- (preferred) text that stands out, HTML links
		CocMenuSel = { link = "PmenuSel" },
		CocPumSearch = { fg = colors.subtext1, style = { "bold" } },
		--Underlined's to be 'underline' instead of italic, i'll change everything
	},

	integrations = {
		nvimtree = true,
		telescope = true,
		treesitter = true,
		bufferline = true,
		coc_nvim = true,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

--treesitter
require("nvim-treesitter.configs").setup({

	ensure_installed = { "javascript", "typescript", "rust", "lua" },

	sync_install = false,

	auto_install = true,

	ignore_install = { "" },

	highlight = {
		-- `false` will disable the whole extension
		enable = true,
		-- TODO: remove html and css
		disable = { "c", "rust", "css", "html", "markdown", "vim" },

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
	rainbow = {
		enable = true,
		disable = { "html", "cpp", "md", "markdown" }, -- list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		--colors = { }, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	autotag = {
		enable = true,
	},
})

require("todo-comments").setup({
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--glob=!node_modules",
		},
	},
})

web_devicons.set_icon({
	["node_modules"] = { icon = "", color = "#E8274B", cterm_color = "161", name = "NodeModules" },
	["vite.config.js"] = { icon = "", color = "#ffab00", name = "vite.config.js" },
	["babel.config.js"] = { icon = "", color = orangeYellow, name = "BabelConfig" },
	["babel.config.cjs"] = { icon = "", color = orangeYellow, name = "BabelConfig" },
	[".gitignore"] = { icon = "", color = "red", name = "gitignore" },
	["yarn.lock"] = { icon = "", color = "blue", name = "yarnlock" },
	[".cjs"] = { icon = "", color = darkYellow, name = "dotenv" },
	[".env"] = { icon = "", color = darkYellow, name = "dotenv" },
	[".env.development"] = { icon = "", color = darkYellow, name = "dotenvdevelopment" },
	[".env.production"] = { icon = "", color = darkYellow, name = "dotenvproduction" },
	[".test.env"] = { icon = "漣", color = red, name = "dotenvtest" },
	["config.js"] = { icon = "", color = darkYellow, name = "configjs" },
	["test.js"] = { icon = "", color = orangeYellow, name = "javascripttesting" },
	["test.jsx"] = { icon = "", color = blue, name = "javascriptreacttesting" },
	["test.jsx.snap"] = { icon = "", color = blue, name = "javascriptsnapshot" },
	["test.ts"] = { icon = "", color = blue, name = "typescripttesting" },
	["jest.config.js"] = { icon = "", color = red, name = "jestconfig" },
	["jest.config.cjs"] = { icon = "", color = red, name = "jestconfigmodule" },
	["controller.js"] = { icon = "", color = darkYellow, name = "javascriptcontroller" },
	["controller.ts"] = { icon = "", color = blue, name = "typescriptcontroller" },
	["service.js"] = { icon = "", color = darkYellow, name = "javascriptservice" },
	["usecase.js"] = { icon = "", color = darkYellow, name = "javascriptusecase" },
	["usecase.ts"] = { icon = "", color = blue, name = "typescriptusecase" },
	["repository.js"] = { icon = "", color = darkYellow, name = "javascriptrepository" },
	["repository.ts"] = { icon = "", color = blue, name = "typescriptrepository" },
	["model.js"] = { icon = "", color = darkYellow, name = "javascriptmodel" },
	["model.ts"] = { icon = "", color = blue, name = "typescriptmodel" },
	["types.ts"] = { icon = "ﴯ", color = blue, name = "typescripttypes" },
	["errors.js"] = { icon = "", color = darkYellow, name = "javascripterrors" },
	["router.js"] = { icon = "", color = darkYellow, name = "javascriptrouter" },
	["router.ts"] = { icon = "", color = blue, name = "typescriptrouter" },
	["handler.js"] = { icon = "ﳅ", color = darkYellow, name = "javascripteventhandler" },
	["constant.js"] = { icon = "", color = darkYellow, name = "javascriptconstant" },
	["hook.js"] = { icon = "ﯠ", color = darkYellow, name = "javascripthook" },
	["mongo.js"] = { icon = "", color = green, name = "javascriptmongo" },
	["schema.js"] = { icon = "", color = green, name = "javascriptschema" },
	["schema.ts"] = { icon = "", color = blue, name = "typescriptschema" },
	["validator.js"] = { icon = "", color = darkYellow, name = "javascriptvalidator" },
	["api.js"] = { icon = "", color = darkYellow, name = "javascriptapi" },
	["client.js"] = { icon = "", color = darkYellow, name = "javascriptviews" },
	["server.js"] = { icon = "", color = darkYellow, name = "javascriptserver" },
	["server.ts"] = { icon = "", color = blue, name = "typescriptserver" },
	--["app.js"] = { icon = "", color = green, name = "nodejs" },
	--["app.ts"] = { icon = "", color = blue, name = "nodets" },
	["webpack.config.js"] = { icon = "ﰩ", color = lightBlue, name = "webpack" },
	["styles.jsx"] = { icon = "💅", color = pink, name = "stylescomponent" },
	["store.js"] = { icon = "ﰆ", color = purple, name = "redux" },
	["firebase.utils.js"] = { icon = "", color = darkYellow, name = "firebase" },
	[".json"] = { icon = "ﬥ", color = darkYellow, name = "tsconfig" },
	[".pl"] = { icon = "", color = red, name = "prolog" },
	["tsconfig.json"] = { icon = "ﬥ", color = blue, name = "tsconfig" },
})

--require("nvim-web-devicons").set_icon({
--override = {
--bash = {
--icon = "車",
--color = "#80428A",
--cterm_color = "65",
--name = "DevIcon",
--},
--},
--default = true,
--})

require("toggleterm").setup({
	size = 10,
	open_mapping = [[<c-space>]],
	hide_numbers = false,
	shade_filetypes = {},
	shade_terminals = true,
	shade_factor = 10,
	start_in_insert = false,
	insert_mappings = false,
	terminal_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		width = 75,
		border = "curved",
		winblend = 3,
	},
})

require("scrollbar").setup({
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
})

--TODO: something

require("nvim-highlight-colors").setup({
	render = "background",
})

require("telescope").setup({
	defaults = { file_ignore_patterns = { "node_modules", "plugged" } },
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
		},
	},
})

--Status line
require("lualine").setup({
	options = { theme = "dracula" }, --dracula, ayu_mirage, codedark, catppuccin
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", opts)
vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

require("color-picker").setup()

require("hop").setup()

require("nvim-surround").setup({
	-- Configuration here, or leave empty to use defaults
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwplugin = 1
vim.g.loaded_netrwplugin = 1

require("nvim-tree").setup({ -- BEGIN_DEFAULT_OPTS
	auto_reload_on_write = true,
	create_in_closed_folder = false,
	disable_netrw = false,
	hijack_cursor = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	ignore_buffer_on_setup = false,
	open_on_setup = false,
	open_on_setup_file = false,
	open_on_tab = false,
	focus_empty_on_setup = false,
	ignore_buf_on_tab_change = {},
	sort_by = "name",
	root_dirs = {},
	prefer_startup_root = false,
	sync_root_with_cwd = false,
	reload_on_bufenter = false,
	respect_buf_cwd = false,
	on_attach = "disable",
	remove_keymaps = false,
	select_prompts = false,
	view = {
		adaptive_size = false,
		centralize_selection = false,
		width = 25,
		hide_root_folder = false,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = true,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = {
				-- user mappings go here
			},
		},
		float = {
			enable = false,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 30,
				height = 30,
				row = 1,
				col = 1,
			},
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "none",
		root_folder_modifier = ":~",
		indent_width = 2,
		indent_markers = {
			enable = false,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					--unstaged = "✗",
					--unstaged = "",
					unstaged = "",
					--staged = "S",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					--untracked = "★",
					untracked = "𝚄",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},
	ignore_ft_on_setup = {},
	system_open = {
		cmd = "",
		args = {},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
		custom = {},
		exclude = {},
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
	},
	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
		timeout = 400,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		expand_all = {
			max_folder_discovery = 300,
			exclude = {},
		},
		file_popup = {
			open_win_config = {
				col = 1,
				row = 1,
				relative = "cursor",
				border = "shadow",
				style = "minimal",
			},
		},
		open_file = {
			quit_on_open = false,
			resize_window = true,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
		remove_file = {
			close_window = true,
		},
	},
	trash = {
		cmd = "gio trash",
		require_confirm = true,
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			dev = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
}) -- END_DEFAULT_OPTS

require("bufferline").setup({
	options = {
		numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		-- NOTE: this plugin is designed with this icon in mind,
		-- and so changing this is NOT recommended, this is intended
		-- as an escape hatch for people who cannot bear it for whatever reason 
		indicator = { style = "underline" },
		-- this icon is a little troublesome
		buffer_close_icon = "ﳛ",
		--buffer_close_icon = "",
		-- buffer_close_icon = '',
		modified_icon = "●",
		--close_icon = "",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 30,
		max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		tab_size = 21,
		diagnostics = "coc",
		diagnostics_update_in_insert = true,
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "thin", -- | "thick" | "thin" | "slant" | padded_slant | { 'any', 'any' },
		enforce_regular_tabs = true,
		always_show_bufferline = true,
	},
})

--require("silicon").setup({
--output = "~/Imágenes/SILICON_$year-$month-$date-$time.png",
--bgImage = "~/Imágenes/test.png", -- path to image, must be png
--})
-- INDENT-BLANKLINE

--vim.opt.list = true
--vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})

-- init.lua
