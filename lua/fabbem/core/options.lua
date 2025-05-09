vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

vim.diagnostic.config({ virtual_text = false })

opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search Settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true

opt.signcolumn = "yes"

opt.clipboard:append("unnamedplus")


opt.splitright = true
opt.splitbelow = true
