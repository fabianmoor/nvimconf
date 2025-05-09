return {
  "neovim/nvim-lspconfig",
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {
    "saghen/blink.cmp",
  },
  config = function()
    local lspconfig = require("lspconfig")

  end,
}
