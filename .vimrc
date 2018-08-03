set nocompatible
set mouse=a
set clipboard=unnamedplus
nmap ; :
set noswapfile
au VimEnter * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

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
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
set splitbelow
set splitright

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
    Plugin 'tpope/vim-vinegar'
    Plugin 'godlygeek/tabular'
    Plugin 'Vimjas/vim-python-pep8-indent'
call vundle#end()
filetype plugin indent on

" colorscheme calmar256-dark
colorscheme grb256

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']
nmap ' :NERDTreeToggle<cr>

nmap \ :TagbarToggle<cr>

function! FollowTag()
    if !exists("w:tagbrowse")
        vsplit
        let w:tagbrowse=1
    endif
    execute "tag ".expand("<cword>")
endfunction
nmap <c-w><c-]> :call FollowTag()<cr>
nmap <c-x> :!ctags -R *<cr><cr>

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


au BufRead,BufNewFile *.k set filetype=kframework
au! Syntax kframework source kframework.vim
syn on
