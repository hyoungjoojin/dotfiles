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
    -- Status bar
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = false,
          theme = 'auto',
          component_separators = { left = '|', right = '|' },
          section_separators = { left = ' ', right = ' ' },
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
            { 'filename', file_status = true },
          },
          lualine_x = {
            {
              'lsp_status',
              symbols = {
                -- Standard unicode symbols to cycle through for LSP progress:
                spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                -- Standard unicode symbol for when LSP is done:
                done = '',
                -- Delimiter inserted between LSP names:
                separator = ' ',
              },
              -- List of LSP names to ignore (e.g., `null-ls`):
              ignore_lsp = {
                'GitHub Copilot',
                'stylua',
              },
              -- Display the LSP name
              show_name = true,
            },
            {
              function()
                local status, conform = pcall(require, 'conform')
                if not status then
                  return '󱪟'
                end

                local lsp_format = require 'conform.lsp_format'

                -- Get formatters for the current buffer
                local formatters = conform.list_formatters_for_buffer()
                if formatters and #formatters > 0 then
                  local formatterNames = {}

                  for _, formatter in ipairs(formatters) do
                    table.insert(formatterNames, formatter)
                  end

                  return table.concat(formatterNames, ' ')
                end

                -- Check if there's an LSP formatter
                local bufnr = vim.api.nvim_get_current_buf()
                local lsp_clients = lsp_format.get_format_clients { bufnr = bufnr }

                if not vim.tbl_isempty(lsp_clients) then
                  return '󱪟'
                end

                return '󱪟'
              end,
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
          lualine_y = {
            {
              'filetype',
              colored = false,
            },
          },
          lualine_z = {
            -- line:character position
            '%l:%c | %p%%',
          },
        },
        winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {
            {
              'searchcount',
            },
          },
          lualine_z = {},
        },
      }
    end,
  },
}
