return {
  "mhartington/formatter.nvim",
  config = function()
    local util = require "formatter.util"

    -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
    require("formatter").setup {
      -- Enable or disable logging
      logging = true,
      -- Set the log level
      log_level = vim.log.levels.WARN, -- You can change this to DEBUG for more verbosity

      -- All formatter configurations are opt-in
      filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        lua = {
          -- "formatter.filetypes.lua" defines default configurations for the
          -- "lua" filetype
          require("formatter.filetypes.lua").stylua,

          -- You can also define your own configuration
          function()
            -- Supports conditional formatting
            if util.get_current_buffer_file_name() == "special.lua" then return nil end

            -- Full specification of configurations is down below and in Vim help
            -- files
            return {
              exe = "stylua",
              args = {
                "--search-parent-directories",
                "--stdin-filepath",
                util.escape_path(util.get_current_buffer_file_path()),
                "--",
                "-",
              },
              stdin = true,
            }
          end,
        },

        -- === Add Java configuration here ===
        java = {
          -- Configuration using google-java-format
          function()
            return {
              exe = "google-java-format", -- Replace with your formatter's executable if different
              args = {
                -- Add arguments specific to your formatter here.
                -- For google-java-format, common args might include:
                -- "--aosp", -- or "--google" for different styles

                -- Use '-' to tell google-java-format to read from stdin
                "-",

                -- Optional: If you want diagnostics to show the original filename
                -- you can use --assume-filename, but remove the extra '--' and '-'
                -- as they are not needed when using '--assume-filename' for stdin
                -- "--assume-filename", util.escape_path(util.get_current_buffer_file_path()),
              },
              stdin = true, -- This tells formatter.nvim to pipe the buffer content
            }
          end,
          -- You can add more Java formatters here if you want to chain them
        },
        -- ==================================

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
          -- "formatter.filetypes.any" defines default configurations for any
          -- filetype
          require("formatter.filetypes.any").remove_trailing_whitespace,
          -- Remove trailing whitespace without 'sed'
          -- require("formatter.filetypes.any").substitute_trailing_whitespace,
        },
      },
    }
  end,
}
