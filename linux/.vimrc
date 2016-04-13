set nocompatible              " be iMproved, required for vundle
filetype off                  " required for vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" --------
" General
" --------

Plugin 'scrooloose/nerdtree'
" Directory search tool
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Man pages in vim
Plugin 'bruno-/vim-man'

" Autocomplete
Plugin 'Valloric/YouCompleteMe'

" Fuzzy file name searcher
Plugin 'kien/ctrlp.vim'

" Adds the ability to close all except the current buffer
Plugin 'BufOnly.vim'
"Plugin 'bling/vim-airline'
"Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" -----------------
" Language support
" -----------------

Plugin 'derekwyatt/vim-scala'
Plugin 'kchmck/vim-coffee-script'
Plugin 'AGhost-7/vim-nwscript'
Plugin 'wting/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'VimClojure'
Plugin 'ensime/ensime-vim' " scala plugin

" Syntax checker, run `npm install -g jshint` to install js support.
Plugin 'scrooloose/syntastic'

" Better javascript indentation
Plugin 'pangloss/vim-javascript'

" Type inference engine, will enhance autocompletion, etc.
Plugin 'marijnh/tern_for_vim'

" support for react.js inline html
Plugin 'mxw/vim-jsx'

" -------------------
" Some color schemes
" -------------------

Plugin 'vim-scripts/C64.vim'
Plugin 'vim-scripts/PaperColor.vim'
Plugin 'crusoexia/vim-monokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required for vundle
filetype plugin indent on    " required for vundle

" Tab shizzle
set tabstop=2
set shiftwidth=2
set smartindent

set ruler

" Search as you type the query
set incsearch

"show row numbers
set relativenumber

" Enable mouse control
set mouse=a

" Enable custom color theme
set t_Co=256
colorscheme monokai

" Make it highlight red when I go beyond 80 lines.
"match Error /\%91v.\+/
" Add a bar which marks the 80th character
set colorcolumn=80

" Add a alias for NERDTree
"noreabbrev tree NERDTree
command T NERDTree
command Bd bp|bd #

" Send to system clipboard by default
set clipboard=unnamedplus

" CtrlP ignore node_modules by default to make searching faster
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](node_modules|\.git)$'
	\ }

" Enable the powerline binding for the status line, needs to be installed
" using pip
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

let g:racer_cmd = "/home/jonathan/.multirust/toolchains/beta/cargo/bin/racer"
let $RUST_SRC_PATH = "/home/jonathan/.multirust/toolchains/beta/cargo/registry/src/github.com-0a35038f75765ae4"
