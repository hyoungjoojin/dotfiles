return {
  {
    'github/copilot.vim',
    config = function()
      vim.keymap.set('n', '<leader>ae', ':Copilot enable<CR>:Copilot status<CR>', { desc = 'Enable AI autocomplete' })
      vim.keymap.set('n', '<leader>ad', ':Copilot disable<CR>:Copilot status<CR>', { desc = 'Disable AI autocomplete' })
      vim.keymap.set('i', '<M-j>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })

      vim.g.copilot_no_tab_map = true
    end,
  },
}
