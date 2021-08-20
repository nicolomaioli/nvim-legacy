call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'
Plug 'mileszs/ack.vim'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
call plug#end()

filetype plugin on
syntax enable
runtime! macros/matchit.vim
let mapleader=" "
set termguicolors
set number
set colorcolumn=80
set textwidth=79
set linebreak
set noexpandtab ts=4 sw=4
set smartindent
set mouse=a
set laststatus=2
set ignorecase
set smartcase
set showcmd
set foldmethod=indent
set foldlevel=99
set splitbelow
set splitright
set spelllang=en_gb
set clipboard+=unnamedplus
set wildignorecase
set hidden
set nobackup
set nowritebackup
set noswapfile
set updatetime=300
set shortmess+=c
set signcolumn=yes
set omnifunc=syntaxcomplete#Complete
silent! helptags ALL

colorscheme onedark
let g:onedark_terminal_italics=1
highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" OS Specific configuration
if !exists("g:os")
	if has("win64") || has("win32") || has("win16")
		let g:os = "Windows"
	else
		let g:os = substitute(system("uname"), '\n', '', '')
	endif
endif

if g:os == "Darwin"
	set rtp+=/usr/local/opt/fzf
	let g:python_host_prog="/usr/local/bin/python2"
	let g:python3_host_prog="/usr/local/bin/python3"
elseif g:os == "Linux"
	set rtp+=~/.fzf
	let g:python_host_prog="/usr/bin/python2"
	let g:python3_host_prog="/usr/bin/python3"
endif

" Plugin configuration
let g:lightline = {
	\ 	'colorscheme': 'onedark',
	\ 	'active': {
	\ 		'left': [
	\ 			[
	\ 				'mode',
	\ 				'paste'
	\ 			],
	\ 			[
	\ 				'cocstatus',
	\ 				'gitbranch',
	\ 				'readonly',
	\ 				'relativepath',
	\ 				'modified'
	\ 			]
	\ 		]
	\ 	},
	\ 	'component': {
	\ 		'relativepath': '%f'
	\ 	},
	\ 	'component_function': {
	\ 		'gitbranch': 'fugitive#head',
	\ 		'cocstatus': 'coc#status'
	\ 	}
	\ }

if executable('rg')
	let g:ackprg = 'rg --vimgrep'
	let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --no-ignore-vcs --follow --glob "!{node_modules/*,.git/*}"'
endif

nnoremap <leader>fz :Files<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>kb :NERDTreeToggle<CR>
nnoremap <leader>sd :let @/=""<CR>
nnoremap <leader>sr :%s/
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>cc :cclose<CR>
tnoremap <C-e> <C-\><C-n>

" move between windows
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wo <C-w>o

" LSP
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Load lua configuration
luafile ~/.config/nvim/lua/lsp/compe.lua
luafile ~/.config/nvim/lua/lsp/tsserver.lua
luafile ~/.config/nvim/lua/lsp/diagnostic.lua

" Filetype specific
augroup myterm | au!
	au TermOpen * if &buftype ==# 'terminal' | setlocal nonumber signcolumn=no | endif
augroup end

au FileType javascript,typescript,json,yaml,html set expandtab ts=2 sw=2
au FileType c set expandtab ts=4 sw=4
