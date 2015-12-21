
call plug#begin("~/.config/nvim/plugged")

" ---------------
" General Plugins
" ---------------

Plug 'scrooloose/nerdtree'
" Directory search tool
Plug 'Xuyuanp/nerdtree-git-plugin'

" Man pages in vim
Plug 'bruno-/vim-man'

" Autocomplete
Plug 'Valloric/YouCompleteMe'

" Fuzzy file name searcher
Plug 'kien/ctrlp.vim'

" Adds the ability to close all except the current buffer
Plug 'BufOnly.vim'

" Powerline doesn't work on neovim
Plug 'bling/vim-airline'

" General purpose syntax checker, run `npm install -g jshint` to install js 
" support. `npm install -g coffeelint` for coffeescript, etc.
Plug 'scrooloose/syntastic'

" ------------------------
" Language Support Plugins
" ------------------------

Plug 'derekwyatt/vim-scala'
Plug 'kchmck/vim-coffee-script'
Plug 'AGhost-7/vim-nwscript'
Plug 'wting/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'VimClojure'
Plug 'ensime/ensime-vim' " scala plugin

" Better javascript indentation
Plug 'pangloss/vim-javascript'

" Type inference engine, will enhance autocompletion, etc.
Plug 'marijnh/tern_for_vim'

" support for react.js inline html
Plug 'mxw/vim-jsx'

" Add HTML5 support, also enables web components support.
Plug 'othree/html5.vim'

" Syntax support for editing markdown files.
Plug 'tpope/vim-markdown'

" ------------------
" Some color schemes
" ------------------

Plug 'vim-scripts/C64.vim'
Plug 'vim-scripts/PaperColor.vim'
Plug 'crusoexia/vim-monokai'

call plug#end()

" Tab shizzle
set tabstop=2
set shiftwidth=2
set smartindent
" don't convert tabs to spaces!
set noexpandtab

set ruler

" Search as you type the query
set incsearch

"show row numbers
set relativenumber

" Enable mouse control
set mouse=a

" Enable custom color theme
set t_Co=256
silent! colorscheme monokai

" Make it highlight red when I go beyond 80 lines.
"match Error /\%91v.\+/
" Add a bar which marks the 80th character
set colorcolumn=80

" Add a alias for NERDTree
command T NERDTree

" Close the current buffer without closing the window.
command Bd bp|bd #

" Buffer delete all others (delete all except current one)
command Bdo BufOnly

" Send to system clipboard by default
set clipboard=unnamedplus

" CtrlP ignore node_modules by default to make searching faster
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](node_modules|\.git)$'
	\ }

" Enable the powerline fonts.
let g:airline_powerline_fonts = 1

" Set the theme for vim-airline
autocmd VimEnter * AirlineTheme powerlineish

" Rust Autocmplete Configs
let g:racer_cmd = "/home/jonathan/.multirust/toolchains/beta/cargo/bin/racer"
let $RUST_SRC_PATH = "/home/jonathan/.multirust/toolchains/beta/cargo/registry/src/github.com-0a35038f75765ae4"
