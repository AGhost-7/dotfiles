
let s:is_oni = exists("g:gui_oni")

call plug#begin("~/.config/nvim/plugged")

" ---------------
" General Plugins
" ---------------

" Directory search tool
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

if ! s:is_oni
	" Fuzzy file name searcher
	Plug 'kien/ctrlp.vim'
endif

" Adds the ability to close all except the current buffer
Plug 'BufOnly.vim'

" Note taking.
Plug 'junegunn/vim-journal'

" Powerline doesn't work on neovim
Plug 'vim-airline/vim-airline'

" Add some themes for airline
Plug 'vim-airline/vim-airline-themes'

" General purpose syntax checker, run `npm install -g jshint` to install js 
" support. `npm install -g coffeelint` for coffeescript, etc.
Plug 'scrooloose/syntastic'

" Dims code.
Plug 'junegunn/limelight.vim'

" Minimalist mode.
Plug 'junegunn/goyo.vim'

" Better javascript indentation
Plug 'pangloss/vim-javascript'

" Add HTML5 support, also enables web components support.
Plug 'othree/html5.vim'

" Syntax support for editing markdown files.
Plug 'tpope/vim-markdown'

" Color theme
Plug 'crusoexia/vim-monokai'

" Git integration
Plug 'tpope/vim-fugitive'

call plug#end()

" Tab shizzle
set tabstop=2
set shiftwidth=2
set smartindent
" don't convert tabs to spaces!
set noexpandtab

" Search as you type the query
set incsearch

"show row numbers
set relativenumber

" Enable mouse control
set mouse=a

" Enable custom color theme
if ! s:is_oni
	set t_Co=256
	silent! colorscheme monokai
endif

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
if ! s:is_oni
	let g:airline_powerline_fonts = 1
endif

let g:NERDTreeMouseMode = 2

" Set the theme for vim-airline
autocmd VimEnter * AirlineTheme powerlineish

" Enable marker based folding
set foldmethod=marker

set nofoldenable
