local function on_attach(client)
    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync{}")
    end
end

require'lspconfig'.diagnosticls.setup {
    filetypes = {
        "lua", "javascript", "javascriptreact", "typescript", "typescriptreact",
        "javascript.jsx", "typescript.tsx"
    },
    on_attach = on_attach,
    init_options = {
        linters = {
            eslint = {
                command = './node_modules/.bin/eslint',
                rootPatterns = {'.git', 'package.json'},
                debounce = 100,
                args = {
                    '--stdin', '--stdin-filename', '%filepath', '--format',
                    'json'
                },
                sourceName = 'eslint',
                parseJson = {
                    errorsRoot = '[0].messages',
                    line = 'line',
                    column = 'column',
                    endLine = 'endLine',
                    endColumn = 'endColumn',
                    message = '${message} [${ruleId}]',
                    security = 'severity'
                },
                securities = {[2] = 'error', [1] = 'warning'}
            }
        },
        formatters = {
            eslintfmt = {
                sourceName = 'eslintfmt',
                rootPatterns = {'.git', 'package.json'},
                command = "./node_modules/.bin/eslint",
                args = {
                    '--fix', '--fix-to-stdout', '--stdin', '--stdin-filename',
                    '%filepath'
                }
            },
            luafmt = {command = 'lua-format', args = {'-i'}}
        },
        filetypes = {
            javascript = 'eslint',
            typescript = 'eslint',
            javascriptreact = 'eslint',
            typescriptreact = 'eslint',
            ["javascript.jsx"] = 'eslint',
            ["typescript.tsx"] = 'eslint'
        },
        formatFiletypes = {
            lua = 'luafmt',
            javascript = 'eslintfmt',
            typescript = 'eslintfmt',
            javascriptreact = 'eslintfmt',
            typescriptreact = 'eslintfmt',
            ["javascript.jsx"] = 'eslintfmt',
            ["typescript.tsx"] = 'eslintfmt'
        }
    }
}
