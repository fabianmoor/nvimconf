require("mason").setup{
  registries = {
    -- "lua:my-registry",
    "github:mason-org/mason-registry",
  },
}
require("mason-lspconfig").setup{
  ensure_installed = {"jdtls"},
}
