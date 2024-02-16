return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    keys = {
      { "<cmd>colorscheme catppuccin<cr>", desc = "catppuccin" },
    },
    priority = 1000,
    config = function()
      local colors = require("catppuccin.palettes").get_palette("mocha")
      --vim.cmd.colorscheme "catppuccin-mocha"
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        dim_inactive = {
          enabled = true,    -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.05, -- percentage of the shade to apply to the inactive window
        },
        custom_highlights = {
          -- ["@text.title"]
          ["@operator"] = { fg = colors.red, style = { "italic" } },
          ["@property"] = { fg = colors.pink },
          ["@namespace"] = { fg = colors.red },
          ["@variable"] = { fg = colors.rosewater, style = { "italic" } },
        },
        integrations = {
          cmp = true,
          gitsigns = false,
          nvimtree = false,
          telescope = true,
          notify = false,
          mini = false,
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    keys = {
      { "<cmd>colorscheme tokyonight<cr>", desc = "tokyonight" },
    },
    opts = { style = "moon" },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    keys = {
      { "<cmd>colorscheme kanagawa<cr>", desc = "kanagawa" },
    },
  },
}

--["@comment"] = { fg = colors.mauve, style = { "italic" } },
--["@conditional"] = { fg = colors.red },
--["@debug"] = { fg = colors.red },
----TSMethod = { fg = colors.teal },
----TSField = { fg = colors.mauve },
--["@exepction"] = { fg = colors.red },
--["@keyword.return"] = { fg = colors.red },
--["@keyword"] = { fg = colors.mauve },
--["@repeat"] = { fg = colors.red },
--["@operator"] = { fg = colors.red, style = { "italic" } },
--["@property"] = { fg = colors.pink },
--["@namespace"] = { fg = colors.red },
--["@variable"] = { fg = colors.rosewater, style = { "italic" } },
--["@variable.builtin"] = { fg = colors.rosewater, style = { "italic" } },
--["@underlined"] = { style = { "italic", fg = colors.peach } }, -- (preferred) text that stands out, HTML links
--["@background"] = { style = { "italic", fg = colors.peach } }, -- (preferred) text that stands out, HTML links
----CocMenuSel = { link = "PmenuSel" },
----CocPumSearch = { fg = colors.subtext1, style = { "bold" } },
