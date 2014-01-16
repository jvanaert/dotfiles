" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-ruby/vim-ruby'
" Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-markdown'
" Bundle 'cespare/vim-bclose'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'bling/vim-airline'
Bundle 'nvie/vim-flake8'
" Bundle 'AutoComplPop'

" Themes
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'


" Make Nerd Tree smaller
let NERDTreeWinSize=16

autocmd VimEnter * wincmd l

" have long lines wrap by default
set nocompatible
set wrap
set linebreak
set nospell

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

" Leader-<movement> for moving around in windows
nmap <leader>h <C-w><C-h>
nmap <leader>j <C-w><C-j>
nmap <leader>k <C-w><C-k>
nmap <leader>l <C-w><C-l>

" Moving between tabs
nmap <leader>n :tabnext
nmap <leader>N :tabprev

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

" Better default behavior with left and right
nnoremap j gj
nnoremap k gk

" easier quitting
" save and close all
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :q!<CR>

" Spell checking
set spell
set spelllang=en_us,da

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

if has("mac")
  let g:Tex_ViewRule_pdf = "open"
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-airline smarter tabline
" let g:airline#extensions#tabline#enabled = 1

" Bash-like autocomplete
set wildmode=longest,list,full
set wildmenu

" Syntax highlighting of different languages
au BufRead,BufNewFile *.mod set filetype=ampl 
au BufRead,BufNewFile *.tikz set filetype=tex

" Solarized-vim
syntax enable
set background=light
colorscheme solarized

if has('gui_running')
  set background=light
  colorscheme solarized 
  set transparency=1
  set guioptions=egmrt
  set guifont=Source\ Code\ Pro
endif
