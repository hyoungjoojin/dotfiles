return {
  {
    'akinsho/bufferline.nvim',
    version = '4.9.1',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'buffers',
          numbers = 'none',
          separator_style = 'slope',
          always_show_bufferline = true,
          tab_size = 16,
          hover = {
            enabled = false,
          },
        },
      }
    end,
    keys = function()
      local keymaps = {}

      local bufferline = require 'bufferline'
      for i = 1, 9 do
        table.insert(keymaps, {
          '<leader>b' .. i,
          function()
            bufferline.go_to(i, true)
          end,
          desc = 'Go to buffer ' .. i,
        })
      end

      return keymaps
    end,
  },
}
