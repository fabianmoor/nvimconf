vim.g.mapleader = " "

local keymap = vim.keymap
-- Basic Navigation
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
keymap.set("n", "<leader>L", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>H", "<C-w>s", { desc = "Split window horisontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader><Backspace>", "<cmd>close<CR>", { desc = "Close current split" })

-- Pane navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch pane left" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch pane rigth" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Switch pane up" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Switch pane down" })


keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer

-- Finding files
keymap.set("n", "ff", function() vim.cmd("Telescope find_files") end, { desc = "Find files" })
keymap.set("n", "fb", function() vim.cmd("Telescope buffers") end, { desc = "Find files" })

-- Switching buffers
keymap.set("n", "<S-l>", "<CMD>bnext<CR>")
keymap.set("n", "<S-h>", "<CMD>bprevious<CR>")

-- TogglTerm
keymap.set("n", "<D-Space>", function() vim.cmd("FloatermToggle") end, { desc = "Toggle Term"})
keymap.set("t", "<D-Space>", function() vim.cmd("FloatermToggle") end, { desc = "Toggle Term"})

keymap.set("n", "<leader>v", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })

-- LazyGit
keymap.set("n", "<leader>lg", function() vim.cmd("LazyGit") end, { desc = "Open LazyGit" })
