return {
  {
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      lazy = true,
      config = false,
      init = function()
        -- Disable automatic setup, we are doing it manually
        vim.g.lsp_zero_extend_cmp = 0
        vim.g.lsp_zero_extend_lspconfig = 0
      end,
    },
    {
      'williamboman/mason.nvim',
      lazy = false,
      config = true,
    },

    -- Autocompletion
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
        { 'L3MON4D3/LuaSnip' },
      },
      config = function()
        -- Here is where you configure the autocompletion settings.
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_cmp()

        -- And you can configure cmp even more, if you want to.
        local cmp = require('cmp')
        local cmp_action = lsp_zero.cmp_action()

        cmp.setup({
          formatting = lsp_zero.cmp_format(),
          mapping = cmp.mapping.preset.insert({
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            ['<C-f>'] = cmp_action.luasnip_jump_forward(),
            ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          })
        })
      end
    },
    -- LSP
    {
      'neovim/nvim-lspconfig',
      cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
      event = { 'BufReadPre', 'BufNewFile' },
      dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'williamboman/mason-lspconfig.nvim' },
      },
      config = function()
        -- This is where all the LSP shenanigans will live
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_lspconfig()

        --- if you want to know more about lsp-zero and mason.nvim
        --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
        lsp_zero.on_attach(function(client, bufnr)
          -- see :help lsp-zero-keybindings
          -- to learn the available actions
          lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        require('mason-lspconfig').setup({
          ensure_installed = { 'tsserver', 'rust_analyzer', 'lua_ls', 'astro' },
          handlers = {
            lsp_zero.default_setup,

            --- replace `example_server` with the name of a language server
            lua_ls = function()
              --- in this function you can setup
              --- the language server however you want.
              --- in this example we just use lspconfig

              require 'lspconfig'.lua_ls.setup {
                on_init = function(client)
                  local path = client.workspace_folders[1].name
                  if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                    client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                      Lua = {
                        runtime = {
                          -- Tell the language server which version of Lua you're using
                          -- (most likely LuaJIT in the case of Neovim)
                          version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                          checkThirdParty = false,
                          library = {
                            vim.env.VIMRUNTIME
                            -- "${3rd}/luv/library"
                            -- "${3rd}/busted/library",
                          }
                          -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                          -- library = vim.api.nvim_get_runtime_file("", true)
                        }
                      }
                    })

                    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                  end
                  return true
                end
              }
            end,
          },
        })
      end
    }
  }
}

-- ◍ astro-language-server astro, astro
-- ◍ clangd
-- ◍ css-lsp cssls, cssls
-- ◍ deno denols, denols
-- ◍ emmet-language-server emmet_language_server, emmet_language_server
-- ◍ eslint-lsp eslint, eslint
-- ◍ html-lsp html, html
-- ◍ js-debug-adapter
-- ◍ json-lsp jsonls, jsonls
-- ◍ lua-language-server lua_ls, lua_ls
-- ◍ markdown-toc
-- ◍ prettierd
-- ◍ rust-analyzer rust_analyzer, rust_analyzer
-- ◍ stylelint
-- ◍ stylua
-- ◍ tailwindcss-language-server tailwindcss, tailwindcss
-- ◍ typescript-language-server tsserver, tsserver
