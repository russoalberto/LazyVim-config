-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local neoTreeToogle = function()
  require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
end

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferLineCyclePrev<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferLineCycleNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferLineMovePrev<CR>", opts)
map("n", "<A->>", "<Cmd>BufferLineMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
-- Pin/unpin buffer
map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", opts)
map("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", opts)
-- Close buffer
map("n", "<leader>bx", "<Cmd>Bdelete<CR>", opts)
-- Magic buffer-picking mode
map("n", "<leader>bk", "<Cmd>BufferLinePick<CR>", opts)
map("n", "<leader>bK", "<Cmd>BufferLinePickClose<CR>", opts)
-- Sort automatically by...
map("n", "<leader>bt", "<Cmd>BufferLineSortByTabs<CR>", opts)
map("n", "<leader>bd", "<Cmd>BufferLineSortByDirectory<CR>", opts)
map("n", "<leader>br", "<Cmd>BufferLineSortByRelativeDirectory<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- neoTree
vim.keymap.set("n", "<A-t>", neoTreeToogle, { silent = true })

-- LSP format
vim.keymap.set("n", "<A-i>", function()
  vim.lsp.buf.format({ async = true })
end, { silent = true })

-- Harpoon
vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon: add file" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

-- Zen mode
vim.keymap.set("n", "<leader>zz", function()
  require("zen-mode").toggle()
  vim.wo.wrap = false
end, { desc = "Zen mode" })

-- Undo tree
vim.keymap.set("n", "<leader>h", vim.cmd.UndotreeToggle, { desc = "Undo tree" })
