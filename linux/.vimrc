set nocompatible              " be iMproved, required for vundle
filetype off                  " required for vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'bruno-/vim-man'

" Language support
Plugin 'derekwyatt/vim-scala'
Plugin 'kchmck/vim-coffee-script'
Plugin 'AGhost-7/vim-nwscript'
Plugin 'wting/rust.vim'
Plugin 'VimClojure'

" Some color schemes
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

" Enable mouse control
set mouse=a

" Enable custom color theme
set t_Co=256
colorscheme monokai

" Make it highlight red when I go beyond 80 lines.
match Error /\%91v.\+/

" Add a alias for NERDTree
noreabbrev tree NERDTree
