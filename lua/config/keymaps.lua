-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")

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

-- BufferLine
wk.register({
  b = {
    name = "BufferLine",
    k = { "<Cmd>BufferLinePick<CR>", "Pick buffer" },
    K = { "<Cmd>BufferLinePickClose<CR>", "Close buffer" },
    p = { "<Cmd>BufferLineTogglePin<CR>", "Pin buffer" },
    P = { "<Cmd>BufferLineGroupClose ungrouped<CR>", "Unpin buffer" },
    b = { "<Cmd>Bdelete<CR>", "Close buffer" },
    t = { "<Cmd>BufferLineSortByTabs<CR>", "Sort by tabs" },
    s = { "<Cmd>BufferLineSortByDirectory<CR>", "Sort by directory" },
    r = { "<Cmd>BufferLineSortByRelativeDirectory<CR>", "Sort by relative directory" },
  },
}, {
  prefix = "<leader>",
})

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
wk.register({
  z = {
    name = "Zen mode",
    z = { "<Cmd>ZenMode<CR>", "Toggle zen mode" },
  },
}, {
  prefix = "<leader>",
})

-- Undo tree
wk.register({
  h = {
    name = "Undo tree",
    s = { "<Cmd>UndotreeShow<CR>", "Show undo tree" },
    h = { "<Cmd>UndotreeHide<CR>", "Hide undo tree" },
    t = { "<Cmd>UndotreeToggle<CR>", "Toggle undo tree" },
  },
}, {
  prefix = "<leader>",
})
