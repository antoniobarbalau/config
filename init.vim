filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugs' }
    Plugin 'zchee/deoplete-jedi'
    Plugin 'trevordmiller/nova-vim'
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
    Plugin 'christoomey/vim-sort-motion'
    Plugin 'tmhedberg/SimpylFold'
call vundle#end()
filetype plugin indent on

tnoremap <ESC> <C-\><C-n>
set nocompatible
set guicursor=
set mouse=a
set clipboard=unnamedplus
nmap ; :
set noswapfile
au VimEnter * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
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
map mm :normal! mM<cr>
map `m :normal! `Mzt<cr>
map mn :normal! mN<cr>
map `n :normal! `Nzt<cr>
map gg :normal! mNgg<cr>
map G :normal! mNG<cr>

colorscheme dracula

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


vnoremap < <gv
vnoremap > >gv
" set foldmethod=indent
" set tw=91
" set nowrap " nush ce face
" set fo-=t " nush ce face
" gq iti pune pe mai multe rad


let mapleader =" "

nnoremap <leader>sfl :call FixLastSpellingError()<cr>
nnoremap <leader>scl :call ChooseLastSpellingError()<cr>
nnoremap <leader>s :call ToggleSpelling()<cr>


function! ToggleSpelling()
    set spell! spelllang=en_us
endfunction
function! FixLastSpellingError()
    normal mm[s1z=`m
endfunction
function! ChooseLastSpellingError()
    normal mm[sz=
endfunction

function! CreateLatex()
    w
    !pdflatex %
endfunction
nnoremap <leader>cl :call CreateLatex()<cr><cr>
nnoremap <leader>cvl :call CreateLatex()<cr>
function! OpenLatex()
    !xdg-open %:r.pdf &
endfunction
nnoremap <leader>ol :call OpenLatex()<cr><cr>
function! ChangeNextBookMark()
    normal /<--\*\*--><cr>:noh<cr>ca<
endfunction


nnoremap <leader>li i\begin{itemize}<cr>\end{itemize}<cr><esc>
nnoremap <leader>ldi o\item[$-$] 


nnoremap <leader><leader> /<--\*\*--><cr>:noh<cr>ca<
nnoremap <leader>lt :read ~/.config/nvim/latex_template.tex<cr>ggdd/<--\*\*--><cr>:noh<cr>ca<


nnoremap <leader>so :source %<cr>

set nofoldenable
set nospell


