return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    --    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "HiPhish/nvim-ts-rainbow2",
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "astro",
        "bash",
        "css",
        "go",
        "gomod",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "python",
        "html",
        "jsdoc",
        "rust",
        "typescript",
        "vim",
        "yaml",
      },
      -- List of parsers to ignore installing (for "all")
      highlight = {
        enable = true,
        disable = { "html", },
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = false,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      refactor = {
        highlight_definitions = { enable = true },
        smart_rename = {
          enable = false,
          keymaps = {
            smart_rename = "trr",
          },
        },
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            -- ["ac"] = "@conditional.outer",
            -- ["ic"] = "@conditional.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
          },
        },
      },
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = {
          "html",
          "xml",
          "markdown",
          "astro",
          "glimmer",
          "handlebars",
          "hbs",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "svelte",
          "vue",
          "tsx",
          "jsx",
          "rescript",
        },
      },
      rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        disable = { "html", "tsx" },
        -- Which query to use for finding delimiters
        query = "rainbow-parens",
        -- Highlight the entire buffer all at once
        strategy = require("ts-rainbow").strategy.global,
        hlgroups = {
          "TSRainbowYellow",
          "TSRainbowBlue",
          "TSRainbowGreen",
          "TSRainbowViolet",
          "TSRainbowOrange",
          "TSRainbowCyan",
          "TSRainbowRed",
        },
      },

      --context_commentstring nvim-treesitter module is deprecated, use require('ts_context_commentstring').setup {} and set vim.g.skip_ts_contex
      --t_commentstring_module = true to speed up loading instead.
      require('ts_context_commentstring').setup {
        vim.g.skip_ts_contex,

        enable_autocmd = false,
        enable = true,
      },
      --context_commentstring = {
      --  enable_autocmd = false,
      --  enable = true,
      --},
    })
  end,
}
