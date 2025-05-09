require("config.lazy")
require("config.mason")
require("core.options")
require("core.keymaps")
require("config.tree-sitter")
require("config.gitsigns")
require("config.none-ls")
require("config.lsp_signature")
require("config.formatter")
require("config.mason")
-- require("config.blink-cmp")
require("config.lsp")
-- require("config.mason_workaround")

-- Theme
vim.cmd.colorscheme "catppuccin-macchiato"


-- Shell
vim.o.shell = "/nix/store/ygxds1yhw56046whxq36fkkx96fjy42s-zsh-5.9/bin/zsh"


-- Inline Diagnostics
vim.diagnostic.config({ virtual_text = true })
