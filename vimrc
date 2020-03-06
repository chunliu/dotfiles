" use vim-plug for plugin manager
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'aserebryakov/vim-todo-lists'

call plug#end()

set background=dark
colorscheme gruvbox

syntax enable
syntax on
" wrap the line properly
set linebreak
set number
set cursorline
set tabstop=4
set autoindent
set shiftwidth=4
set hlsearch
" If search string contains only lowercase letters search is case insensitive.
" If search string contains capital letters search is case sensative
set ignorecase
set smartcase

" config cursor shape. 
let &t_SI.="\e[5 q"	" Insert mode - blinking vertical bar
let &t_SR.="\e[4 q" " Replace mode - solid underscore
let &t_EI.="\e[1 q" " Normal mode - blinking block
" Todo list plugin, don't move items.
let g:VimTodoListsMoveItems = 0
