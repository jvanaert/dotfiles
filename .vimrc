let g:python_host_prog  = '~/.pyenv/shims/python2.7'
let g:python3_host_prog = '~/.pyenv/shims/python3.4'

" Load plugins
source ~/.vimrc.plugins

set shell=/bin/zsh

autocmd VimEnter * wincmd l

" have long lines wrap by default
set nocompatible
set wrap
set linebreak

set hlsearch         " highlight search
set ignorecase       " be case insensitive when searching
set smartcase        " be case sensitive when input has a capital letter

set textwidth=0 " wasxtwidth to 70 to cause wrapping
set wrapmargin=0
set history=256       " Number of things to remember in history.
set timeoutlen=250    " Time to wait after ESC (default causes an annoying delay)
set nolist
set shiftround        " round indent to multiple of 'shiftwidth'

set autowrite        " Writes on make/shell commands

set modeline
set modelines=5

set laststatus=2
set shortmess=atI
set showcmd

set foldenable       " Turn on folding
set foldmethod=marker " Fold on the marker
set foldlevel=100    " Don't autofold anything (but I can still fold manually)
set number

" Persistent Undo
" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Remember last location in file
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * silent! lcd %:p:h

" Save with sudo
cmap w!! %!sudo tee > /dev/null %

" make `-` and `_` work like `o` and `O` without leaving you stuck in insert
nnoremap - o<esc>
nnoremap _ O<esc>

" Turn off the christmas lights
nnoremap <Leader><cr> :nohlsearch<cr>

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Fast saving
map <leader>w :w<crt

" Remove whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

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
" YouCompleteMe
""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_semantic_triggers = {'haskell' : ['.']}

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

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

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1

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
" Mustache/handlebars
""""""""""""""""""""""""""

let g:mustache_abbreviations = 1


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

" Whitespace defaults
set smartindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Show “invisible” characters
set list
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

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
let g:Tex_Env_figure = "\\begin{figure}\<CR>\\centering\<CR>\\includegraphics[width=\\linewidth]{<+file+>}\<CR>\\caption{<+caption text+>}\\label{fig:<+label+>}\<CR>\\end{figure}<++>"

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
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Procfile,Thorfile,config.ru}  set ft=ruby

" 4 indents in python files only (PEP8)
autocmd FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

set ffs=unix,dos,mac "Default file types

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
