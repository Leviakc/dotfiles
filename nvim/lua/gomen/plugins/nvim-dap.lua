return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "mxsdev/nvim-dap-vscode-js",
    "anuvyklack/hydra.nvim",
    "yorickpeterse/nvim-window"
  },
  lazy = true,
  -- keys = { { "<leader>nd", "<cmd>DapToggleBreakpoint<CR>", desc = "Open Debug menu" } },
  keys = { { "<leader>de", desc = "Open Debug menu" } },
  config = function()
    require("gomen.config.dap")
  end,
}
