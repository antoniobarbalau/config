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
set path+=**
set wildmenu

set noswapfile

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'majutsushi/tagbar'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'xuhdev/vim-latex-live-preview'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-commentary'
call vundle#end()
filetype plugin indent on

colorscheme calmar256-dark

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
nmap " :NERDTreeToggle<cr>

autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose

function! FollowTag()
    if !exists("w:tagbrowse")
        vsplit
        let w:tagbrowse=1
    endif
    execute "tag " . expand("<cword>")
endfunction
nnoremap <c-w><c-]> :call FollowTag()<cr>
nnoremap <c-x> :!ctags -R *<cr><cr>
set mouse=a

