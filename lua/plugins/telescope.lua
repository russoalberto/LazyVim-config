return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "ThePrimeagen/harpoon",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("harpoon")
      end,
    },
    keys = {
     -- add a keymap to browse plugin files
     -- stylua: ignore
     {
       "<leader>fp",
       function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
       desc = "Find Plugin File",
     },
    },
    -- change some options
    opts = {
      defaults = {
        path_display = {
          shorten = {
            len = 3,
            exclude = { 1, -1 },
          },
          truncate = true,
        },
      },
    },
  },
}
