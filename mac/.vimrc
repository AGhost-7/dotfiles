syntax on

" ~~ Vundle ~~
set nocompatible              " be iMproved, required
filetype off                  " vundle required

set rtp+=~/.vim/bundle/Vundle.vim

" Calling this is required for Vundle to install the plugins automatically for
" you.
call vundle#begin()

" Vundle Plugins
Plugin 'gmarik/Vundle.vim'

" Better file system browser
Plugin 'scrooloose/nerdtree'

" Better syntax support for js
Plugin 'jelera/vim-javascript-syntax'

" Nice style
Plugin 'crusoexia/vim-monokai'

" Dust.js support
Plugin 'jimmyhchan/dustjs.vim'

" Syntax support for editing markdown files.
Plugin 'tpope/vim-markdown'

" Syntax checker, run `npm install -g jshint` to install js support.
Plugin 'scrooloose/syntastic'

" Better javascript indentation
Plugin 'pangloss/vim-javascript'

" Add HTML5 support, also enables web components support.
Plugin 'othree/html5.vim'

" Add autocomplete support
Plugin 'Valloric/YouCompleteMe'

" Fuzzy file name searcher
Plugin 'kien/ctrlp.vim'

" Syntax checker
Plugin 'jshint.vim'

" Adds the ability to close all except the current buffer
Plugin 'BufOnly.vim'

" Type inference engine, will enhance autocompletion, etc.
Plugin 'marijnh/tern_for_vim'

call vundle#end()            " vundle required
filetype plugin indent on    " vundle required

" ~~ Vundle End ~~

" Don't convert tabs to spaces!
set noexpandtab

" Set tabs to take two character spaces
set tabstop=2

" Set how many characters indentation should be. This will ensure that you're
" using tabs, not spaces.
set shiftwidth=2

" Highlights the characters which go beyond 100 lines to the color which
" correspond to the Error color of your color theme.
match Error /\%101v.\+/

" Add the column number
set ruler

" Display the row numbers (line number)
set relativenumber

" Will search the file as you type your query
set incsearch

" Enable mouse support!
set mouse=a

" gonna want that nice color.
colorscheme monokai

" Add a mapping for the NERDTree command, so you can just type :tree to open
" it.
"cnoreabbrev tree NERDTree
command T NERDTree

" This will close the current buffer without closing the window
command Bd bp|bd #

" Buffer delete all others (delete all except current one)
command Bdo BufOnly

nmap <C-Left> <Esc>:bp!<CR>
nmap <C-Right> <Esc>:bn!<CR>

"map <C>a :echo 'hello world'<CR>

" Make copy paste command use the operating system register by default.
set clipboard=unnamed

" I don't want search results form node_modules in the fuzzy searcher
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](node_modules|\.git)$'
	\ }

" Automatically close the file pane when I opend a file
let NERDTreeQuitOnOpen=1

" Load up powerline
set rtp +=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
set laststatus=2

set t_Co=256
