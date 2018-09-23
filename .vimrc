"===================================================================================
" GENERAL SETTINGS
"===================================================================================

"-------------------------------------------------------------------------------
" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
"-------------------------------------------------------------------------------
set nocompatible

"-------------------------------------------------------------------------------
"Vundle Plugin Management
"------------------------------------------------------------------------------
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively,  pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle,  required
Plugin 'gmarik/Vundle.vim'

" General
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'

" Vim HardMode disables cursor keys and hjkl
Plugin 'wikitopian/hardmode'

" Programming
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'valloric/youcompleteme'

" Python
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'

" C/CP
"Plugin 'C'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-fireplace'
Plugin 'bhurlow/vim-parinfer'
Plugin 'amdt/vim-niji'

" Erlang
Plugin 'jimenezrick/vimerl' 

" Elixir
Plugin 'elixir-lang/vim-elixir'
Plugin 'mattreduce/vim-mix'

" HTML
Plugin 'mattn/emmet-vim'
Plugin 'ap/vim-css-color'

" Javascript
Plugin 'pangloss/vim-Javascript'

" Rust
Plugin 'rust-lang/rust.vim'

" Latex
Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'

" Color schemes "
Plugin 'noahfrederick/vim-hemisu'
Plugin 'altercation/vim-colors-solarized'
Plugin 'hukl/Smyck-Color-Scheme'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
" Various settings
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
set foldmethod=indent
set foldlevel=99
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental search
set hidden                      " Hide buffers when they are abandoned
set ignorecase		            " Do case insensitive matching
set incsearch		            " Incremental search
set laststatus=2                " Always show status line
"set listchars=tab:▸\ , eol:¬
set mouse=a		                " Enable mouse usage (all modes) in terminal1
set nowrap                      " do not wrap line
set number
set ruler                       " show the cursor position all the time
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

if has("autocmd")
" Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
endif

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap jj <Esc>
          
" Set the <Leader> key to comma
let mapleader=","

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
" BUFFERS, WINDOWS
"===================================================================================
"
"-------------------------------------------------------------------------------
" Change the working directory to the directory containing the current file
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif " has("autocmd")
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
" airline
"-------------------------------------------------------------------------------
let g:airline_theme='solarized'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#bufferline#enabled=1
let g:airline_section_y='%{strlen(&fenc)?&fenc:&enc},[%{&fileformat}][%b,0x%B]'
let g:airline_section_z='%P : %l/%L: %c%V'

"------------------------------------------------------------------------------
" syntastic
"------------------------------------------------------------------------------
let g:syntastic_cpp_compiler_options="-std=c++11 -Wall -Wextra"
"let g:syntastic_cpp_compiler_options = '-std=c++0x'

"------------------------------------------------------------------------------
" RainbowParethesis
"------------------------------------------------------------------------------
"RainbowParethesisActivate
