
call plug#begin("~/.config/nvim/plugged")
source ~/.config/nvim/plugins.vim

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

au BufRead,BufNewFile *.es6 set filetype=javascript

" Rust Autocmplete Configs
"let g:racer_cmd = "/home/jonathan/.multirust/toolchains/beta/cargo/bin/racer"
"let $RUST_SRC_PATH = "/home/jonathan/.multirust/toolchains/beta/cargo/registry/src/github.com-0a35038f75765ae4"
