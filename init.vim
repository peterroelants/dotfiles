call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'

Plug 'preservim/nerdcommenter'

Plug 'preservim/nerdtree'

call plug#end()

"--------------------------------------
" Config section
"--------------------------------------


"--------------------------------------
" Set visual aspects
"--------------------------------------
" Set colorsheme
syntax enable

let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
set t_Co=256
let g:gruvbox_termcolors = 256

" Powerline
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

"--------------------------------------
" Character sets
"--------------------------------------
" Set utf8 as standard encoding
set fileencoding=utf-8
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart indent
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab
" Match parentheses
set showmatch

" Auto indentation
set autoindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line numbers and status bar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight current line
set cursorline
"hi CursorLine gui=underline
" Enable line numbers
set number
" Show the cursor position
set ruler
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Set linenumbers
set number
" enable mouse
set mouse=a
" ensures that statusline shows up even if you don’t have any split
set laststatus=2
