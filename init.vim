
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
Plug 'vim-scripts/BufOnly.vim'

" Note taking.
Plug 'junegunn/vim-journal'

" Powerline doesn't work on neovim
Plug 'vim-airline/vim-airline'

" Add some themes for airline
Plug 'vim-airline/vim-airline-themes'

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
Plug 'jacoborus/tender.vim'

" Git integration
Plug 'tpope/vim-fugitive'

" Github integration
Plug 'tpope/vim-rhubarb'

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
	set background=dark
	" Enable true colour mode
	set termguicolors
	silent! colorscheme tender
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

let g:NERDTreeMouseMode = 3

" Show the buffers at the top
let g:airline#extensions#tabline#enabled = 1

" Show the buffer numbers so I can `:b 1`, etc
let g:airline#extensions#tabline#buffer_nr_show = 1

" Aside from the buffer number, I literally just need the file name, so
" strip out extraneous info.
let g:airline#extensions#tabline#fnamemod = ':t'

" Set the theme for vim-airline
autocmd VimEnter * AirlineTheme tender

" Use spaces instead just for yaml
autocmd Filetype yaml setl expandtab

" Enable marker based folding
set foldmethod=marker

set nofoldenable

" netrw file browser customizations
let g:netrw_banner=0 " disable banner
let g:netrw_browse_split=4 " Open in prior window
let g:netrw_altv=1 " open splits to the right
let g:netrw_liststyle=3 " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
