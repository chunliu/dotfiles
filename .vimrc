" use vim-plug for plugin manager
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

call plug#end()

set background=dark
colorscheme gruvbox

syntax enable
syntax on
set number
set cursorline
set tabstop=4
set autoindent
set shiftwidth=4
set hlsearch

" config cursor shape. 
let &t_SI.="\e[5 q"	" Insert mode - blinking vertical bar
let &t_SR.="\e[4 q" " Replace mode - solid underscore
let &t_EI.="\e[1 q" " Normal mode - blinking block
