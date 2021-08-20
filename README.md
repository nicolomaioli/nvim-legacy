# Neovim

- Dependencies:
	- `fzf`:
		- *Ubuntu*: the `fzf` package does not install the `:FZF` command. Clone
		  the repo and run `~/.fzf/install`.
		- *MacOs*: `brew install fzf` then `$(brew --prefix)/opt/fzf/install`
	- `ripgrep`
	- Language servers:
		- tsserver `npm i -g typescript typescript typescript-language-server`
		- diagnostic ls `npm i -g diagnostic-language-server`
- Post-install:
	- `$ nvim +PlugInstall`
	- `$ nvim +checkhealth`
