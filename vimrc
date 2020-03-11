"--------------------------------------
" basic settings
"--------------------------------------

" don't bother with vi compatibility
set nocompatible
" set backspace key
set bs=eol,start,indent
" don't keep backup file
set nobackup
" function key timeout 
set ttimeout 
set ttimeoutlen=100
" set pastetoggle
set pastetoggle=<F2>

"-------------------------------------
" display settings
"-------------------------------------

" show the current row and column
set ruler
" highlight current row
set cursorline
" show line number
set number
" no wrap
" set nowrap
" wrap the line properly
set linebreak
" display imcomplete command
set showcmd
" display current mode
set showmode
" jump to matches when entering parentheses
set showmatch
set matchtime=2
" set backgroud to dark
set background=dark

"-------------------------------------
" search settings
"-------------------------------------

" ignore case
set ignorecase
" if uppercase present, don't ignore
set smartcase
" highlight searches
set hlsearch
" do incremental searching, search as you type
set incsearch

"------------------------------------
" encoding
"------------------------------------
if has('multi_byte')
	" encoding used by vim
	set encoding=utf-8
	" file encoding
	set fileencoding=utf-8
	" encoding list
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif
" wrap for multi byte encoding 
set formatoptions+=m
" Don't add whitespace for multi byte encoding
set formatoptions+=B
" file format
set ffs=unix,dos,mac

"------------------------------------
" auto indent for file types
"------------------------------------
if has('autocmd')
	filetype plugin indent on
endif
" set autoindent
set autoindent smartindent shiftround
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

"------------------------------------
" syntax
"------------------------------------
if has('syntax')  
	syntax enable 
	syntax on 
endif

"-------------------------------------
" folding
"-------------------------------------
if has('folding')
	set foldenable
	set fdm=indent
	set foldlevel=99
endif

"------------------------------------
" cursor shap in Windows Terminal
"------------------------------------
let &t_SI.="\e[5 q" " Insert mode - blinking vertical bar
let &t_SR.="\e[4 q" " Replace mode - solid underscore
let &t_EI.="\e[1 q" " Normal mode - blinking block

"------------------------------------
" file type specific
"------------------------------------
augroup FiletypeGroup
    au!
    " for yaml file, set tab to 2
    au BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
    au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

"------------------------------------
" load other modules
"------------------------------------
" get the current folder
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
" define a command to load scripts
command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'
"exec 'set rtp+='.s:home
"set rtp+=~/.vim
LoadScript vim/init-plugins.vim
