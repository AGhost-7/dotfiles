" ---------------
" General Plugins
" ---------------

" Directory search tool
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Man pages in vim
Plug 'bruno-/vim-man'

" Autocomplete interface
" Required:
" ./install.py --tern-completer
Plug 'Valloric/YouCompleteMe'

" Fuzzy file name searcher
Plug 'kien/ctrlp.vim'

" Adds the ability to close all except the current buffer
Plug 'BufOnly.vim'

" Powerline doesn't work on neovim
Plug 'vim-airline/vim-airline'

" Add some themes for airline
Plug 'vim-airline/vim-airline-themes'

" General purpose syntax checker, run `npm install -g jshint` to install js 
" support. `npm install -g coffeelint` for coffeescript, etc.
Plug 'scrooloose/syntastic'

" ------------------------
" Language Support Plugins
" ------------------------

" With my docker-dev project I don't need as many of these anymore...
"Plug 'derekwyatt/vim-scala'
"Plug 'kchmck/vim-coffee-script'
"Plug 'AGhost-7/vim-nwscript'
"Plug 'wting/rust.vim'
"Plug 'racer-rust/vim-racer'
"Plug 'VimClojure'
"Plug 'ensime/ensime-vim' " scala plugin

" Better javascript indentation
Plug 'pangloss/vim-javascript'

" support for react.js inline html
"Plug 'mxw/vim-jsx'

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
