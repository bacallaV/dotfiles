return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    opts = {
      disable_background = false,
      disable_float_background = false,
      disable_italics = false,
      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
    end,
  },
}
