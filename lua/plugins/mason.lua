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
        html = {},
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
        "shfmt",
        "stylua",
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- Add eslint and prettier configs
  { import = "lazyvim.plugins.extras.linting.eslint" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },
}
