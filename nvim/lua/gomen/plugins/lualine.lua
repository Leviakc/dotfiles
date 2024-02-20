return {
  "nvim-lualine/lualine.nvim",
  -- event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    opt = true,
    lazy = false,
    config = function()
      require("lualine").setup({
        -- tabline = {
        -- 	lualine_a = {
        -- 		"buffers",
        -- 		"diagnostics",
        -- 	},
        -- },
        -- sections = {
        -- 	lualine_a = {
        -- 		"filename",
        -- 	},
        -- },
      })
      require("nvim-web-devicons").setup({
        override_by_extension = {
          ["astro"] = {
            icon = "",
            color = "#FFFFFF",
            name = "astro",
          },
        },
      })
    end,
  },
}
