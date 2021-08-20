local lspconfig = require "lspconfig"

local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    lintIgnoreExitCode = true,
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local lua_format = {formatCommand = "lua-format -i", formatStdin = true}

lspconfig.efm.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = true
        client.resolved_capabilities.goto_definition = false
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync{}")
    end,
    root_dir = function() return vim.fn.getcwd() end,
    settings = {
        languages = {
            lua = {lua_format},
            javascript = {eslint},
            javascriptreact = {eslint},
            ["javascript.jsx"] = {eslint},
            typescript = {eslint},
            typescriptreact = {eslint},
            ["typescript.tsx"] = {eslint}
        }
    },
    filetypes = {
        "lua", "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescript.tsx", "typescriptreact"
    }
}
