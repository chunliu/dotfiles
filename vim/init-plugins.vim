"------------------------------------
" load all plug-ins
"------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'aserebryakov/vim-todo-lists'
Plug 'preservim/nerdtree'
call plug#end()

colorscheme gruvbox
" Todo list plugin, don't move items.
let g:VimTodoListsMoveItems = 0
" open NERDTree
noremap <space>nn :NERDTree<cr>
