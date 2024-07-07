" Common file to dump all your plugins. Remember these should be sourced in
" your .vimrc file
" Uses vim-plug. So enable/install vim-plug. Code to fetch vim-plug is already
" in the current .vimrc file
"
" Syntax - Plug '<github-user>/<github-repo>'
"
" For more plugins - https://vimawesome.com
" This folder must be available - else vim will create it and maintain
call plug#begin('~/.vim_runtime/my_plugins/plugged')

" The Git gutter - shows git diff within the file in real-time
Plug 'airblade/vim-gitgutter'

" Localized editor config
Plug 'editorconfig/editorconfig-vim'

" Show status line in a much better and lucid fashion
Plug 'itchyny/lightline.vim'

" Fuzzy file finder. Works only on current directory. Be smart to open vim
" appropriately
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Dynamic completions from shorthand expressions
Plug 'mattn/emmet-vim'

" Who doesn't want a folder tree structure!
Plug 'scrooloose/nerdtree'

" Pick and replace a single word across the file. Similar to File-> 'Replace All'
Plug 'terryma/vim-multiple-cursors'

" Unix-file operations as vim commands - :Mv, :Cp, ...
Plug 'tpope/vim-eunuch'

" Special character completion - Brackets/quotes/..
Plug 'tpope/vim-surround'

" Show errors/warnings in a separate tab
Plug 'w0rp/ale'

" Magic of colors in your vim!
Plug 'flazz/vim-colorschemes'

" Go plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()
