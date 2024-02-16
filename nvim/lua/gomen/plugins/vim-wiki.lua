return {
  "vimwiki/vimwiki",
  cmd = { "VimwikiIndex" },
	keys = {
		{ "<leader>nw", "<cmd>VimwikiIndex<cr>",  desc = "go to VimwikiIndex" },
	},
	lazy = true,
	-- enabled = false,
  init = function()
    vim.g.vimwiki_list = {{
      path = "~/Documentos/.wiki",
      syntax = "markdown",
      ext = ".md",
    }}
    vim.g.vimwiki_global_ext = 0
		vim.g.vimwiki_table_auto_fmt = 1
  end,
}
