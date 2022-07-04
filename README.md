# Neovim

This configuration currently requires nightly builds to support
`nvim-treesitter`. On a mac:

```
brew update
brew install --HEAD tree-sitter luajit neovim
```

- Dependencies:
	- `ripgrep`
	- Language servers:
		- efm
		- gopls
		- lua-language-server:
			+ Install `cmake`
			+ Install `lua-language-server` from [here](https://github.com/sumneko/lua-language-server/wiki/PreCompiled-Binaries)
			+ Install `luarocks`
			+ Install `luaformatter` from [here](https://github.com/Koihik/LuaFormatter)
		- terraform-ls
		- tsserver
		- yamlls
- Post-install:
	- `$ nvim +PlugInstall`
	- `$ nvim +checkhealth`
