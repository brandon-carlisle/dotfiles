return {
  {
    "neovim/nvim-lspconfig",
    -- This 'opts' function is for the ENTIRE nvim-lspconfig plugin.
    opts = function(_, opts) -- 'opts' is LazyVim's default opts for nvim-lspconfig
      opts.servers = opts.servers or {}
      opts.servers.vtsls = opts.servers.vtsls or {} -- Ensures vtsls entry is a table

      local vtsls_current_settings = opts.servers.vtsls.settings
      if type(vtsls_current_settings) ~= "table" then
        vtsls_current_settings = {}
      end

      local your_custom_vtsls_settings = {
        typescript = {
          format = { enable = false },
        },
        javascript = {
          format = { enable = false },
        },
      }

      opts.servers.vtsls.settings = vim.tbl_deep_extend("force", vtsls_current_settings, your_custom_vtsls_settings)

      return opts -- Return the modified main opts table
    end,
  },
}
