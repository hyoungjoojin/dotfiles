return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'mason-org/mason.nvim',
    },
    config = function()
      require('mason-tool-installer').setup {
        ensure_installed = {
          -- bash
          'beautysh',

          -- markdown
          'markdownlint',

          'clang-format',
          'gofumpt',
          'ktfmt',
          'google-java-format',
          'isort',
          'black',
          'xmlformatter',
          'lua-language-server',
          'marksman',
          'prettier',
          'python-lsp-server',
          'rust-analyzer',
          'shellcheck',
          'shellharden',
          'stylua',
          'zls',
        },
      }
    end,
  },
}
