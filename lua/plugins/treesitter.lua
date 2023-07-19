return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "arduino",
        "bash",
        "c",
        "c_sharp",
        "cpp",
        "dockerfile",
        "go",
        "html",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "prisma",
        "python",
        "query",
        "regex",
        "rust",
        "scss",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
}
