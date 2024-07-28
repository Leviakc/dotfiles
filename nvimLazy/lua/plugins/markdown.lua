return {
  "iamcco/markdown-preview.nvim",
  ft = "markdown",
  lazy = true,
  keys = { { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>" } },
  --build = ":call mkdp#util#install()",
  config = function()
    vim.fn["mkdp#util#install"]()
  end,
  init = function()
    vim.g.mkdp_auto_close = 0
  end,
}
