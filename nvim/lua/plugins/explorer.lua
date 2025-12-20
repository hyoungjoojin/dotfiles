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
      vim.keymap.set('n', '<leader>sT', ':TodoTelescope<CR>', { desc = 'Search todos' })
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Search in open files',
        }
      end, { desc = 'Search in open files' })

      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    lazy = false,
    keys = {
      { '<leader>e', ':Neotree toggle<CR>', desc = 'Toggle explorer', silent = true },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['<C-h>'] = 'navigate_up',
            ['h'] = 'toggle_node',
            ['l'] = 'open',
          },
        },
      },
    },
  },
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
