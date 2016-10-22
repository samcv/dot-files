set nocompatible

colorscheme quantum
set encoding=utf-8     "Encoding displayed
set fileencoding=utf-8 "Encoding written
set smartindent
set showmode
set cursorline     " Show a line across on the current cursor line
syntax on           " Syntax highlighting
set laststatus=2    " Always display the status line
set wildmenu        " Show auto complete menus
set visualbell      " Use visual bell instead of beeping
" Set invisible characters
set listchars=tab:▸\ ,eol:¬,space:·
set showmatch        " Show matching brackets/parenthesis
set incsearch       " Search as you type
set hlsearch        " Hilight searches
set ignorecase      " Ignore case when searching
set smartcase       " Enable case sensitivity when searching with capitals
"set nobackup        " Disable backup files
"set noswapfile      " Disable swap files
set autoindent      " Inherit indentation from previous line
set smartindent     " Use newline autoindentation
filetype plugin indent on
" Show existing tab with 4 spaces width
set tabstop=4
" Set history to 1000.  Default is 20
set history=1000
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
"set expandtab
" Show line numbers
set number
