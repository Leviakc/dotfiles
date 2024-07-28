return {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	lazy = true,
	keys = { { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>" } },
	--build = ":call mkdp#util#install()",
	config = function()
		-- vim.fn["mkdp#util#install"]()
	end,
	init = function()
		vim.g.mkdp_auto_close = 0
		vim.g.mkdp_browser = "firefox-developer-edition"
	end,
}

-- vim.g.mkdp_browser = "/opt/firefox-developer-edition/"
