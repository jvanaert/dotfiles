let g:python_host_prog = '/usr/bin/python2.7'

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim', { 'on': 'CtrlP'}
" Plug 'mileszs/ack.vim'
Plug 'scrooloose/syntastic' " syntax checker
Plug 'tpope/vim-fugitive' " git wrapper
" Plug 'cespare/vim-bclose'
Plug 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Plug 'bling/vim-airline'
"Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-surround'
Plug 'rizzatti/dash.vim', { 'on': 'Dash' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer'}
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular' " to lign up text

" Tmux integration
" Plug 'jpalardy/vim-slime' " send text to tmux session
Plug 'christoomey/vim-tmux-navigator'

" Haskell dev
Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'raichoo/haskell-vim', { 'for': 'haskell' }
Plug 'Shougo/vimproc.vim', { 'for': 'haskell' }

" Ruby dev (uncommented due to RubyMine (ugh, I know))
Plug 'mustache/vim-mustache-handlebars', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'scrooloose/nerdcommenter', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' } " automatically add end for ruby

" Python dev
Plug 'nvie/vim-flake8', { 'for': 'python' } " python syntax checker

" Themes
Plug 'altercation/vim-colors-solarized'
" Plug 'nanotech/jellybeans.vim'
" Plug 'tomasr/molokai'
call plug#end()

set shell=zsh

autocmd VimEnter * wincmd l

" have long lines wrap by default
set nocompatible
set wrap
set linebreak

set hlsearch                   " highlight search
set ignorecase                 " be case insensitive when searching
set smartcase                  " be case sensitive when input has a capital letter

set textwidth=0 " was 70 set textwidth to 70 to cause wrapping
set wrapmargin=0
set history=256                 " Number of things to remember in history.
set timeoutlen=250              " Time to wait after ESC (default causes an annoying delay)
set nolist
set shiftround                  " round indent to multiple of 'shiftwidth'

set autowrite                  " Writes on make/shell commands

set modeline
set modelines=5

set laststatus=2
set shortmess=atI
set showcmd

set foldenable                " Turn on folding
set foldmethod=marker         " Fold on the marker
set foldlevel=100             " Don't autofold anything (but I can still fold manually)

"http://vimcasts.org/episodes/formatting-text-with-par/
" set formatprg=par

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * silent! lcd %:p:h

set number



" fix regexes default regex handling by
" auto-inserting \v before every REGEX.
nnoremap / /\v
vnoremap / /\v

let g:is_posix = 1
let mapleader = ","

set fo+=o  " Automatically insert the current comment
           " leader after hitting 'o' or 'O' in Normal mode.
set fo-=r  " Do not automatically insert a comment leader after an enter
set fo-=t  " Do no auto-wrap text using textwidth (does not
           " apply to comments)

nmap <leader>d :bd<CR>

""""""""""""""""""""""""""
" Autocompletion
""""""""""""""""""""""""""
" imap <Tab> <C-P>
" set complete=.,b,u,]
" set omnifunc=syntaxcomplete#Complete

" au BufRead,BufNewFile *.hs,*lhs set filetype=haskell
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_semantic_triggers = {'haskell' : ['.']}


""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""

" nmap <leader>= :TagbarToggle<CR>
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

""""""""""""""""""""""""""
" vim-slime
""""""""""""""""""""""""""

let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""
" Recommended Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Toggle between active and passive type checking
map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR> 
let g:syntastic_python_checkers=['flake8'] " use flake8

""""""""""""""""""""""""""
" ghc-mod (not a vim plugin)
""""""""""""""""""""""""""

" Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>

" show type of function under curser when f1
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR> 
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
" show further information type classes, data constructors or
" functions, including the source location of definition
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""

let NERDTreeWinSize=40

""""""""""""""""""""""""""
" Unorganized  stuff
""""""""""""""""""""""""""

" Leader-<movement> for moving around in windows
nmap <leader>h <C-w><C-h>
nmap <leader>j <C-w><C-j>
nmap <leader>k <C-w><C-k>
nmap <leader>l <C-w><C-l>

" More natural split opening
set splitbelow
set splitright

" Moving between tabs
nmap <leader>n :tabnext
nmap <leader>N :tabprev


" get rid of annoying backup behaviour
set nobackup
set nowritebackup
set directory=/tmp//           " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
set noswapfile

" ,a to Ack
" nnoremap <leader>a :Ack 
" Rotating among results in an ack search
" map <C-n> :cn<CR>
" map <C-p> :cp<CR>

" ease of use keyboard mappings (why do I care about top/bottom of screen?)
map H ^
map L $

" remap space bar to search, case insensitive
:nmap <Space> /\c

" Better default behavior with up and down
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" easier quitting
" save and close all
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :q!<CR>

imap <C-BS> <C-W>

" Spell checking
" set spell
autocmd BufNewFile,BufRead *.tex set spell
set spelllang=en_us ",da

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Indent with 2 spaced
set expandtab
set shiftwidth=2
set tabstop=2
set shiftwidth=2
set softtabstop=2

set mousehide       " Hide mouse after chars typed

set novisualbell    " No blinking
set noerrorbells    " No noise
set vb t_vb=        " disable any beeps or flashes on error

" autoclose plugin
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}', '|':'|' } 
let g:AutoCloseProtectedRegions = ["Character"] 

" don't need /g after :s or :g
set gdefault

" Indent soft wraps
set breakindent
" set showbreak=\ \
set showbreak=\  
set columns=79

" For vim-latex grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to 'plaintex' instead of 'tex', which results in vim-latex not being loaded. The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_IgnoreLevel = 7
let g:Tex_SmartKeyDot=0 " do not convert ... to \ldots
let g:Tex_CompileRule_pdf = "xelatex -synctex=1 -shell-escape -interaction=nonstopmode $*"
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_MultipleCompileFormats = "pdf, aux"
let g:Tex_Env_frame = "\\begin{frame}{<++>}\<CR><++>\<CR>\\end{frame}"
let g:Tex_Env_figure = "\\begin{figure}[htpb]\<CR>\\centering\<CR>\\includegraphics[width=\linewidth]{<+file+>}\<CR>\\caption{<+caption text+>}\\label{fig:<+label+>}\<CR>\\end{figure}<++>"

" Switches between xelatex and pdflatex compilers
function! SwitchLaTeXCompilers()
  let oldCompileRule=g:Tex_CompileRule_pdf
  let g:Tex_CompileRule_pdf = "pdflatex -synctex=1 -shell-escape -interaction=nonstopmode $*"
  call Tex_RunLaTeX()
  let g:Tex_CompileRule_pdf=oldCompileRule
endfunction
map <Leader>lx :<C-U>call SwitchLaTeXCompilers()<CR>

" Rebind vim-latex C-j to jump to <++>
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>. :CtrlPTag<cr>


" Bash-like autocomplete
set wildmode=longest,list,full
set wildmenu

" Turn on syntax highlighting
syntax on

" Syntax highlighting of different languages
au BufRead,BufNewFile *.tikz set filetype=tex

" 4 indents in python files only
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

" Colorscheme stuff 
colorscheme solarized
set background=dark
let g:airline_theme = 'solarized'

" Vim pane resizing via mouse in tmux
" src: http://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux
set mouse+=a
if &term =~ '^screen'
    set ttymouse=xterm2 " tmux knows the extended mouse mode
endif

if has('gui_running')
  set guioptions=egmrt

  "Remove menubar and toolbar
  set guioptions -=m
  set guioptions -=T
endif

" OS specific settings below
if has('win32')
  map <C-t> :tabnew<CR>
  map <M-left> :tabprev<CR>
  map <M-right> :tabnext<CR>

  if has('gui_running')
    set guifont=Consolas:h11
    set backspace=2
  endif
endif

if has('mac')
  let g:Tex_ViewRule_pdf = "open -a Skim"
  if has('gui_running')
    set transparency=1
    set guifont=Inconsolata:h13
  endif

  " Make yanking work
  " http://vim.wikia.com/wiki/Mac%5FOS%5FX%5Fclipboard%5Fsharing
  set clipboard=unnamed
endif
