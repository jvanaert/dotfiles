let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3.5'
let g:ycm_python_binary_path = '/usr/local/bin/python3.5'


" Load plugins
source ~/.config/nvim/nvimrc.plugins

set shell=/bin/zsh

autocmd VimEnter * wincmd l

" have long lines wrap by default
set nocompatible
set wrap
set linebreak

set hlsearch         " highlight search
set ignorecase       " be case insensitive when searching
set smartcase        " be case sensitive when input has a capital letter

set textwidth=100 " wasxtwidth to 70 to cause wrapping
set wrapmargin=0
set history=256       " Number of things to remember in history.
set timeoutlen=250    " Time to wait after ESC (default causes an annoying delay)
set nolist
set shiftround        " round indent to multiple of 'shiftwidth'
set breakindent
set autoindent
" set cursorline " highlight current line
" set showbreak=\
set showbreak=>\ \ \
set cpo=n
set cc=100 " highlight column 100
set hidden " allow switching buffer without saving"

" Whitespace defaults
filetype plugin indent on
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


" set autowrite        " Writes on make/shell commands

set modeline
set modelines=5

set laststatus=2
set shortmess=atI
set showcmd

set foldenable       " Turn on folding
set foldmethod=syntax
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldlevel=100    " Don't autofold anything (but I can still fold manually)


set number " show file numbers

" Persistent Undo
" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
  silent !mkdir -p ~/.config/nvim/undodir > /dev/null 2>&1
  set undodir=~/.config/nvim/undodir
  set undofile
endif

" Remember last location in file
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.config/nvim/init.vim
autocmd! bufwritepost .vimrc.plugins source ~/.config/nvim/nvimrc.plugins

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
" autocmd BufEnter * silent! lcd %:p:h

" Save with sudo
cmap w!! %!sudo tee > /dev/null %

" make `-` and `_` work like `o` and `O` without leaving you stuck in insert
nnoremap - o<esc>
nnoremap _ O<esc>

" Turn off the christmas lights
nnoremap <Leader><cr> :nohlsearch<cr>

" Remove whitespace
nnoremap <Leader>tw :%s/\s\+$//e<CR>

" fix regexes default regex handling by
" auto-inserting \v before every REGEX.
nnoremap / /\\v
vnoremap / /\\v

let g:is_posix = 1
let mapleader = ","

set fo+=o  " Automatically insert the current comment
           " leader after hitting 'o' or 'O' in Normal mode.
set fo-=r  " Do not automatically insert a comment leader after an enter
set fo-=t  " Do no auto-wrap text using textwidth (does not
           " apply to comments)

" nmap <leader>d :bd<CR>

""""""""""""""""""""""""""
" YouCompleteMe / https://github.com/Shougo/deoplete.nvim
""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

" Ignore ruby deoplete sources, as it locks UI
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ruby = ['omni']

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript.jsx setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript.jsx set omnifunc=javascriptcomplete#CompleteJS
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
" vim-slime and tmux related settings
""""""""""""""""""""""""""

" let g:slime_target = "tmux"
"
let g:tmux_navigator_save_on_switch = 1
let g:tmux_navigator_no_mappings = 1

" nnoremap <leader>j :TmuxNavigateDown<cr>
" nnoremap <leader>k :TmuxNavigateUp<cr>
" nnoremap <leader>h :TmuxNavigateRight<cr>
" nnoremap <leader>l :TmuxNavigatePrevious<cr>

""""""""""""""""""""""""""
" Ruby and Rails
""""""""""""""""""""""""""

" Neoterm
map <leader>f :w<CR>:call neoterm#test#run('file')<CR>
map <leader>r :w<CR>:call neoterm#test#run('current')<CR>
map <leader>l :w<CR>:call neoterm#test#rerun()<CR>
" map <leader>a :call neoterm#test#run('all')<CR>

" Useful maps
" hide/close terminal
nnoremap <silent> <leader>th :call neoterm#close()<cr>
nnoremap <silent> <leader>tc :call neoterm#kill()<cr>
" clear terminal
nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <leader>tk :call neoterm#kill()<cr>

" Rails commands
" command! Troutes :T rake routes
" command! -nargs=+ Troute :T rake routes | grep <args>
" command! Tmigrate :T rake db:migrate<Paste>

let g:neoterm_rspec_lib_cmd = "bin/rspec"
let g:neoterm_position = 'horizontal'
"
""""""""""""""""""""""""""
" Neomake
""""""""""""""""""""""""""

" let g:neomake_verbose=3
let g:neomake_verbose=0

" Auto open list
" let g:neomake_open_list = 2
let g:neomake_open_list = 0

" Auto make on tasks
autocmd! BufWritePost * Neomake

let g:neomake_ruby_enabled_makers = ['rubocop', 'reek'] " 'mri'
let g:neomake_sh_enabled_checkers = ['shellcheck']
let g:neomake_python_enabled_checkers = ['python', 'flake8']
let g:neomake_yaml_enabled_makers = ['yamllint']
let g:neomake_haml_enabled_makers = ['hamllint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_jsx_enabled_makers = ['eslint']
let g:neomake_tex_enabled_makers = ['chktex'] " 'lacheck'

""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""
" Recommended Syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" Enable syntastic syntax checking
" let g:syntastic_enable_signs=1
" let g:syntastic_error_symbol = '✘'
" let g:syntastic_warning_symbol = '⚠'
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_loc_list_height=3

" Ignore LaTeX warnings
" let g:syntastic_quiet_messages = {"regex": "\\(Do not use @ in LaTeX macro names\\|Could not open.*@base\\)"}

" let g:syntastic_quiet_messages = {
"   \ "level": "errors",
"   \ "regex": "Could not open " }
"
" let g:syntastic_quiet_messages = {
"   \ "level": "warnings",
"   \ "regex": "Could not execute " }

" Toggle between active and passive type checking
" map <silent> <Leader>e :Errors<CR>
" map <Leader>t :SyntasticToggleMode<CR>
" let g:syntastic_python_checkers=['flake8'] " use flake8
" let g:syntastic_ruby_checkers=['mri', 'rubocop']
" let g:syntastic_ruby_exec= '~/.rbenv/shims/ruby.'
" let g:syntastic_ruby_rubocop_exec=['~/.rbenv/shims/rubocop']
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_jsx_checkers = []
" let g:syntastic_html_tidy_exec = 'tidy'

let g:jsx_ext_required = 0

" Fugitive
map <Leader>c :Gcommit<CR>
map <Leader>s :Gstatus<CR>
map <Leader>p :Gpull<CR>
map <Leader>o :Gpush<CR>

nnoremap <leader>b c-]<CR>

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

let NERDTreeWinSize=35
map <C-t> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

""""""""""""""""""""""""""
" Mustache/handlebars
""""""""""""""""""""""""""

let g:mustache_abbreviations = 1

""""""""""""""""""""""""""
" Gundo
""""""""""""""""""""""""""

nnoremap <leader>u :GundoToggle<CR>

""""""""""""""""""""""""""
" ag
""""""""""""""""""""""""""
" let g:ackprg = 'ag --nogroup --nocolor --column'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


""""""""""""""""""""""""""
" startify
""""""""""""""""""""""""""
let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'}, '~/.config/nvim/nvimrc.plugins', '~/.zshrc' ]
if has('nvim')
    au! TabNewEntered * Startify
endif


""""""""""""""""""""""""""
" fzf.vim / old ctrlp
""""""""""""""""""""""""""

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

nnoremap t <C-]>
nnoremap T <C-t>
" map <Leader>. :Tags<CR>
map <Leader>m :Ag<CR>
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Colorscheme stuff
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" colorscheme base16-tomorrow-night
colorscheme base16-eighties
" set background=dark

""""""""""""""""""""""""""
" vim-airline
""""""""""""""""""""""""""

let g:tmuxline_preset = 'minimal'
let g:airline_theme = 'base16_eighties'
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let showtabline = 0

" let g:limelight_conceal_ctermfg = (&bg == 'dark') ? 'red' : 'gray'

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set linespace=7
  set scrolloff=999
  set listchars=
  " Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  set linespace=0
  set list
  set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
  " Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

""""""""""""""""""""""""""
" vim-unimpared
""""""""""""""""""""""""""

nmap > [
nmap < ]
omap > [
omap < ]
xmap > [
xmap < ]


""""""""""""""""""""""""""
" https://github.com/SirVer/ultisnips
""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""""""""""""""""""""""""""
" Unorganized  stuff
""""""""""""""""""""""""""

" Hide ~ chars at end of file
" https://github.com/neovim/neovim/issues/2067
hi EndOfBuffer ctermfg=bg

" Leader-<movement> for moving around in windows
" nmap <C-h> <C-w><C-h>
" nmap <C-j> <C-w><C-j>
" nmap <C-k> <C-w><C-k>
" nmap <C-l> <C-w><C-l>
" nmap <leader>h <C-w><C-h>
" nmap <leader>j <C-w><C-j>
" nmap <leader>k <C-w><C-k>
" nmap <leader>l <C-w><C-l>
"
" More natural split opening
set splitbelow
set splitright

" Moving between tabs
nmap <leader>n :tabnext<CR>
nmap <leader>N :tabprev<CR>

" Moving between buffers
" nmap <leader>n :bnext<CR>
" nmap <leader>N :bprevious<CR>

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
nmap <Space> /

" UNINDENT with Shift-Tab
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" easier saving and quitting
nmap <leader>q :q<CR>
nmap <leader>w :w!<CR>
nmap <leader>wq :wq!<CR>
nmap <leader><Esc> :q!<CR>

imap <C-BS> <C-W>

" Close buffer without closing window
" https://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window
map <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>

" Spell checking
" set spell
autocmd BufNewFile,BufRead *.tex set spell
set spelllang=en_us ",da

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


" https://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
" augroup ft_rb
"     au!
"     au FileType ruby setlocal re=1 foldmethod=manual
" augroup END

" autoclose plugin
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}', '|':'|' }
let g:AutoCloseProtectedRegions = ["Character"]

" don't need /g after :s or :g
set gdefault


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

nnoremap <silent> <C-Left> :tabp<CR>
nnoremap <silent> <C-Right> :tabn<CR>
" nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
" nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Bash-like autocomplete
set wildmode=longest,list,full
set wildmenu

" Set filetype for unknown types
au BufRead,BufNewFile *.tikz set filetype=tex
au BufRead,BufNewFile .bowerrc set filetype=json
au BufRead,BufNewFile .eslintrc set filetype=json
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Procfile,Thorfile,config.ru,Capfile} set ft=ruby

augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  " autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
  "       \:call <SID>StripTrailingWhitespaces()
  autocmd FileType ruby setlocal commentstring=#\ %s
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
  autocmd Filetype python setlocal ai
  autocmd Filetype python setlocal shiftwidth=4
  autocmd Filetype python setlocal tabstop=4
  autocmd Filetype python setlocal sta
  autocmd Filetype python setlocal expandtab
  autocmd Filetype python setlocal fo=croql
augroup END

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

set ffs=unix,dos,mac " Default file types



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
    set gfn=Consolas:h9:cANSI
    set backspace=2
  endif
endif

if has('mac')
  let g:Tex_ViewRule_pdf = "open -a Skim"

  if has('gui_running')
    set transparency=1
    set guifont=Inconsolata-g\ for\ Powerline:h13
    set guioptions-=r
  endif


  " Make yanking work
  " http://vim.wikia.com/wiki/Mac%5FOS%5FX%5Fclipboard%5Fsharing
  set clipboard=unnamed
endif
