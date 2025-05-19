return {
  {
    "mfussenegger/nvim-lint",
    -- We're providing a custom 'opts' function.
    -- The 'opts' argument is the existing options table.
    opts = function(_, opts)
      -- Ensure 'linters_by_ft' exists or initialize it
      opts.linters_by_ft = opts.linters_by_ft or {}

      -- Add or override linters for specific filetypes to use Biome
      -- This guides nvim-lint to use Biome, which typically sources diagnostics
      -- from the active Biome LSP.
      vim.tbl_deep_extend("force", opts.linters_by_ft, {
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
        -- You can add other filetypes Biome supports if needed
        -- astro = { "biome" },
        -- markdown = { "biome" },
        -- toml = { "biome" },
      })

      -- If 'biome' is not automatically recognized as a linter source by nvim-lint
      -- (which it usually is if the Biome LSP is active and providing diagnostics),
      -- you might need to define it in 'opts.linters'. However, for LSP-backed linters,
      -- this is often not required. The `extras.formatting.biome` should already
      -- ensure the Biome LSP is set up.
      -- opts.linters = opts.linters or {}
      -- vim.tbl_deep_extend("force", opts.linters, {
      --   biome = {
      --     -- Usually nvim-lint picks this up from LSP.
      --     -- If manual CLI setup was needed (less common for Biome with LSP):
      --     -- cmd = "biome",
      --     -- args = { "lint", "--stdin-file-path", "-" }, -- or "check"
      --     -- ... other options from nvim-lint docs if needed ...
      --   },
      -- })
      return opts -- Return the modified options table
    end,
  },
}
