"--------------------------------------
" Vundle config
" https://github.com/gmarik/Vundle.vim
"--------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"--------------------------------------
" Vundle plugin commands
"
" Brief Vundle help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ"
"
" Keep Plugin commands between vundle#begin/end.
"--------------------------------------

" Solarized plugin
" http://ethanschoonover.com/solarized/vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'

"--------------------------------------
" All of your Plugins must be added before the following line
"--------------------------------------
call vundle#end()            " required

"--------------------------------------
" After vundle setup
" Put your non-Plugin stuff after this line
"--------------------------------------
filetype plugin indent on 	" turn filetype back on, required


"--------------------------------------
" Set visual aspects
"--------------------------------------
" Set color scheme
syntax enable
set background=dark
colorscheme solarized

" Highlight current line
set cursorline
" Enable line numbers
set number
" Show the cursor position
set ruler
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title