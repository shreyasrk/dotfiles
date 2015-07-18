" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype indent plugin on
syntax on

" Plugins to fire for Folder Structure within VIM
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

" Plugins to fire for respective languages
autocmd FileType javascript map <buffer> <F4> :JSHint<CR>
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>  

" Vim settings
set nofoldenable
set background=dark
set backspace=2
set number
