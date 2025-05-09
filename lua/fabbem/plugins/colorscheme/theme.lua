return {
  {
    "yashguptaz/calvera-dark.nvim",
    lazy = false,
    priority = 1000,
    name = "calvera-dark",
  },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        variant = "default",
        transparent = true,
      })
    end,
  },
  {
    "tiagovla/tokyodark.nvim"
  },
}
