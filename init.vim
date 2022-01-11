call plug#begin('~/.config/nvim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'windwp/nvim-autopairs'
Plug 'hrsh7th/nvim-compe'
Plug 'mfussenegger/nvim-dap'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'akinsho/nvim-toggleterm.lua'
Plug 'hashivim/vim-terraform'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()

filetype plugin on
syntax enable
runtime! macros/matchit.vim
let mapleader=" "
set shm+=I
set termguicolors
set number
set listchars+=tab:>-
set listchars+=space:·
set list
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
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
set foldlevelstart=99
set omnifunc=syntaxcomplete#Complete
silent! helptags ALL

" Grep with RipGrep
set grepprg=rg\ --vimgrep\ -S
set grepformat=%f:%l:%c:%m

augroup quickfix
	" Automatically open the quickfix after grepping
	autocmd!
	autocmd QuickFixCmdPost [^l]* cwindow
	autocmd QuickFixCmdPost l*    lwindow
augroup END

" --- OS
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

" --- FILETYPES
augroup myterm | au!
	au TermOpen * if &buftype ==# 'terminal' | setlocal nonumber signcolumn=no | endif
augroup end

au FileType javascript,typescript,javascriptreact,typescriptreact setlocal expandtab ts=2 sw=2
au FileType html,css setlocal expandtab ts=2 sw=2
au FileType json,yaml setlocal expandtab ts=2 sw=2
au FileType markdown setlocal spell
au FileType c setlocal expandtab ts=4 sw=4

" --- PLUGINS
luafile ~/.config/nvim/lua/plugins/tree-sitter.lua
luafile ~/.config/nvim/lua/plugins/tree-sitter-textobjects.lua
luafile ~/.config/nvim/lua/plugins/autopairs.lua
luafile ~/.config/nvim/lua/lsp/global.lua
luafile ~/.config/nvim/lua/lsp/lua-language-server.lua
luafile ~/.config/nvim/lua/lsp/compe.lua
luafile ~/.config/nvim/lua/lsp/tsserver.lua
luafile ~/.config/nvim/lua/lsp/efm.lua
luafile ~/.config/nvim/lua/lsp/gopls.lua
luafile ~/.config/nvim/lua/lsp/yaml.lua
luafile ~/.config/nvim/lua/lsp/terraform.lua
luafile ~/.config/nvim/lua/plugins/lualine.lua
luafile ~/.config/nvim/lua/plugins/toggleterm.lua
luafile ~/.config/nvim/lua/plugins/telescope.lua

let NERDTreeShowHidden=1
let g:signify_priority = 5
colorscheme dracula

" Highlight extra whitespaces in loud red
highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" --- MAPPINGS

"  folding:
"  zx enable fold: https://github.com/nvim-telescope/telescope.nvim/issues/699
"  zc close fold
"  zo open fold

nnoremap <leader>kb :NERDTreeToggle<CR>
nnoremap <leader>sd :let @/=""<CR>
nnoremap <leader>sr :%s/
nnoremap <leader>cl :close<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap <leader>R :source $MYVIMRC<CR>
nnoremap <leader>tp :TSPlaygroundToggle<CR>
tnoremap <C-e> <C-\><C-n>

nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wo <C-w>o

nnoremap <leader>Gc :Git checkout
nnoremap <leader>Gn :Git checkout -b
nnoremap <leader>Gf :Git fetch<CR>
nnoremap <leader>gl :Git pull<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gp :Git push<CR>

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.diagnostic.goto_prev({ float =  { border = "single" }})<CR>
nnoremap <silent> <C-p> <cmd>lua vim.diagnostic.goto_next({ float =  { border = "single" }})<CR>

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fz <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>db :lua require('dap').toggle_breakpoint()<CR>
nnoremap <leader>dc :lua require('dap').continue()<CR>
nnoremap <leader>do :lua require('dap').step_over()<CR>
nnoremap <leader>di :lua require('dap').step_into()<CR>
nnoremap <leader>dr :lua require('dap').repl.open({}, 'vsplit')<CR>

nnoremap <F9> :Goyo<CR>
