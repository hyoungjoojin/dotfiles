return {
  {
    'folke/trouble.nvim',
    keys = {
      {
        '<leader>ld',
        function()
          require('trouble').toggle 'diagnostics'
        end,
        mode = 'n',
        desc = 'Toggle Diagnostics',
      },
    },
    opts = {},
  },
}
