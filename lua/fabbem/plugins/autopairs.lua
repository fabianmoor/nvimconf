return {
  'windwp/nvim-autopairs',
  event = "InsertEnter", -- Load plugin when entering insert mode
  -- Optional dependency for better handling with nvim-cmp
  dependencies = { 'hrsh7th/nvim-cmp' }, 
  config = function()
    require('nvim-autopairs').setup({
      -- You can add configuration options here if needed
      -- check_ts = true, -- Enable treesitter integration (recommended)
      -- ts_config = {
      --   lua = {'string'}, -- Don't add pairs inside lua string literals
      --   javascript = {'template_string'}, -- Don't add pairs inside js template literals
      -- }
      -- By default, it works well out-of-the-box for most pairs
    })

    -- Optional: If you use nvim-cmp, integrate autopairs
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp') -- Make sure cmp is required AFTER autopairs setup
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end,
}
