# Neovim

- Dependencies:
	- `fzf`:
		- *Ubuntu*: the `fzf` package does not install the `:FZF` command. Clone
		  the repo and run `~/.fzf/install`.
		- *MacOs*: `brew install fzf` then `$(brew --prefix)/opt/fzf/install`
	- `ripgrep`
- Post-install:
	- `$ nvim +PlugInstall`
	- `$ nvim +checkhealth`
