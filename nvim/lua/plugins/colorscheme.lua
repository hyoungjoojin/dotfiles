return {
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      require('nightfox').setup {
        options = {
          styles = {
            comments = 'NONE',
            conditionals = 'NONE',
            constants = 'bold',
            functions = 'italic',
            keywords = 'NONE',
            numbers = 'bold',
            operators = 'NONE',
            strings = 'NONE',
            types = 'NONE',
            variables = 'NONE',
          },
        },
      }

      vim.opt.termguicolors = true
      vim.cmd.colorscheme 'terafox'
    end,
  },
}
