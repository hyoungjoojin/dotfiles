return {
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
      window = {
        position = 'left',
        width = 30,
      },
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            '.git',
            '.DS_Store',
          },
        },
        window = {
          mappings = {
            ['h'] = 'close_node',
            ['<C-h>'] = 'navigate_up',
            ['<C-.>'] = 'set_root',
            ['P'] = {
              'toggle_preview',
              config = {
                use_float = true,
                title = 'Preview',
              },
            },
            ['l'] = 'open_vsplit',
          },
        },
        follow_current_file = { enabled = true },
      },
    },
  },
}
