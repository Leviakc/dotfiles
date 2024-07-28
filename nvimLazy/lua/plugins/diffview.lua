return {
  "sindrets/diffview.nvim",
  lazy = true,
  keys = {
    {
      "<leader>do",
      "<cmd>:DiffviewOpen<cr>",
      desc = "Opens a new Diffview that compares against the current index",
    },
    { "<leader>dc", "<cmd>:DiffviewClose<cr>", desc = "Close the Diffview file" },
    { "<leader>dh", "<cmd>:DiffviewFileHistory<cr>", desc = "Show file history" },
  },
  opts = {
    view = {
      merge_tool = {
        layout = "diff3_vertical",
        disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
        winbar_info = true, -- See ':h diffview-config-view.x.winbar_info'
      },
    },
  },
  config = function()
    require("diffview").setup({
      view = {
        -- Configure the layout and behavior of different types of views.
        -- Available layouts:
        --  'diff1_plain'
        --    |'diff2_horizontal'
        --    |'diff2_vertical'
        --    |'diff3_horizontal'
        --    |'diff3_vertical'
        --    |'diff3_mixed'
        --    |'diff4_mixed'
        -- For more info, see ':h diffview-config-view.x.layout'.
        default = {
          layout = "diff2_horizontal",
          winbar_info = false, -- See ':h diffview-config-view.x.winbar_info'
        },
        merge_tool = {
          -- Config for conflicted files in diff views during a merge or rebase.
          layout = "diff3_mixed",
          disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
          winbar_info = true, -- See ':h diffview-config-view.x.winbar_info'
        },
      },
      file_panel = {
        -- listing_style = "tree", -- One of 'list' or 'tree'
        -- tree_options = { -- Only applies when listing_style is 'tree'
        --   flatten_dirs = true, -- Flatten dirs that only contain one single dir
        --   folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
        -- },
        win_config = { -- See |diffview-config-win_config|
          position = "left",
          width = 30,
          win_opts = {},
        },
      },
    })
  end,
}
