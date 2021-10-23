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
		- lua-language-server
		- terraform-ls
		- tsserver
		- yamlls
- Post-install:
	- `$ nvim +PlugInstall`
	- `$ nvim +checkhealth`
