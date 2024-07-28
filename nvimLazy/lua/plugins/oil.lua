return {
  "stevearc/oil.nvim",
  opts = {},
  lazy = true,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>oi", "<cmd>lua require('oil').open()<cr>", desc = "Open parent directory" },
    --vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
  },
  config = function()
    require("oil").setup({
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<S-l>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["<S-h>"] = "actions.parent",
        ["<S-j>"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
      },
    })
  end,
}
