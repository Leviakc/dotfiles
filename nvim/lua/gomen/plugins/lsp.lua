return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" }, -- Required
    {
      -- Optional
      "williamboman/mason.nvim",
      build = function()
        pcall(vim.cmd, "MasonUpdate")
      end,
    },
    { "williamboman/mason-lspconfig.nvim" }, -- Optional

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },   -- Required
    { "hrsh7th/cmp-nvim-lsp" }, -- Required
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "L3MON4D3/LuaSnip" },           -- Required
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" }, -- opt
  },
  config = function()
    -- LSP config
    local lsp = require("lsp-zero").preset({})
    local defaults = require("cmp.config.default")()
    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
      local opts = { buffer = bufnr, remap = false }

      vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
      end, opts)
      vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
      end, opts)
      vim.keymap.set("n", "<leader>vws", function()
        vim.lsp.buf.workspace_symbol()
      end, opts)
      vim.keymap.set("n", "<leader>vd", function()
        vim.diagnostic.open_float()
      end, opts)
      vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_next()
      end, opts)
      vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_prev()
      end, opts)
      vim.keymap.set("n", "<leader>vca", function()
        vim.lsp.buf.code_action()
      end, opts)
      vim.keymap.set("n", "<leader>vrr", function()
        vim.lsp.buf.references()
      end, opts)
      vim.keymap.set("n", "<leader>vrn", function()
        vim.lsp.buf.rename()
      end, opts)
      vim.keymap.set("i", "<C-h>", function()
        vim.lsp.buf.signature_help()
      end, opts)
    end)

    lsp.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 10000,
      },
      servers = {
        ["lua_ls"] = { "lua" },
        ["astro-ls"] = { "astro" },
        ["rust_analyzer"] = { "rust" },
        ["cssls"] = { "css", "scss" },
        ["null-ls"] = { "html", "lua", "css", "typepcript", "typescriptreact", "denols" },
        ["tailwindcss"] = {
          "astro",
          "astro-markdown",
          "handlebars",
          "hbs",
          "html",
          "markdown",
          "css",
          "less",
          "postcss",
          "sass",
          "scss",
          "denols",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
        ["eslint-lsp"] = { "typepcript", "javascript", "prettier", "typescriptreact" },
      },
    })

    lsp.ensure_installed({
      -- Replace these with whatever servers you want to install
      "tsserver",
      "cssls",
      "astro",
      "html",
      "denols",
      "tailwindcss",
      -- "js-debug-adapter",
      "denols",
      "eslint",
      "rust_analyzer",
      -- "java_language_server",
    })

    lsp.set_sign_icons({
      error = "",
      warn = "",
      hint = "",
      info = "",
      other = "",
    })

    -- (Optional) Configure lua language server for neovim
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "clangd",
        "rust_analyzer",
        -- "eslint_lsp",
        -- "js-debug-adapter",
        -- "prettier",
        -- "typescript-language-server",
        "tailwindcss",
        "denols",
      },
    })

    local lsp = require("lsp-zero")
    lsp.extend_cmp()

    -- config to setup tailwindcss-colorizer-cmp
    lsp.setup_nvim_cmp({
      formatting = {
        format = require("tailwindcss-colorizer-cmp").formatter,
      },
    })

    lsp.configure("jsonls", {
      filetypes = { "json", "jsonc" },
      settings = {
        json = {
          -- Schemas https://www.schemastore.org
          schemas = {
            {
              fileMatch = { "package.json" },
              url = "https://json.schemastore.org/package.json",
            },
            {
              fileMatch = { "deno.json", "deno.jsonc" },
              url = "https://raw.githubusercontent.com/denoland/deno/main/cli/schemas/config-file.v1.json",
            },
            {
              fileMatch = { "tsconfig*.json" },
              url = "https://json.schemastore.org/tsconfig.json",
            },
            {
              fileMatch = {
                ".prettierrc",
                ".prettierrc.json",
                "prettier.config.json",
              },
              url = "https://json.schemastore.org/prettierrc.json",
            },
            {
              fileMatch = { ".eslintrc", ".eslintrc.json" },
              url = "https://json.schemastore.org/eslintrc.json",
            },
            {
              fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
              url = "https://json.schemastore.org/babelrc.json",
            },
            {
              fileMatch = { "lerna.json" },
              url = "https://json.schemastore.org/lerna.json",
            },
            {
              fileMatch = { "now.json", "vercel.json" },
              url = "https://json.schemastore.org/now.json",
            },
            {
              fileMatch = {
                ".stylelintrc",
                ".stylelintrc.json",
                "stylelint.config.json",
              },
              url = "http://json.schemastore.org/stylelintrc.json",
            },
          },
        },
      },
    })

    require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

    local nvim_lsp = require("lspconfig")
    nvim_lsp.astro.setup({
      on_attach = on_attach,
      root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
      filetypes = { "astro" },
    })

    nvim_lsp.denols.setup({
      on_attach = on_attach,
      root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
      enable = true,
      suggest = {
        imports = {
          hosts = {
            ["https://crux.land"] = true,
            ["https://deno.land"] = true,
            ["https://x.nest.land"] = true,
          },
        },
      },
    })

    nvim_lsp.tsserver.setup({
      on_attach = on_attach,
      root_dir = nvim_lsp.util.root_pattern("package.json"),
      single_file_support = false,
    })

    -- nvim_lsp.java_language_server.setup({
    -- 	filetypes = { "java" },
    -- })

    local null_ls = require("null-ls")

    local null_opts = lsp.build_options("null-ls", {
      on_attach = function(client)
        if client.server_capabilities.documentFormattingProvider then
          vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ name = 'null-ls' })")
        end
      end,
    })

    local formatting = null_ls.builtins.formatting
    local lint = null_ls.builtins.diagnostics
    local action = null_ls.builtins.code_actions

    null_ls.setup({
      on_attach = null_opts.on_attach,
      sources = {
        -- formatting
        formatting.prettierd, -- JavaScript / TypeScript
        formatting.stylua, -- Lua

        -- linting
        lint.eslint_d,  -- JavaScript / TypeScript
        -- lint.credo, -- Elixir
        lint.golangci_lint, -- Go

        -- code actions
        action.eslint_d, -- JavaScript / TypeScript
      },
    })

    lsp.setup()

    -- CMP

    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()
    local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

    require("luasnip.loaders.from_vscode").lazy_load()

    -- cmp.config.formatting = {
    --   format = require("tailwindcss-colorizer-cmp").formatter,
    -- }
    local kind_icons = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
    }

    cmp.setup({
      sources = cmp.config.sources({
        { name = "copilot",  group_index = 2 },
        { name = "nvim_lsp", group_index = 2 },
        { name = "luasnip",  group_index = 2 },
        -- { name = "buffer", group_index = 2 },
        -- { name = "nvim_lua", group_index = 2 },
        { name = "path",     group_index = 2 },
      }),

      mapping = {
        -- `Enter` key to confirm completion
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        -- Ctrl+Space to trigger completion menu
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select_opts),
        -- ["<Tab>"] = vim.schedule_wrap(function(fallback)
        -- if cmp.visible() and has_words_before() then
        -- cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        -- else
        -- fallback()
        -- end
        -- end),
        ["<Tab>"] = cmp.mapping.select_next_item(cmp_select_opts),
        -- Navigate between snippet placeholder
        ["<C-f>"] = cmp_action.luasnip_jump_forward(),
        ["<C-b>"] = cmp_action.luasnip_jump_backward(),
        --['<S-TAB>'] = cmp.mapping(function()
        --	if cmp.visible() then
        --		cmp.select_prev_item(cmp_select_opts)
        --	else
        --		cmp.complete()
        --	end
        --end),
        --['<TAB>'] = cmp.mapping(function()
        --	if cmp.visible() then
        --		cmp.select_next_item(cmp_select_opts)
        --	else
        --		cmp.complete()
        --	end
        --end),
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        documentation = {
          max_height = 15,
          max_width = 60,
        },
      },
      formatting = {
        fields = { "abbr", "menu", "kind" },
        format = function(entry, item)
          -- if item.kind == "Color" then
          -- item = require("cmp-tailwind-colors").format(entry, item)

          -- if item.kind ~= "Color" then
          -- item.menu = "Color"
          -- return item
          -- end
          -- end

          -- item.menu = item.kind
          -- item.kind = kind_icons[item.kind] .. " "
          -- return item
          local short_name = {
            nvim_lsp = "LSP",
            nvim_lua = "nvim",
          }

          local menu_name = short_name[entry.source.name] or entry.source.name

          item.menu = string.format("[%s]", menu_name)
          return item
        end,
      },
    })
  end,
}
