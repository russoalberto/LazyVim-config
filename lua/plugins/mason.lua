return {
  -- config lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      { "j-hui/fidget.nvim", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        -- fontend
        angularls = {},
        cssls = {},
        --eslint = {},
        --tsserver = {},
        html = {
          settings = {
            html = {
              format = {
                tabSize = 2,
                useTabs = false,
                wrapAttributesIndentSize = 2,
                wrapAttributes = "preserve",
                wrapLineLength = 0,
              },
            },
          },
          on_attach = function(client)
            client.server_capabilities.documentRangeFormattingProvider = true
            client.server_capabilities.documentFormattingProvider = true
          end,
        },
        tailwindcss = {},

        -- backend
        csharp_ls = {},
        intelephense = {},
        gopls = {},
        --omnisharp = {},
        -- fileconfig
        dockerls = {},
        docker_compose_language_service = {},
        yamlls = {},
        jsonls = {},
        marksman = {},
        -- system
        rust_analyzer = {},
        -- misc
        grammarly = {},
        lua_ls = {},
        prismals = {},
      },
    },
  },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- DAP
        "codelldb",
        "js-debug-adapter",
        "netcoredbg",
        -- Linter
        "flake8",
        "shellcheck",
        -- Formatter
        "prettierd",
        "shfmt",
        "stylua",
        "prettierd",
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim.
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- Add eslint configs
  { import = "lazyvim.plugins.extras.linting.eslint" },

  -- Update null-ls configs
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(
        opts.sources,
        nls.builtins.formatting.prettierd.with({
          disabled_filetypes = { "html" },
          condition = function(utils)
            return utils.root_has_file({
              ".prettierrc.json",
              ".prettierrc.yml",
              ".prettierrc.yaml",
              ".prettierrc.json5",
            })
          end,
        })
      )
    end,
  },
}
