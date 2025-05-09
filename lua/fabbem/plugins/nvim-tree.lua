return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Recommended for icons
  config = function()
    -- Define the on_attach function BEFORE the setup call
    local function my_nvim_tree_on_attach(bufnr)
      local api = require("nvim-tree.api")

      -- Define helper function for keymap options
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- <<<<<<<<<< IMPORTANT >>>>>>>>>>
      -- First, apply the default mappings
      -- This ensures keys like <CR>, g?, etc., still work as expected
      api.config.mappings.default_on_attach(bufnr)

      -- <<<<<<<<<< YOUR CUSTOM MAPPING >>>>>>>>>>
      -- Now, add your custom mapping for 'l' to perform the 'edit' action
      -- This will work alongside the default <CR> mapping
      vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'h', api.node.open.edit, opts('Close'))
      vim.keymap.set('n', 'h', api.node.open.edit, opts('Close'))

      -- Example: You could REMOVE a default mapping if you wanted:
      -- vim.keymap.del('n', '<CR>', { buffer = bufnr })

      -- Example: You could OVERRIDE a default mapping:
      -- vim.keymap.set('n', '<CR>', api.tree.change_root_to_node, opts('CD')) -- Make Enter change root instead of open

      -- Add any other custom mappings you want here, using the 'opts' function
      -- vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))

    end -- End of the on_attach function definition

    -- Now call setup, passing your on_attach function
    require("nvim-tree").setup({
      -- You no longer need view.mappings here when using on_attach

      -- Keep your other setup options:
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        }
      },

      view = {
        width = 30,
        -- Remove or comment out the old mappings section if it was here
        -- mappings = { ... }
      },

      renderer = {
        group_empty = true,
        icons = {
           glyphs = {
             default = "",
             symlink = "",
             folder = {
               arrow_closed = "",
               arrow_open = "",
               default = "",
               open = "",
               empty = "",
               empty_open = "",
               symlink = "",
               symlink_open = "",
             },
             git = {
               unstaged = "M",
               staged = "S",
               unmerged = "",
               renamed = "➜",
               untracked = "U",
               deleted = "",
               ignored = "◌",
             },
           },
         },
      },

      -- Assign your custom on_attach function here
      on_attach = my_nvim_tree_on_attach,

      -- ... any other nvim-tree options you might have ...
    })

  end, -- End of the config function
}



















