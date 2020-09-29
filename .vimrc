set nocompatible              " be iMproved, required
filetype off                  " required
set shell=/bin/bash
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/ZoomWin'
Plugin 'Lokaltog/vim-powerline'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-git'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/syntastic'
Plugin 'beyondwords/vim-twig'
Plugin 'sjl/clam.vim'
Plugin 'groenewege/vim-less'
Plugin 'nono/vim-handlebars'
Plugin 'vim-scripts/nginx.vim'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'garbas/vim-snipmate'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'rust-lang/rust.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'elixir-lang/vim-elixir'
Plugin 'tpope/vim-endwise'
Plugin 'mxw/vim-jsx'
Plugin 'keith/swift.vim'
Plugin 'cespare/vim-toml'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
set mouse=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
" Set encoding
set encoding=utf-8

" Backup and swap files
"set backupdir=~/.vim/backup//
"set directory=~/.vim/temp//

" More accessible leader key
let mapleader = '<'

" Markdown shortcuts
nnoremap <Leader>= yypVr=o<Esc>
nnoremap <Leader>- yypVr-o<Esc>

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <space> :nohlsearch<cr>

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Default colorscheme to solarized
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
highlight clear SignColumn
set cursorline

" Whitespace stuff
set nowrap
set expandtab
set backspace=indent,eol,start
set list
set listchars=tab:\ \ ,trail:·,nbsp:_,extends:>,precedes:<

" 4 spaces tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Move easily between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Avoid 'escaping' from home row
imap jj <Esc>

" Powerline
let g:Powerline_symbols = 'compatible'

" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = 0 " don’t manage working directory
let g:ctrlp_switch_buffer = 'et' " don't jump if the buffer is not in the current tab

" Vimux
map <Leader>vt :call VimuxRunCommand("clear; make test")<CR>
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>

" NERDTree
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
