return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy", -- Load slightly after startup, ensuring it's ready for dependents
    dependencies = {
      -- "williamboman/mason-lspconfig.nvim", -- mason-lspconfig now depends on nvim-lspconfig
      "mfussenegger/nvim-jdtls", -- For Java LSP support functions
      "saghen/blink.cmp", -- For LSP capabilities with blink.cmp
      { -- For Neovim Lua development
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      -- Explicitly require a submodule to help ensure nvim-lspconfig's core is initialized.
      -- This is a bit of a heuristic but can sometimes resolve subtle load order issues.
      local _ = require("lspconfig.util")

      -- Set global diagnostic settings or other global LSP configurations.
      vim.diagnostic.config({ virtual_text = vim.g.diagnostics_virtual_text_enabled or false }) -- Ensure global diagnostic setting
    end,
  }
}
