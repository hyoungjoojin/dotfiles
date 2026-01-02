return {
  {
    'hedyhli/outline.nvim',
    version = '*',
    lazy = false,
    config = function()
      require('outline').setup()
    end,
    keys = {
      { '<leader>lo', '<cmd>Outline<CR>', desc = 'Toggle outline', silent = true },
    },
  },
}
