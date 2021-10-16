USER = vim.fn.expand('$USER')

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
    sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/lua-language-server"
    sumneko_binary = "/Users/" .. USER
                         .. "/.config/nvim/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
    sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
    sumneko_binary = "/home/" .. USER
                         .. "/.config/nvim/lua-language-server/bin/Linux/lua-language-server"
else
    print("Unsupported system for sumneko")
end

local luadev = require("lua-dev").setup({
    lspconfig = {
        filetypes = {"lua"},
        cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
        root_dir = require('lspconfig/util').root_pattern(".nv_root")
    }
})

local lspconfig = require('lspconfig')
lspconfig.sumneko_lua.setup(luadev)
