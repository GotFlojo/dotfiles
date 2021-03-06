"===================================================================================
" GENERAL SETTINGS
"===================================================================================

"-------------------------------------------------------------------------------
" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
"-------------------------------------------------------------------------------
set nocompatible

" Set 256 color mode coz what the heck
"set t_Co=256
"-------------------------------------------------------------------------------
"Vundle Plugin Management
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"------------------------------------------------------------------------------
filetype off
call plug#begin()

" General
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'

" Vim HardMode disables cursor keys and hjkl
Plug 'wikitopian/hardmode'

" Programming
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
"Plug 'valloric/youcompleteme'

" Python
Plug 'nvie/vim-flake8'
Plug 'davidhalter/jedi-vim'

" C/CP
"Plug 'C'

" Clojure
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-fireplace'
Plug 'bhurlow/vim-parinfer'
Plug 'amdt/vim-niji'

" Erlang
Plug 'jimenezrick/vimerl' 

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'mattreduce/vim-mix'

" HTML
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'

" Javascript
Plug 'pangloss/vim-Javascript'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" Color schemes "
Plug 'noahfrederick/vim-hemisu'
Plug 'altercation/vim-colors-solarized'
Plug 'hukl/Smyck-Color-Scheme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'jacoborus/tender'
Plug 'rakr/vim-one'
Plug 'mkarmona/colorsbox'


" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required


" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"-------------------------------------------------------------------------------
" Switch syntax highlighting on.
"-------------------------------------------------------------------------------
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
 if has('gui_running')
     set background=light
 else
     set background=dark
 endif

"set colorscheme if putty or tmux because solarized does not seem to work well with these
 if &term == "putty-256color" || &term == "screen-256color"
    silent! colorscheme PaperColor
    "silent! let g:airline_theme='papercolor'
 else
    silent! colorscheme solarized
    "silent! let g:airline_theme='solarized'
 endif


"-------------------------------------------------------------------------------
" Various settings {{{2
"-------------------------------------------------------------------------------
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " Automatically save before commands like :next and :make
set ai
set backspace=indent,eol,start  " backspacing over everything in insert mode
set backup                      " keep a backup file
if has('linebreak')
  set breakindent               " indent wrapped lines to match start
endif
set browsedir=current           " which directory to use for the file browser
set completeopt=menuone,longest,preview
set complete+=k                 " scan the files given with the 'dictionary' option
set cpoptions+=$                " mark end of change region with $-sign
set cursorline                  " highlight the line the cursor is on
set expandtab                   " replace tabs with spaces
" set foldmethod=indent
set foldlevel=99
set foldlevelstart=0            " fold everything by default 
" if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j          " remove comment leader when joining comment lines
" endif
set formatoptions+=n            " smart auto-indenting inside numbered lists
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlight the last used search pattern
set hidden                      " Hide buffers when they are abandoned
set ignorecase                  " Do case insensitive matching
set incsearch                   " do incremental search:
set incsearch                   " Incremental search
set laststatus=2                " Always show status line
set lazyredraw                  " don't bother updating screen during macro playback
if has('linebreak')
  set linebreak                 " wrap long lines at characters in 'breakat'
endif
set list                        " Show whitespace
set listchars=tab:▸-
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:×
set listchars+=eol:¬
set mouse=a                     " Enable mouse usage (all modes) in terminal1
"set nowrap                     " do not wrap line
set nojoinspaces                " don't autoinsert two spaces after '.', '?', '!' for join command
set number
if exists('+relativenumber')
  set relativenumber                  " show relative numbers in gutter
endif
set ruler                       " show the cursor position all the time
set scrolloff=3                 " start scrolling 3 lines before edge of viewport
set shiftround                  " always indent by multiple of shiftwidth
set shiftwidth=2                " number of spaces to use for each step of indent
"set showbreak=>\ \ \
if has('linebreak')
  let &showbreak='⤷ '           " ARROW POINTING DOWNWARDS THEN CURVING RIGHTWARDS (U+2937, UTF-8: E2 A4 B7)
endif
if has('showcmd')
  set showcmd                   " Show (partial) command in status line.
endif
set showmatch                   " Show matching brackets.
set sidescrolloff=3             " same as scolloff, but for columns
set smartcase                   " Do smart case matching
set smartindent                 " smart autoindenting when starting a new line
"set softtabstop=4
if v:progname !=# 'vi'
  set softtabstop=-1            " use 'shiftwidth' for tab/bs at end of line
endif
set switchbuf=usetab            " try to reuse windows/tabs when switching buffers
set tabstop=2
set textwidth=80
set visualbell                  " visual bell instead of beeping
if has('virtualedit')
  set virtualedit=block         " allow cursor to move where there is no text in visual block mode
endif
set wildcharm=<C-z>             " substitue for 'wildchar' (<Tab>) in macros
if has('wildignore')
  set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
endif
if has('wildmenu')
  set wildmenu                  " show options as list when switching buffers etc
endif
set wildmode=longest:full,full  " shell-like autocomplete to unambiguous portion


if has("autocmd")
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

  " Clojure
  autocmd BufRead,BufNewFile *.{cljs,boot} setlocal filetype=clojure

  " Turn on spellchecking if we are in a git commit buffer
  autocmd FileType gitcommit setlocal spell
"
  " Change the working directory to the directory containing the current file
  " autocmd BufEnter * :lchdir %:p:h
endif

"------------------------------------------------------------------------------
" set greprpg to whatever we have available
"------------------------------------------------------------------------------
if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
  if exists("g:loaded_ctrlp")
    let g:ctrlp_user_command = 'rg %s --files --hidden --glob "!.git/*"'
    let g:ctrlp_use_caching = 0
  endif
elseif executable('sift')
  set grepprg=sift\ -nMs\ --no-color\ --binary-skip\ --column\ --no-group\ --git\ --follow
  set grepformat=%f:%l:%c:%m
elseif executable('ag')
  set grepprg=ag\ --vimgrep\ --ignore=\"**.min.js\"
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  if exists("g:loaded_ctrlp")
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif
elseif executable('ack')
  set grepprg=ack\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif


"------------------------------------------------------------------------------
" setup statusline  {{{2
"------------------------------------------------------------------------------
set statusline=                                     " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                             " buffer number
set statusline+=%f\                                 " file name
set statusline+=%h%m%r%w                            " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},         " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc},        " encoding
set statusline+=%{&fileformat}]                     " file format
set statusline+=%=                                  " right align
" set statusline+=%{synIDattr(synID(line('.'), col('.'), 1), 'name')}\ " highlight
set statusline+=%b,0x%-8B\                          " current cha
set statusline+=%-18.(Line:%l\/%L\ Col:%c%V%)\ %<%P " offset



inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap jj <Esc>
"
" Set the <Leader> key to comma
let mapleader=","


"===================================================================================
" BUFFERS, WINDOWS
"===================================================================================
"
"-------------------------------------------------------------------------------
" close window (conflicts with the KDE setting for calling the process manager)
"-------------------------------------------------------------------------------
 noremap  <C-Esc>       :close<CR>
inoremap  <C-Esc>  <C-C>:close<CR>
"
"
"-------------------------------------------------------------------------------
" Leave the editor with Ctrl-q (KDE): Write all changed buffers and exit Vim
"-------------------------------------------------------------------------------
"nnoremap  <C-q>    :wqall<CR>
"
"-------------------------------------------------------------------------------
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif " has("autocmd")
"
"-------------------------------------------------------------------------------
"  some additional hot keys
"-------------------------------------------------------------------------------
"    F2   -  write file without confirmation
"    F3   -  call file explorer Ex
"    F4   -  show tag under curser in the preview window (tagfile must exist!)
"    F5   -  open quickfix error window
"    F6   -  close quickfix error window
"    F7   -  display previous error
"    F8   -  display next error
"-------------------------------------------------------------------------------
"
map   <silent> <F2>        :write<CR>
map   <silent> <F3>        :Explore<CR>
nmap  <silent> <F4>        :exe ":ptag ".expand("<cword>")<CR>
map   <silent> <F5>        :copen<CR>
map   <silent> <F6>        :cclose<CR>
map   <silent> <F7>        :cp<CR>
map   <silent> <F8>        :cn<CR>
"
imap  <silent> <F2>   <Esc>:write<CR>
imap  <silent> <F3>   <Esc>:Explore<CR>
imap  <silent> <F4>   <Esc>:exe ":ptag ".expand("<cword>")<CR>
imap  <silent> <F5>   <Esc>:copen<CR>
imap  <silent> <F6>   <Esc>:cclose<CR>
imap  <silent> <F7>   <Esc>:cp<CR>
imap  <silent> <F8>   <Esc>:cn<CR>
"
"-------------------------------------------------------------------------------
" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
"-------------------------------------------------------------------------------
"
 map  <silent> <s-tab>  <Esc>:if &modifiable && !&readonly &&
     \                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
imap  <silent> <s-tab>  <Esc>:if &modifiable && !&readonly &&
     \                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"
"-------------------------------------------------------------------------------
" Leave the editor with Ctrl-q : Write all changed buffers and exit Vim
"-------------------------------------------------------------------------------
"nmap  <C-q>    :wqa<CR>
"
"-------------------------------------------------------------------------------
" comma always followed by a space
"-------------------------------------------------------------------------------
inoremap  ,  ,<Space>
"
"
"
map <Leader>nt :NERDTreeToggle<CR>


"-------------------------------------------------------------------------------
" autocomplete parenthesis, brackets and braces
"-------------------------------------------------------------------------------
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
"
"vnoremap ( s()<Esc>P<Right>%
"vnoremap [ s[]<Esc>P<Right>%
"vnoremap { s{}<Esc>P<Right>%
"
"-------------------------------------------------------------------------------
" autocomplete quotes (visual and select mode)
"-------------------------------------------------------------------------------
xnoremap  '  s''<Esc>P<Right>
xnoremap  "  s""<Esc>P<Right>
xnoremap  `  s``<Esc>P<Right>
"
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" airline {{{2
"-------------------------------------------------------------------------------
if &runtimepath =~ 'vim-airline' 
  " let g:airline_theme='solarized'
  let g:airline#extensions#branch#enabled=1
  let g:airline#extensions#bufferline#enabled=1
  let g:airline_section_y='%{strlen(&fenc)?&fenc:&enc},[%{&fileformat}][%b,0x%B]'
  let g:airline_section_z='%P : %l/%L: %c%V'
endif

"-------------------------------------------------------------------------------
" NERDCommenter {{{2
"-------------------------------------------------------------------------------
"if exists("g:NERDSpaceDelims")
if exists("g:loaded_nerd_comments")
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1

  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1
endif

"-------------------------------------------------------------------------------
" NERDTree {{{2
"-------------------------------------------------------------------------------
map <Leader>nt :NERDTreeToggle<CR>

"------------------------------------------------------------------------------
" syntastic
"------------------------------------------------------------------------------
"let g:syntastic_cpp_compiler_options="-std=c++11 -Wall -Wextra"
"let g:syntastic_cpp_compiler_options = '-std=c++0x'

"------------------------------------------------------------------------------
" RainbowParethesis
"------------------------------------------------------------------------------
"RainbowParethesisActivate

"------------------------------------------------------------------------------
" Rust / Racer {{{2
"------------------------------------------------------------------------------
if &runtimepath =~ 'rust.vim'
  let g:racer_cmd = "/Users/flojo/.cargo/bin/racer"
  let g:racer_experimental_completer = 1
endif
