return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>fw",
        function()
          local root = LazyVim.root()
          local workflows = vim.fs.joinpath(root, ".github", "workflows")

          if vim.uv.fs_stat(workflows) then
            Snacks.picker.files({
              cwd = workflows,
              title = "GitHub Workflows",
            })
          else
            vim.notify("No existe la carpeta .github/workflows en este proyecto", vim.log.levels.WARN)
          end
        end,
        desc = "GitHub Workflows",
      },
    },
  },
}
