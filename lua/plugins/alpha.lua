return {
  'goolord/alpha-nvim',
  config = function ()
    local alpha = require('alpha')

    -- 1. Define your ASCII art header
    local header_val = {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "   ██▓    ▓█████ ▄▄▄█████▓  ██████     ▄████▄   ▒█████  ▓█████▄ ▓█████ ",
    "  ▓██▒    ▓█   ▀ ▓  ██▒ ▓▒▒██    ▒    ▒██▀ ▀█  ▒██▒  ██▒▒██▀ ██▌▓█   ▀ ",
    "  ▒██░    ▒███   ▒ ▓██░ ▒░░ ▓██▄      ▒▓█    ▄ ▒██░  ██▒░██   █▌▒███   ",
    "  ▒██░    ▒▓█  ▄ ░ ▓██▓ ░   ▒   ██▒   ▒▓▓▄ ▄██▒▒██   ██░░▓█▄   ▌▒▓█  ▄ ",
    "  ░██████▒░▒████▒  ▒██▒ ░ ▒██████▒▒   ▒ ▓███▀ ░░ ████▓▒░░▒████▓ ░▒████▒",
    "  ░ ▒░▓  ░░░ ▒░ ░  ▒ ░░   ▒ ▒▓▒ ▒ ░   ░ ░▒ ▒  ░░ ▒░▒░▒░  ▒▒▓  ▒ ░░ ▒░ ░",
    "  ░ ░ ▒  ░ ░ ░  ░    ░    ░ ░▒  ░ ░     ░  ▒     ░ ▒ ▒░  ░ ▒  ▒  ░ ░  ░",
    "    ░ ░      ░     ░      ░  ░  ░     ░        ░ ░ ░ ▒   ░ ░  ░    ░   ",
    "      ░  ░   ░  ░               ░     ░ ░          ░ ░     ░       ░  ░",
    "                                      ░                  ░             ",
    }

    -- 2. Define the layout: an array containing only your header section
    local layout = {
      {
        type = "text", -- Use 'text' type for raw text/ASCII art
        val = header_val, -- Assign your header table
        opts = {
          -- Choose a highlight group for your art. Examples:
          -- hl = "DashboardHeader", -- Might be defined by alpha themes
          hl = "Type", -- Often a distinct color in themes
          -- hl = "Comment", -- Often a dimmer color
          -- hl = "String", -- Often another color
          position = "center", -- Center the text block
          -- You can add wrap = "overflow" or other opts if needed
        }
      },
      -- NO other sections (buttons, footer, etc.) are defined here!
    }

    -- 3. Call alpha.setup with your custom layout
    alpha.setup({
      layout = layout,
      -- You can add other top-level options here if needed, e.g.:
      -- opts = {
      --   noautocmd = true,
      -- }
    })

  end,
}
