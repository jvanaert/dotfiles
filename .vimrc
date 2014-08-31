"if has("win32")
"  let VIMFILES="$HOME/vimfiles" 
"else
"  let VIMFILES="~/.vim"
"endif

"let &runtimepath .= "," . VIMFILES . "/bundle/vundle"
"call vundle#rc(VIMFILES . '/bundle/')
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'vim-ruby/vim-ruby'
" Bundle 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Bundle 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic' " sntax checker
Plugin 'tpope/vim-fugitive' " git wrapper
" Bundle 'cespare/vim-bclose'
Plugin 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Plugin 'bling/vim-airline'
Plugin 'nvie/vim-flake8' " python syntax checker
"Bundle 'tpope/vim-repeat'
" Bundle 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
" Bundle 'AutoComplPop'

" Themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


let NERDTreeWinSize=40

" To fix vim running ruby
" See https://stackoverflow.com/questions/20238739/ruby-segmentation-fault-under-vim
set shell=/bin/sh

autocmd VimEnter * wincmd l

" have long lines wrap by default
set nocompatible
set wrap
set linebreak

set hlsearch                   " highlight search
set ignorecase                 " be case insensitive when searching
set smartcase                  " be case sensitive when input has a capital letter
set incsearch                  " show matches while typing

set textwidth=0 " was 70 set textwidth to 70 to cause wrapping
set wrapmargin=0
set history=256                 " Number of things to remember in history.
set timeoutlen=250              " Time to wait after ESC (default causes an annoying delay)
set nolist
set shiftround                  " round indent to multiple of 'shiftwidth'

set autowrite                  " Writes on make/shell commands
set autoread

set modeline
set modelines=5

set laststatus=2
set shortmess=atI
set showcmd

set foldenable                " Turn on folding
set foldmethod=marker         " Fold on the marker
set foldlevel=100             " Don't autofold anything (but I can still fold manually)

"http://vimcasts.org/episodes/formatting-text-with-par/
set formatprg=par

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * silent! lcd %:p:h

set hidden
set relativenumber
set number

" fix regexes default regex handling by auto-inserting \v before every REGEX.
" Now regexs are Ruby compatible
nnoremap / /\v
vnoremap / /\v

" Shift-enter makes end
imap <S-CR> <CR><CR>end<Esc>-cc

let g:is_posix = 1             " vim's default is archaic bourne shell,
" bring it up to the 90s
let mapleader = ","

set fo+=o                      " Automatically insert the current comment
" leader after hitting 'o' or 'O' in Normal mode.
set fo-=r                      " Do not automatically insert a comment
" leader after an enter
set fo-=t                      " Do no auto-wrap text using textwidth (does
" not apply to comments)

" Switch between buffers noremap <tab> <C-w><C-w>
" :bd deletes the current buffer (all windows of)
nmap <leader>d :bd<CR>

""""""""""""""""""""""""""
" Autocompletion
""""""""""""""""""""""""""
imap <Tab> <C-P>
set complete=.,b,u,]
set omnifunc=syntaxcomplete#Complete

""""""""""""""""""""""""""
" Windows
""""""""""""""""""""""""""

" Leader-<movement> for moving around in windows
nmap <leader>h <C-w><C-h>
nmap <leader>j <C-w><C-j>
nmap <leader>k <C-w><C-k>
nmap <leader>l <C-w><C-l>

" More natural split opening
set splitbelow
set splitright

""""""""""""""""""""""""""

" Moving between tabs
nmap <leader>n :tabnext
nmap <leader>N :tabprev

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Remap alt-i to meta-i
set <m-i>=^[i

" get rid of annoying backup behaviour
set nobackup
set nowritebackup
set directory=/tmp//           " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
set noswapfile

" ,a to Ack
nnoremap <leader>a :Ack 

" Rotating among results in an ack search
map <C-n> :cn<CR>
map <C-p> :cp<CR>

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
"set spell
set spelllang=en_us,da
autocmd BufNewFile,BufRead *.tex set spell

" Indent with 2 spaced
set expandtab
set shiftwidth=2
set tabstop=2
set shiftwidth=2
set softtabstop=2

set mouse=a                   " Enable mouse in GUI mode
set mousehide                 " Hide mouse after chars typed

set novisualbell              " No blinking
set noerrorbells              " No noise.
set vb t_vb=                  " disable any beeps or flashes on error

" autoclose plugin
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}', '|':'|' } 
let g:AutoCloseProtectedRegions = ["Character"] 

" mustache/handlebars plugin
let g:mustache_abbreviations = 1

" don't need /g after :s or :g
set gdefault

" OPTIONAL: This enables automatic indentation as you type.
filetype indent plugin on

" For vim-latex grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

let g:Tex_IgnoredWarnings =
      \"Unused global option(s):\n".
      \"Underfull\n".
      \"Overfull\n".
      \"float specifier changed to\n"
let g:Tex_IgnoreLevel = 7
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_CompileRule_pdf = "pdflatex -interaction=nonstopmode $*"
let g:Tex_MultipleCompileFormats = "pdf, aux"
let g:Tex_Env_frame = "\\begin{frame}{<++>}\<CR><++>\<CR>\\end{frame}"

" Rebind vim-latex C-j to jump to <++>
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-airline smarter tabline
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'solarized'

" Bash-like autocomplete
set wildmode=longest,list,full
set wildmenu

" Turn on syntax highlighting
syntax on

" Syntax highlighting of different languages
au BufRead,BufNewFile *.mod set filetype=ampl 
au BufRead,BufNewFile *.tikz set filetype=tex

" 4 indents in python files only
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

if has('gui_running')
  set background=light
  colorscheme solarized 
  set guioptions=egmrt
  "set guifont=Source\ Code\ Pro
  set backspace=2
  set backspace=indent,eol,start
  set guifont=Consolas:h11

  "Remove menubar and toolbar
  set guioptions -=m
  set guioptions -=T
endif

" OS specific settings below
if has('win32')
  map <C-t> :tabnew<CR>
  map <M-left> :tabprev<CR>
  map <M-right> :tabnext<CR>
endif

if has('mac')
  let g:Tex_ViewRule_pdf = "open"
  if has('gui_running')
    set transparency=1
    set guifont=Inconsolata:h13
  endif
endif
