" nice rules and formatting
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler

" set terminal for colors
set term=screen-256color

" make backspace work like normal
set backspace=indent,eol,start

" whitespace
set listchars=eol:¬,tab:>·,trail:·,extends:>,precedes:<
set list

" set ruler at line 80 for progs
set colorcolumn=80

" highlight for column and comments
highlight Comment     ctermfg=green
highlight ColorColumn ctermbg=grey

" fix the color difference between tmux and plain zsh
set background=dark
