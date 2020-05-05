call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'fatih/vim-go'
call plug#end()

filetype plugin on
syntax enable
runtime! macros/matchit.vim
let mapleader=" "
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

colorscheme nord
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
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'cocstatus' ],
      \             [  'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component': {
      \   'relativepath': '%f'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \ },
      \ }

if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

nnoremap <leader>fz :Files<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>sd :let @/=""<CR>
nnoremap <leader>sr :%s/
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>cc :cclose<CR>
tnoremap <C-e> <C-\><C-n>

let g:coc_global_extensions = ['coc-tsserver', 'coc-deno', 'coc-eslint', 'coc-json', 'coc-diagnostic']
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>dd :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:go_def_mapping_enabled = 0
let g:go_metalinter_autosave = 1
let g:go_fmt_fail_silently = 1
