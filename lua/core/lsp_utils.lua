-- lua/core/lsp_utils.lua
local M = {}

---@diagnostic disable-next-line: unused-local
M.on_attach = function(client, bufnr)
  -- Enable LSP Signature help
  require("lsp_signature").on_attach({
    bind = true, -- This is the default
    handler_opts = {
      border = "rounded", -- Or "single", "double", "shadow", etc.
    },
    -- Other lsp_signature options can go here
  }, bufnr)

  -- Standard LSP Keymaps
  local map = vim.keymap.set
  local opts = { buffer = bufnr, noremap = true, silent = true }

  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map("n", "<leader>D", vim.lsp.buf.type_definition, opts) -- Leader D for type definition
  map("n", "<leader>lr", vim.lsp.buf.rename, opts)
  map("n", "<leader>la", vim.lsp.buf.code_action, opts)
  map("n", "gr", vim.lsp.buf.references, opts)
  map("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, opts) -- Leader lf for format

  -- Diagnostic keymaps
  map("n", "[d", vim.diagnostic.goto_prev, opts)
  map("n", "]d", vim.diagnostic.goto_next, opts)
  map("n", "<leader>de", vim.diagnostic.open_float, opts) -- Leader de for diagnostics float
  map("n", "<leader>dq", vim.diagnostic.setloclist, opts) -- Leader dq for diagnostics quickfix

  -- Highlight symbol under cursor on CursorHold and CursorHoldI
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

return M