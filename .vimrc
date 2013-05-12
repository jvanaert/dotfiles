" Vundle
set rtp+=~/submodules/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-ruby/vim-ruby'
"Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'

" Themes
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'


" Make Nerd Tree smaller
let NERDTreeWinSize=16

autocmd VimEnter * wincmd l

" have long lines wrap by defaults
set wrap
set linebreak
set nospell
set hlsearch
set textwidth=0 " was 70 set textwidth to 70 to cause wrapping
set wrapmargin=0
set history=50
set nolist
set nocompatible

" Always display status line
set laststatus=2


"http://vimcasts.org/episodes/formatting-text-with-par/
set formatprg=par

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * silent! lcd %:p:h

"commands :bnext, :bprevious and :buffer won't abandon the buffer until any changes have been written
set hidden

" fix regexes default regex handling by auto-inserting \v before every REGEX.
" Now regexs are Ruby compatible
nnoremap / /\v
vnoremap / /\v

" <leader> key
let mapleader = ","

" Map ESC to jj and save my pinky   
" imap jj <ESC>

" Switch between buffers noremap <tab> <C-w><C-w>
" :bd deletes the current buffer (all windows of)
nmap <leader>d :bd<CR>

" Leader-<movement> for moving around in windows
nmap <leader>h <C-w><C-h>
nmap <leader>j <C-w><C-j>
nmap <leader>k <C-w><C-k>
nmap <leader>l <C-w><C-l>

" get rid of annoying backup behaviour
set nobackup
set nowritebackup
set noswapfile

" ,a to Ack
nnoremap <leader>a :Ack 

" Rotating among results in an ack search
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Remove toolbar in MacVim
"if has("gui_running")
"  set background=dark
"  set guioptions=egmrt
"endif

" ease of use keyboard mappings (why do I care about top/bottom of screen?)
map H ^
map L $
" remap space bar to search
:nmap <Space> /

" Disable the regular keys to get me on the right track
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Better default behaviour with left and right
nnoremap j gj
nnoremap k gk


" easier quitting
" save and close all
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :q!<CR>

" Edit statusline a bit
set statusline=%f\ %m\ %r
set statusline+=Line:%l/%L\ [%p%%]
set statusline+=\ Col:\ %v
set statusline+=\ Buf:\ #%n
set statusline+=\ [%b][0x%B]

" Spell checking
set spell
set spelllang=en_gb

" Splits  ,v to open a new vertical split and switch to it
nnoremap <leader>v <C-w>v<C-w>l
" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Indent with 2 spaced
set expandtab
set shiftwidth=2
set softtabstop=2

" Plugin options

" autoclose plugin
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}', '|':'|' } 
let g:AutoCloseProtectedRegions = ["Character"] 

" don't need /g after :s or :g
set gdefault

" OPTIONAL: This enables automatic indentation as you type.
filetype indent plugin on
au BufRead,BufNewFile *.junta set filetype=junta
set shellslash
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

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Solarized-vim
syntax enable
set background=light
colorscheme solarized

if has('gui_running')
  set background=dark
  colorscheme solarized 
  set guioptions=egmrt
endif
