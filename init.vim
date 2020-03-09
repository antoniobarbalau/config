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



" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
