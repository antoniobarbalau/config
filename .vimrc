set nocompatible

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

set noswapfile

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'majutsushi/tagbar'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

colorscheme calmar256-dark

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
nmap " :NERDTreeToggle<CR>

autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose

