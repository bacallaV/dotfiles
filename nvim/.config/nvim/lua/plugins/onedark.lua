return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "deep", -- estilos: dark, darker, cool, deep, warm, warmer
      transparent = false,
      term_colors = true,
      code_style = {
        comments = "italic",
        keywords = "bold",
      },
    },
    config = function(_, opts)
      require("onedark").setup(opts)
    end,
  },
}
