require("mason").setup{
  registries = {
    -- "lua:my-registry",
    "github:mason-org/mason-registry",
  },
}
require("mason-lspconfig").setup {
    ensure_installed = {
      "lua_ls",
      "rust_analyzer",
      "jdtls" 
      },
}
