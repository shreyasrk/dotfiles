" See Nerdtree docs - https://github.com/preservim/nerdtree/blob/master/README.markdown
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" NERDTree Settings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Let Nerdtree show all files
let NERDTreeShowHidden=1

" Vim UI settings
set nobackup
set nowb
set noswapfile
set noerrorbells

set mouse=a
set ttymouse=xterm2
set so=999
set clipboard=unnamedplus
set wildmenu

if has('mac')
    set clipboard=unnamed
endif

" Appearance "

syntax enable

set number
set relativenumber
set linespace=12

set title
set titlestring=%F\ -\ vim
set noshowmode
set laststatus=2

set background=dark

" File behaviour "

set expandtab
set smarttab
set linebreak
set breakindent
set nostartofline

set shiftwidth=4
set tabstop=4

" Search "

set smartcase
set hlsearch
set incsearch

" Panes "

set splitbelow
set splitright


