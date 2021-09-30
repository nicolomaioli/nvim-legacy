call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'joshdick/onedark.vim'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'akinsho/nvim-toggleterm.lua'
Plug 'hashivim/vim-terraform'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
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
	let g:python_host_prog="/usr/local/bin/python2"
	let g:python3_host_prog="/usr/local/bin/python3"
elseif g:os == "Linux"
	let g:python_host_prog="/usr/bin/python2"
	let g:python3_host_prog="/usr/bin/python3"
endif

" Plugin configuration
let NERDTreeShowHidden=1

" Mappings
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>kb :NERDTreeToggle<CR>
nnoremap <leader>sd :let @/=""<CR>
nnoremap <leader>sr :%s/
nnoremap <leader>cl :close<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap <leader>R :source $MYVIMRC<CR>
tnoremap <C-e> <C-\><C-n>

" move between windows
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wo <C-w>o

" LSP

" Prioritise LSP signs over signify's diff
let g:signify_priority = 5

" Mappings
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Configs
luafile ~/.config/nvim/lua/lsp/global.lua
luafile ~/.config/nvim/lua/lsp/compe.lua
luafile ~/.config/nvim/lua/lsp/tsserver.lua
luafile ~/.config/nvim/lua/lsp/efm.lua
luafile ~/.config/nvim/lua/lsp/gopls.lua
luafile ~/.config/nvim/lua/lsp/yaml.lua
luafile ~/.config/nvim/lua/lsp/terraform.lua

" Load lua plugins
luafile ~/.config/nvim/lua/plugins/lualine.lua
luafile ~/.config/nvim/lua/plugins/nvim-toggleterm.lua

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Filetype specific
augroup myterm | au!
	au TermOpen * if &buftype ==# 'terminal' | setlocal nonumber signcolumn=no | endif
augroup end

au FileType javascript,typescript,javascriptreact,typescriptreact setlocal expandtab ts=2 sw=2
au FileType html,css setlocal expandtab ts=2 sw=2
au FileType json,yaml setlocal expandtab ts=2 sw=2
au FileType markdown setlocal spell
au FileType c setlocal expandtab ts=4 sw=4
