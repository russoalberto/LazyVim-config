return {
  'akinsho/toggleterm.nvim',
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      size = 10,
      direction = "horizontal",
      close_on_exit = true,
      shading_factor = '-15',
    })
  end
}
