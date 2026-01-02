return {
  {
    'numToStr/FTerm.nvim',
    opts = {
      auto_close = false,
      blend = 0,
    },
    keys = function()
      local fterm = require 'FTerm'
      return {
        { '<leader>tt', fterm.toggle, desc = 'Toggle terminal' },
      }
    end,
  },
}
