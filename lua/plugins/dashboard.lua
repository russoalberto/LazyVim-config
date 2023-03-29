return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.buttons.val = {
        opts.button("p", " " .. " Open project", ":Telescope projects <CR>"),
        unpack(opts.section.buttons.val),
      }
    end,
  },
}
