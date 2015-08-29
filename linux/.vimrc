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
Plugin 'bruno-/vim-man'

" Autocomplete
Plugin 'Valloric/YouCompleteMe'

" Fuzzy file name searcher
Plugin 'kien/ctrlp.vim'

" Adds the ability to close all except the current buffer
Plugin 'BufOnly.vim'


" -----------------
" Language support
" -----------------

Plugin 'derekwyatt/vim-scala'
Plugin 'kchmck/vim-coffee-script'
Plugin 'AGhost-7/vim-nwscript'
Plugin 'wting/rust.vim'
Plugin 'VimClojure'

" Syntax checker, run `npm install -g jshint` to install js support.
Plugin 'scrooloose/syntastic'

" Better javascript indentation
Plugin 'pangloss/vim-javascript'

" Type inference engine, will enhance autocompletion, etc.
Plugin 'marijnh/tern_for_vim'


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
set nu

" Enable mouse control
set mouse=a

" Enable custom color theme
set t_Co=256
colorscheme monokai

" Make it highlight red when I go beyond 80 lines.
match Error /\%91v.\+/

" Add a alias for NERDTree
"noreabbrev tree NERDTree
command T NERDTree
command Bd bp|bd #

" Send to system clipboard by default
set clipboard=unnamed

" CtrlP ignore node_modules by default to make searching faster
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](node_modules|\.git)$'
	\ }