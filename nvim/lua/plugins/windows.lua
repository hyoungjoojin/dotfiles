return {
  {
    'nvim-zh/colorful-winsep.nvim',
    version = '*',
    config = function()
      require('colorful-winsep').setup {
        border = 'single',
        excluded_ft = {
          'mason',
          'neo-tree',
        },
        animate = {
          enabled = false,
        },
        indicator_for_2wins = {
          position = false,
        },
      }
    end,
    event = { 'WinLeave' },
  },
  {
    'christoomey/vim-tmux-navigator',
    version = '1.0',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', desc = 'Navigate to left tmux pane' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>', desc = 'Navigate to down tmux pane' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>', desc = 'Navigate to up tmux pane' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>', desc = 'Navigate to right tmux pane' },
    },
  },
}
