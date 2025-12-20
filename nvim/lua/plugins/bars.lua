local modes = {
  ['NORMAL'] = 'N',
  ['O-PENDING'] = 'N?',
  ['INSERT'] = 'I',
  ['VISUAL'] = 'V',
  ['V-BLOCK'] = 'VB',
  ['V-LINE'] = 'VL',
  ['V-REPLACE'] = 'VR',
  ['REPLACE'] = 'R',
  ['COMMAND'] = '!',
  ['SHELL'] = 'SH',
  ['TERMINAL'] = 'T',
  ['EX'] = 'X',
  ['S-BLOCK'] = 'SB',
  ['S-LINE'] = 'SL',
  ['SELECT'] = 'S',
  ['CONFIRM'] = 'Y?',
  ['MORE'] = 'M',
}

return {
  {
    -- Tab bar
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
  {
    -- Status bar
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = false,
          theme = 'auto',
          component_separators = { left = '|', right = '|' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(m)
                return modes[m] or m
              end,
              separator = { right = '' },
            },
            {
              'selectioncount',
              separator = {
                left = '',
                right = '',
              },
            },
          },
          lualine_b = {
            {
              'branch',
              icons_enabled = true,
              icon = '󰘬',
            },
          },
          lualine_c = {
            { 'filename', file_status = false, path = 3 },
          },
          lualine_x = {
            {
              'lsp_status',
              icon = '',
              symbols = {
                -- Standard unicode symbols to cycle through for LSP progress:
                spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                -- Standard unicode symbol for when LSP is done:
                done = '',
                -- Delimiter inserted between LSP names:
                separator = ' ',
              },
              -- List of LSP names to ignore (e.g., `null-ls`):
              ignore_lsp = {},
              -- Display the LSP name
              show_name = true,
            },
            {
              'diagnostics',
              source = { 'nvim' },
              sections = {
                'error',
                'warn',
                'info',
                'hint',
              },
              symbols = { error = ' ', warn = '󰀪 ', info = '󰋽 ', hint = ' ' },
              colored = true, -- Displays diagnostics status in color if set to true.
              update_in_insert = false, -- Update diagnostics in insert mode.
              always_visible = true, -- Show diagnostics even if there are none.
            },
          },
          lualine_y = {},
          lualine_z = {
            -- line:character position
            '%l:%c %3p%%',
          },
        },
        winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {
            {
              'searchcount',
            },
          },
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
  },
}
