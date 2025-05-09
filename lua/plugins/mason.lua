return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason", -- Lazy load on command
    config = function()
      require("mason").setup {
        registries = {
          "github:mason-org/mason-registry",
        },
        -- You can add other Mason UI options here if desired
        -- ui = {
        --   border = "rounded",
        -- },
      }
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy", -- Ensure this also loads lazily, after nvim-lspconfig due to dependency
    -- This plugin's config function sets up LSP servers using nvim-lspconfig.
    -- Therefore, it needs nvim-lspconfig to be loaded first.
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      vim.schedule(function()
        local lsp_utils = require("core.lsp_utils") -- Our shared LSP utilities

        require("mason-lspconfig").setup {
          ensure_installed = { "jdtls", "lua_ls", "pyright" },
          handlers = {
            -- Default handler
            function(server_name)
              require("lspconfig")[server_name].setup {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
                on_attach = lsp_utils.on_attach,
              }
            end,
            -- Custom handler for lua_ls
            ["lua_ls"] = function()
              require("lspconfig").lua_ls.setup {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
                on_attach = lsp_utils.on_attach,
                settings = {
                  Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                    telemetry = { enable = false },
                  },
                },
              }
            end,
            -- Custom handler for jdtls
            ["jdtls"] = function()
              require("config.java").setup { -- Uses your existing lua/config/java.lua
                capabilities = require("blink.cmp").get_lsp_capabilities(),
                on_attach = lsp_utils.on_attach,
              }
            end,
            -- Add other custom handlers here if needed
          },
        }
      end)
    end,
  },
}

