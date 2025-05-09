-- Plugin Manager
require("config.lazy")

-- Core Neovim settings
require("core.options")
require("core.keymaps")

-- LSP, Linting, Formatting, and Tools Installation
-- require("config.mason") -- Setup moved to plugin definitions for proper load order
require("config.tree-sitter")
require("config.none-ls")
require("config.formatter")
-- config.java will be loaded automatically via mason-lspconfig handler
-- config.lsp_signature functionality will be integrated into the main LSP setup

-- UI Enhancements & Theme
require("config.alpha") -- Dashboard
-- require("config.bufferline") -- Bufferline setup is handled by its plugin config
require("config.gitsigns") -- Git integration

vim.cmd.colorscheme "catppuccin-macchiato"

-- Other configurations (ensure these are not managed by plugins directly)
-- require("config.codecompanion")
-- require("config.mason_workaround")

-- Shell
vim.o.shell = "/nix/store/ygxds1yhw56046whxq36fkkx96fjy42s-zsh-5.9/bin/zsh"
