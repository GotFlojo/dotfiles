" vim: foldmethod=marker
"===================================================================================
"GENERAL SETTINGS {{{1
"===================================================================================
"-------------------------------------------------------------------------------
" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
"-------------------------------------------------------------------------------
set nocompatible

"-------------------------------------------------------------------------------
"Vundle Plugin Management {{{2
"------------------------------------------------------------------------------
filetype off
" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call plug#begin()
call plug#begin('~/.config/nvim/plugged')


" General
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
" Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'zirrostig/vim-schlepp'
"Plug 'kien/ctrlp.vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'

" Vim HardMode disables cursor keys and hjkl
Plug 'wikitopian/hardmode'

" Programming
Plug 'tpope/vim-fugitive'
" Plug 'scrooloose/syntastic'
" Plug 'neomake/neomake'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
" Plug 'valloric/youcompleteme'

" Python
Plug 'nvie/vim-flake8'
Plug 'davidhalter/jedi-vim'

" C/CP
"Plug 'C'

" Clojure
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'bhurlow/vim-parinfer'
Plug 'kovisoft/paredit',  { 'for': ['clojure', 'scheme', 'racket'] }
" Plug 'losingkeys/vim-niji'

" Erlang
Plug 'jimenezrick/vimerl'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'mattreduce/vim-mix'

" Haskell
Plug 'lukerandall/haskellmode-vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' } |Plug 'Shougo/vimproc.vim', { 'do': 'make' } |  Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'

" HTML
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'

" Javascript
Plug 'pangloss/vim-Javascript'

" Rust
Plug 'rust-lang/rust.vim'

" Color schemes "
Plug 'noahfrederick/vim-hemisu'
" Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'altercation/vim-colors-solarized'
Plug 'hukl/Smyck-Color-Scheme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required


"}}}
" Vim5 and later versions support syntax highlighting. Uncommenting the next line enables syntax highlighting by default.
" Switch syntax highlighting on.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
 if has('gui_running')
     set background=light
 else
     set background=dark
 endif

"-------------------------------------------------------------------------------
" Colors {{{2
"-------------------------------------------------------------------------------
" if has("termguicolors")
"      set termguicolors
" endif
"}}}
"let g:solarized_termcolors=256
colorscheme solarized


" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
"-------------------------------------------------------------------------------
" Enable file type detection. Use the default filetype settings.
" Also load indent files, to automatically do language-dependent indenting.
"-------------------------------------------------------------------------------
if has("autocmd")
  filetype on
  filetype plugin on
  filetype indent on
endif


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"-------------------------------------------------------------------------------
" Various settings {{{2
"-------------------------------------------------------------------------------
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite		            " Automatically save before commands like :next and :make
set ai
set backspace=indent,eol,start  " backspacing over everything in insert mode
set backup                      " keep a backup file
set browsedir=current           " which directory to use for the file browser
set completeopt=menuone,longest,preview
set complete+=k                 " scan the files given with the 'dictionary' option
set cpoptions+=$                " mark end of change region with $-sign
set expandtab                   " replace tabs with spaces
" set foldmethod=indent
set foldlevel=99
set foldlevelstart=0            " fold everything by default 
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental search:
set hidden                      " Hide buffers when they are abandoned
set ignorecase		            " Do case insensitive matching
set incsearch		            " Incremental search
set laststatus=2               " Always show status line
set listchars=tab:▸-,trail:·,extends:»,precedes:«,nbsp:×,eol:¬
set mouse=a		                " Enable mouse usage (all modes) in terminal1
"set nowrap                      " do not wrap line
set number
set ruler                       " show the cursor position all the time
set cursorline                  " highlight the line the cursor is on
set shiftwidth=4                " number of spaces to use for each step of indent
set softtabstop=4
set showcmd		                " Show (partial) command in status line.
set showmatch		            " Show matching brackets.
set smartcase                   " Do smart case matching
set smartindent                 " smart autoindenting when starting a new line
set tabstop=4
set textwidth=80
set visualbell                  " visual bell instead of beeping
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
set wrap
set linebreak
" note trailing space at end of next line
set showbreak=>\ \ \

if has("autocmd")
" Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

    " Delete empty space from the end of lines on every save
    "autocmd BufWritePre * :s/\s\+$//e

    " Clojure
    autocmd BufRead,BufNewFile *.{cljs,boot} setlocal filetype=clojure
endif

"------------------------------------------------------------------------------
" set greprpg to whatever we have available
"------------------------------------------------------------------------------
if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
    let g:ctrlp_user_command = 'rg %s --files --hidden --glob "!.git/*"'
    let g:ctrlp_use_caching = 0
elseif executable('sift')
    set grepprg=sift\ -nMs\ --no-color\ --binary-skip\ --column\ --no-group\ --git\ --follow
    set grepformat=%f:%l:%c:%m
elseif executable('ag')
    set grepprg=ag\ --vimgrep\ --ignore=\"**.min.js\"
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
elseif executable('ack')
    set grepprg=ack\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif



set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},   " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc},  " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
"set statusline+=%{synIDattr(synID(line('.'), col('.'), 1), 'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-18.(Line:%l\/%L\ Col:%c%V%)\ %<%P        " offset

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

"===================================================================================
" Buffers, Splits, Windows {{{1
"===================================================================================
"
"-------------------------------------------------------------------------------
" Change the working directory to the directory containing the current file
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif " has("autocmd")
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
" Leave the editor with Ctrl-q : Write all changed buffers and exit Vim
"-------------------------------------------------------------------------------
"nmap  <C-q>    :wqa<CR>
"
"===============================================================================
" Key Mappings {{{1
"===============================================================================
" Set the <Leader> key to comma
let mapleader=","
" Use jj as Escape in insert mode
inoremap jj <Esc> 
"-------------------------------------------------------------------------------
" comma always followed by a space
"-------------------------------------------------------------------------------
inoremap  ,  ,<Space>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Make split navigation easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap / /\v
vnoremap / /\v
if exists(":nohls")
  nnoremap <silent> <Leader>h :nohls<CR>
endif

map <silent> <Leader>f :Files ../<CR>
map <silent> <Leader>li :set list!<CR>
"-------------------------------------------------------------------------------
" Fast switching between buffers {{{2
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
"-------------------------------------------------------------------------------
"
map  <silent> <s-tab>  <Esc>:if &modifiable && !&readonly &&
     \                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
imap  <silent> <s-tab>  <Esc>:if &modifiable && !&readonly &&
     \                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"
" autocomplete parenthesis, brackets and braces {{{2
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
" autocomplete quotes (visual and select mode) {{{2
"-------------------------------------------------------------------------------
xnoremap  '  s''<Esc>P<Right>
xnoremap  "  s""<Esc>P<Right>
xnoremap  `  s``<Esc>P<Right>
"
"-------------------------------------------------------------------------------
" folding {{{2
"-------------------------------------------------------------------------------

" Space to toggle fold
nnoremap <Space> za
vnoremap <Space> za
"
"
"-------------------------------------------------------------------------------
" line numbers {{{2
"-------------------------------------------------------------------------------
nnoremap  <Leader>nr :call Toggle_numbering()<CR>
"-------------------------------------------------------------------------------
" Toggle function {{{3
"-------------------------------------------------------------------------------
function! Toggle_numbering() abort
    if exists('+relativenumber')
        execute {
              \ '00': 'set relativenumber   | set number',
              \ '01': 'set norelativenumber | set number',
              \ '10': 'set norelativenumber   | set nonumber',
              \ '11': 'set norelativenumber | set number' }[&number .  &relativenumber]
    else
        " No relative numbers just toggle on and off
        set number!<CR>
    endif
endfunction

"===============================================================================
" Plugins {{{1
"===============================================================================

"-------------------------------------------------------------------------------
" airline {{{2
"-------------------------------------------------------------------------------
let g:airline_theme='solarized'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#bufferline#enabled=1
let g:airline_section_y='%{strlen(&fenc)?&fenc:&enc},[%{&fileformat}][%b,0x%B]'
let g:airline_section_z='%P : %l/%L: %c%V'

"-------------------------------------------------------------------------------
" NERDCommenter {{{2
"-------------------------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

"-------------------------------------------------------------------------------
" NERDTree {{{2
"-------------------------------------------------------------------------------
map <Leader>nt :NERDTreeToggle<CR>

"------------------------------------------------------------------------------
" syntastic {{{2
"------------------------------------------------------------------------------
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1

" let g:syntastic_cpp_compiler_options="-std=c++11 -Wall -Wextra"
" let g:syntastic_cpp_compiler_options = '-std=c++0x'

" let g:syntastic_javascript_checkers = ['eslint', 'jshint', 'flow']

"------------------------------------------------------------------------------
" Schlepp {{{2
"------------------------------------------------------------------------------
" vmap <unique> <up>    <Plug>SchleppUp
" vmap <unique> <down>  <Plug>SchleppDown
" vmap <unique> <left>  <Plug>SchleppLeft
" vmap <unique> <right> <Plug>SchleppRight

"------------------------------------------------------------------------------
" Neomake {{{2
"------------------------------------------------------------------------------
" Gross hack to stop Neomake running when exitting because it creates a zombie cargo check process
" which holds the lock and never exits. But then, if you only have QuitPre, closing one pane will
" disable neomake, so BufEnter reenables when you enter another buffer.
" let s:quitting = 0
" au QuitPre *.rs let s:quitting = 1
" au BufEnter *.rs let s:quitting = 0
" au BufWritePost *.rs if ! s:quitting | Neomake | else | echom "Neomake disabled"| endif
let g:neomake_warning_sign = {'text': '?'}

"------------------------------------------------------------------------------
" deoplete {{{2
"------------------------------------------------------------------------------
" install python3 interface with pip3 install neovim
let g:deoplete#enable_at_startup=1

"------------------------------------------------------------------------------
" haskell_doc.vim {{{2
"------------------------------------------------------------------------------
let g:haddock_browser='open'
let g:haddock_browser_callformat = '%s %s'

"------------------------------------------------------------------------------
" Rust / Racer {{{2
"------------------------------------------------------------------------------
set hidden
let g:racer_cmd = "/Users/flojo/.cargo/bin/racer"
let g:racer_experimental_completer = 1

