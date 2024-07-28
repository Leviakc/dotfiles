return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>e", false },

    {
      "<leader>nt",
      function()
        vim.cmd("Neotree toggle")
      end,
    },
  },
}
