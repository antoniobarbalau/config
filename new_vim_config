filetype off
call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-vinegar'
    Plug 'christoomey/vim-sort-motion'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()
filetype plugin indent on

tnoremap <ESC> <C-\><C-n>
set nocompatible
set guicursor=
set mouse=a
set clipboard=unnamedplus
nmap ; :
set noswapfile
au TermOpen * setlocal nonumber | setlocal norelativenumber | start

set ttyfast
set enc=utf-8
set t_Co=256

syntax enable
set number relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set scrolloff=10

set ignorecase
set smartcase
set incsearch
nnoremap <CR> :noh<CR>
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
set splitbelow
set splitright

set path+=**
set wildmenu
set autochdir

map j gj
map k gk
vnoremap < <gv
vnoremap > >gv
map mm :normal! mM<cr>
map `m :normal! `Mzt<cr>
map mn :normal! mN<cr>
map `n :normal! `Nzt<cr>
map gg :normal! mNgg<cr>
map G :normal! mNG<cr>


let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']
nmap ' :NERDTreeToggle<cr>
set nofoldenable
set nospell
hi Normal guibg=NONE ctermbg=NONE



let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-prettier', 'coc-pyright']
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
autocmd BufEnter *.{py} :syntax sync fromstart
autocmd BufLeave *.{py} :syntax sync clear
