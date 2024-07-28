return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
      -- astro = {
      --   cmd = { "astro-ls", "--stdio" },
      --   filetypes = { "astro" },
      --   init_options = { typescript = {} },
      --   root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
      -- },
      cssls = {
        cmd = { "vscode-css-language-server", "--stdio" },
        root_dir = require("lspconfig").util.root_pattern("package.json", ".git"),
        settings = {
          css = {
            validate = true,
          },
          less = {
            validate = true,
          },
          scss = {
            validate = true,
          },
        },
      },
      denols = { root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc") },
      -- html = {
      --   cmd = { "vscode-html-language-server", "--stdio" },
      --   filetypes = { "html", "templ" },
      --   init_options = {
      --     configurationSection = { "html", "css", "javascript" },
      --     embeddedLanguages = {
      --       css = true,
      --       javascript = true,
      --     },
      --     provideFormatter = true,
      --   },
      --   root_dir = require("lspconfig").util.root_pattern("package.json", ".git"),
      -- },
      -- tsserver = { root_dir = require("lspconfig").util.root_pattern("package.json"), single_file_support = false },
      prismals = {
        cmd = { "prisma-language-server", "--stdio" },
        filetypes = { "prisma" },
        root_dir = require("lspconfig").util.root_pattern(".git", "package.json"),
      },
    },
  },
}
