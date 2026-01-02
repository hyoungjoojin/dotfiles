return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      local actions = require 'telescope.actions'

      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<esc>'] = actions.close,
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
            },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search files' })
      vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Search buffers' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search diagnostics' })
      vim.keymap.set('n', '<leader>st', builtin.live_grep, { desc = 'Search text' })
      vim.keymap.set('n', '<leader>ss', builtin.search_history, { desc = 'Search search history' })
      vim.keymap.set('n', '<leader>sg', builtin.git_status, { desc = 'Search through git status' })
      vim.keymap.set('n', '<leader>sT', ':TodoTelescope<CR>', { desc = 'Search todos' })
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Search text in open files',
        }
      end, { desc = 'Search text in open files' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Search recently opened files' })
    end,
  },
}
