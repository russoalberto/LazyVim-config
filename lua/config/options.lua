-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function(tbl)
    if vim.bo[tbl.buf].filetype == "neo-tree" then
      require("bufferline.api").set_offset(40, "FileTree")
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWipeout" }, {
  callback = function(tbl)
    if vim.bo[tbl.buf].filetype == "neo-tree" then
      require("bufferline.api").set_offset(0)
    end
  end,
})

vim.o.mouse = ""
