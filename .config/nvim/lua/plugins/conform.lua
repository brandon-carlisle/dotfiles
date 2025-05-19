return {
  {
    "stevearc/conform.nvim",
    -- We're providing a custom 'opts' function that LazyVim will call.
    -- The 'opts' argument here is the existing options table from LazyVim's default config or other plugins.
    opts = function(_, opts)
      -- Ensure 'formatters_by_ft' exists or initialize it
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      -- Add or override formatters for specific filetypes to use Biome
      -- vim.tbl_deep_extend("force", ...) will merge our settings, with ours taking precedence.
      vim.tbl_deep_extend("force", opts.formatters_by_ft, {
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
        -- You can add other filetypes Biome supports if needed:
        -- astro = { "biome" }, -- If Biome supports .astro formatting
        -- markdown = { "biome" }, -- If Biome supports .md formatting
        -- toml = { "biome" }, -- If Biome supports .toml formatting
      })

      -- If you needed to define specific arguments for the 'biome' formatter itself,
      -- you would do it in opts.formatters. Usually, this isn't necessary if
      -- Biome is picked up from your PATH and uses biome.json from your project.
      -- opts.formatters = opts.formatters or {}
      -- vim.tbl_deep_extend("force", opts.formatters, {
      --   biome = {
      --     -- Example: append_args or prepend_args if needed
      --   },
      -- })

      return opts -- Return the modified options table
    end,
  },
}
