return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Optional for icons
  opts = {
    options = {
      -- ... other lualine options
      theme = 'auto', -- or your preferred theme
    },
    sections = {
      -- ... other sections (lualine_a, lualine_b)
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {
         'location',
         {
           'diagnostics',
           -- Displays errors, warnings, info, hints counts
           sources = { "nvim_diagnostic" }, -- Use built-in diagnostics
           sections = { 'error', 'warn', 'info', 'hint' },
           diagnostics_color = {
             error = 'LualineDiagnosticError', -- Defined by your colorscheme
             warn  = 'LualineDiagnosticWarn',
             info  = 'LualineDiagnosticInfo',
             hint  = 'LualineDiagnosticHint',
           },
           symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}, -- Requires Nerd Font
         }
      }
      -- ... other sections
    },
    -- ... other lualine config
  }
}
