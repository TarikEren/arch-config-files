return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        -- Tell LazyVim to completely skip its built-in gopls setup function
        gopls = function(_, opts)
          local lspconfig = require("lspconfig")
          -- Manually get standard capabilities from blink.cmp
          local capabilities = require("blink.cmp").get_lsp_capabilities(opts.capabilities)

          -- Safely establish textDocument if it didn't attach right
          capabilities.textDocument = capabilities.textDocument or {}

          -- Initialize the server safely
          lspconfig.gopls.setup({
            capabilities = capabilities,
            settings = opts.settings,
          })
          return true -- Return true so LazyVim does not run its broken default hook
        end,
      },
    },
  },
}
