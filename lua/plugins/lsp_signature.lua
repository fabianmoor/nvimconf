return {
  "ray-x/lsp_signature.nvim",
  event = "LspAttach", -- Or "VeryLazy" or keep "InsertEnter" if preferred
  opts = {
    -- Configuration options for lsp_signature.nvim
    -- The on_attach logic is now handled in core/lsp_utils.lua
    -- but you can still set other options here, e.g.:
    -- hint_enable = true,
    -- hint_prefix = "🐼 ",
  },
}
