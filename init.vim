filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugs' }
    " Plugin 'zchee/deoplete-jedi'
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
    " Plugin 'tmhedberg/SimpylFold'
    Plugin 'antoniobarbalau/vim_tonio_latex'
    Plugin 'kien/ctrlp.vim'
    " Plugin 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    " Plugin 'dart-lang/dart-vim-plugin'
    " Plugin 'neoclide/coc.nvim', {'branch': 'release'}
    " Plugin 'thosakwe/vim-flutter'
    Plugin 'enomsg/vim-haskellConcealPlus'
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

" map j gj
" map k gk
map mm :normal! mM<cr>
map `m :normal! `Mzt<cr>
map mn :normal! mN<cr>
map `n :normal! `Nzt<cr>
map gg :normal! mNgg<cr>
map G :normal! mNG<cr>
map gr :Semshi rename<CR>




colorscheme dracula
hi semshiLocal           ctermfg=255 guifg=#ffffff
hi semshiGlobal          ctermfg=255 guifg=#ffffff
hi semshiImported        ctermfg=255 guifg=#ffffff
hi semshiParameter       ctermfg=255 guifg=#ffffff
hi semshiParameterUnused ctermfg=255 guifg=#ffffff
hi semshiFree            ctermfg=255 guifg=#ffffff
hi semshiBuiltin         ctermfg=255 guifg=#ffffff
hi semshiAttribute       ctermfg=255 guifg=#ffffff
hi semshiSelf            ctermfg=255 guifg=#ffffff
hi semshiUnresolved      ctermfg=255 guifg=#ffffff
hi semshiSelected        ctermfg=255 guifg=#ffffff ctermbg=0 guibg=#000000
hi semshiErrorSign       ctermfg=255 guifg=#ffffff ctermbg=0 guibg=#000000
hi semshiErrorChar       ctermfg=255 guifg=#ffffff ctermbg=0 guibg=#000000
sign define semshiError text=E> texthl=semshiErrorSign

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

fun! ToggleFunctionJumpMode()
    if !exists('b:function_jump_mode')
        let b:function_jump_mode = 1
        map j :Semshi goto function next<cr>
        map k :Semshi goto function prev<cr>
    else
        unlet b:function_jump_mode
        map j gj
        map k gk
    endif

    return ""
endfun
fun! ToggleClassJumpMode()
    if !exists('b:class_jump_mode')
        let b:class_jump_mode = 1
        map j :Semshi goto class next<cr>
        map k :Semshi goto class prev<cr>
    else
        unlet b:class_jump_mode
        map j gj
        map k gk
    endif

    return ""
endfun
fun! ToggleNameJumpMode()
    if !exists('b:name_jump_mode')
        let b:name_jump_mode = 1
        map j :Semshi goto name next<cr>
        map k :Semshi goto name prev<cr>
    else
        unlet b:name_jump_mode
        map j gj
        map k gk
    endif

    return ""
endfun
map j gj
map k gk
map <leader>f :call ToggleFunctionJumpMode()<cr>
map <leader>c :call ToggleClassJumpMode()<cr>
map <leader>n :call ToggleNameJumpMode()<cr>


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

nnoremap <leader>so :source %<cr>

set nofoldenable
set nospell
hi Normal guibg=NONE ctermbg=NONE
