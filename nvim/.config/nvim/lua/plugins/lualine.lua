return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local icons = LazyVim.config.icons

    local opts = {
      options = {
        -- theme = "catppuccinofrappe",
        -- section_separators = { left = "", right = "" },
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      -- Sections
      -- +-------------------------------------------------+
      -- | A | B | C                             X | Y | Z |
      -- +-------------------------------------------------+
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_c = {
          -- LazyVim.lualine.root_dir(),
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location" },
        },
        lualine_z = {
          {
            function()
              return " " .. os.date("%R")
            end,
            separator = { right = "" },
          },
        },
      },
    }
    return opts
  end,
}
