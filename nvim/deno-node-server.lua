#!/usr/bin/env lua

io.write("Do you wish to work with deno? (y/n): ")
local serverOption = io.read()
if serverOption == "y" or serverOption == "yes" or serverOption == "Y" then
	require("lspconfig").denols.setup({
		on_attach = on_attach,
		root_dir = require("lspconfig/util").root_pattern("deno.json", "deno.jsonc"),
	})
end
