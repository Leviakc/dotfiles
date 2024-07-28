return {
	-- {
	--   'echasnovski/mini.nvim',
	--   version = false,
	--   config = function ()
	--   require('mini.pairs').setup()
	--   require('mini.comment').setup()
	--   end
	-- },
	{
		"echasnovski/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.comment",
		version = false,
		config = function()
			require("mini.comment").setup()
		end,
	},
	-- 	{ "echasnovski/mini.surround",
	--     version = false,
	--     opts = {
	--     mappings = {
	-- add = 'ysiw'
	--       }
	--     }
	--   },
}
