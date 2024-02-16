return {
	"ziontee113/icon-picker.nvim",
	lazy = true,
	keys = {
		{ "<Leader>i", "<cmd>IconPickerNormal<cr>", desc = "Pick icon and insert it" },
		{ "<Leader>y", "<cmd>IconPickerYank<cr>", desc = "Pick icon and yank it" },
	},
	config = function()
		require("icon-picker").setup({
			disable_legacy_commands = true,
		})
	end,
}
