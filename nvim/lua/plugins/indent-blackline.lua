return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "VeryLazy",
	opts = {},
	config = function()
  local highlight = {
      "indent",
  }
  local hooks = require "ibl.hooks"
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "indent", { fg = "#3f3f46" })
  end)
  require("ibl").setup { indent = { highlight = highlight } }
	end,
}
