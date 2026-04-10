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
      {
        "<leader>fC",
        function()
          local root = LazyVim.root()

          Snacks.picker.files({
            cwd = root,
            title = "Env Files",
            hidden = true,
            ignored = true,
            follow = true,
            exclude = { ".git", "node_modules", "dist", "build", ".venv", "venv", "__pycache__" },
            transform = function(item)
              local name = vim.fn.fnamemodify(item.file, ":t")
              local allowed = {
                [".env"] = true,
                [".env.local"] = true,
                [".env.development"] = true,
                [".env.development.local"] = true,
                [".env.production"] = true,
                [".env.production.local"] = true,
                [".env.test"] = true,
                [".env.test.local"] = true,
                ["local.settings.json"] = true,
                ["environment.ts"] = true,
                ["environment.development.ts"] = true,
                ["environment.staging.ts"] = true,
                ["environment.production.ts"] = true,
              }
              return allowed[name] and item or false
            end,
          })
        end,
        desc = "Env Files",
      },
    },
  },
}
