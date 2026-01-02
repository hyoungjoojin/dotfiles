return {
  {
    'nvim-mini/mini.nvim',
    config = function()
      require('mini.misc').setup()
      MiniMisc.setup_auto_root { '.git', 'lua', 'src', 'srcs', 'Makefile' }
    end,
  },
}
