return {
  {
    'numToStr/Comment.nvim',
    config = function()
      local call = require('Comment.api').call
      vim.keymap.set('n', '<leader>/', call('toggle.linewise.current', 'g@$'), { expr = true, desc = 'Toggle comment for current line' })
      vim.keymap.set(
        'x',
        '<leader>/',
        '<ESC><CMD>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())<CR>',
        { desc = 'Toggle comment for selected line' }
      )
    end,
    opts = {
      mappings = {
        basic = false,
        extra = false,
      },
    },
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
