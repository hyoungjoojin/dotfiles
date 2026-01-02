return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>lf',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = 'Format buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = false, cpp = false }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        java = {
          'google-java-format',
        },
        kotlin = { 'ktfmt' },
        lua = { 'stylua' },
        go = { 'gofumpt' },
        python = { 'isort', 'black' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        xml = { 'xmlformatter' },
        svg = { 'xmlformatter' },
        sql = { 'pg_format' },
        sh = { 'beautysh' },
        bash = { 'beautysh' },
        yaml = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        jsx = { 'prettier' },
        tsx = { 'prettier' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        markdown = { 'prettier', 'injected' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
      },
    },
  },
}
